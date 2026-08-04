#include "gui.h"
#include "compress.h"
#include "terms_data.h"
#include <ctype.h>
#include <graphx.h>
#include <keypadc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/timers.h>
#include <ti/getcsc.h>

bool dark_mode = false;
bool stealth_mode = false;

void gui_init(void) {
  gfx_Begin();
  gfx_SetDrawBuffer();
  gfx_SetTextFGColor(0);
  gfx_SetTextBGColor(255);
  gfx_SetTextTransparentColor(255);
}

void gui_cleanup(void) { gfx_End(); }

void print_centered(const char *str, int y) {
  int width = gfx_GetStringWidth(str);
  gfx_PrintStringXY(str, (320 - width) / 2, y);
}

void gui_splash(void) {
  gfx_FillScreen(0);
  gfx_SetTextFGColor(255);
  print_centered("ANTIGRAVITY", 100);
  print_centered("AP STATISTICS ENGINE", 120);
  print_centered("v2.0", 140);
  gfx_SetTextFGColor(100); // Grey text for build string
  print_centered("Build: " __DATE__ " " __TIME__, 160);
  gfx_SwapDraw();
  delay(1500); // 1.5 second delay
}

void gui_terms_loop(void) {
  int page = 0;
  int terms_per_page = 3 * 18; // 3 columns, 18 rows = 54 terms
  int max_pages = (num_search_terms + terms_per_page - 1) / terms_per_page;
  bool redraw = true;

  while (true) {
    if (redraw) {
      gfx_FillScreen(dark_mode ? 0 : 255);
      gfx_SetTextBGColor(dark_mode ? 0 : 255);
      gfx_SetTextTransparentColor(dark_mode ? 0 : 255);
      gfx_SetTextFGColor(dark_mode ? 255 : 0); // Primary text

      // Header
      gfx_SetColor(dark_mode ? 255 : 0);
      gfx_FillRectangle(0, 0, 320, 20);
      gfx_SetTextFGColor(dark_mode ? 0 : 255); // Inverse text for header
      gfx_PrintStringXY("Glossary - [CLEAR] to exit, [UP]/[DOWN] scroll", 5, 6);

      gfx_SetTextFGColor(dark_mode ? 255 : 0); // Primary text for terms

      int start_idx = page * terms_per_page;
      int x = 10;
      int y = 30;

      for (int i = 0; i < terms_per_page; i++) {
        int idx = start_idx + i;
        if (idx >= num_search_terms)
          break;

        gfx_PrintStringXY(search_terms[idx], x, y);

        y += 11;
        if (y > 220) {
          y = 30;
          x += 100;
        }
      }

      // Footer with page number
      char page_str[32];
      sprintf(page_str, "Page %d of %d", page + 1, max_pages);
      gfx_SetTextFGColor(dark_mode ? 255 : 0);
      gfx_PrintStringXY(page_str, 220, 225);

      gfx_SwapDraw();
      redraw = false;
    }

    kb_Scan();
    uint8_t key = os_GetCSC();

    if (key == sk_Clear) {
      break;
    } else if (key == sk_Down) {
      if (page < max_pages - 1) {
        page++;
        redraw = true;
      }
    } else if (key == sk_Up) {
      if (page > 0) {
        page--;
        redraw = true;
      }
    }
  }
}

// Simple text entry using the Alpha keys (assuming lowercase mapping for
// hashing) For simplicity in this prototype, we'll just demonstrate the search
// logic using a hardcoded query or a simplified input loop.
void gui_search_loop(APStatsDB *db) {
  char search_buffer[40] = "";
  int buf_len = 0;
  bool redraw = true;

  // Status text
  const char *status = "Type keyword and press ENTER.";

  // Result pointers
  const char *title, *c_str, *f_str, *k_str, *i_str, *t_str;
  size_t title_len, c_len, f_len, k_len, i_len, t_len;
  bool show_result = false;
  int active_tab =
      0; // 0: Conditions, 1: Formulas, 2: Calculator, 3: Interpretations

  const char chars_normal[60] = {
      [sk_0] = '0',      [sk_1] = '1',     [sk_2] = '2',      [sk_3] = '3',
      [sk_4] = '4',      [sk_5] = '5',     [sk_6] = '6',      [sk_7] = '7',
      [sk_8] = '8',      [sk_9] = '9',     [sk_Add] = '+',    [sk_Sub] = '-',
      [sk_Mul] = '*',    [sk_Div] = '/',   [sk_DecPnt] = '.', [sk_Comma] = ',',
      [sk_LParen] = '(', [sk_RParen] = ')'};

  const char chars_alpha[60] = {
      [sk_Math] = 'a',   [sk_Apps] = 'b',  [sk_Prgm] = 'c',   [sk_Recip] = 'd',
      [sk_Sin] = 'e',    [sk_Cos] = 'f',   [sk_Tan] = 'g',    [sk_Power] = 'h',
      [sk_Square] = 'i', [sk_Comma] = 'j', [sk_LParen] = 'k', [sk_RParen] = 'l',
      [sk_Div] = 'm',    [sk_Log] = 'n',   [sk_7] = 'o',      [sk_8] = 'p',
      [sk_9] = 'q',      [sk_Mul] = 'r',   [sk_Ln] = 's',     [sk_4] = 't',
      [sk_5] = 'u',      [sk_6] = 'v',     [sk_Sub] = 'w',    [sk_Store] = 'x',
      [sk_1] = 'y',      [sk_2] = 'z',     [sk_0] = ' '};

  const char *trivia[] = {"Trivia: Proportions use z-tests, means use t-tests.",
                          "Trivia: Never accept the null hypothesis!",
                          "Trivia: Context is required for full credit.",
                          "Trivia: Extrapolation is dangerous!",
                          "Trivia: 'S' is the SD of the residuals."};
  int trivia_idx = rand() % 5;

  int search_count = 0;

  bool alpha_mode = true;

  while (true) {
    if (redraw) {
      if (stealth_mode) {
        // Fake home screen
        gfx_FillScreen(255);
        gfx_SetTextFGColor(0);
        gfx_PrintStringXY("2+2", 5, 5);
        gfx_PrintStringXY("             4", 5, 20);
        gfx_PrintStringXY("Ans*10", 5, 35);
        gfx_PrintStringXY("            40", 5, 50);
        gfx_PrintStringXY("_", 5, 65);
      } else {
        gfx_FillScreen(dark_mode ? 0 : 255);
        gfx_SetTextFGColor(dark_mode ? 255 : 0);
        gfx_SetTextBGColor(dark_mode ? 0 : 255);
        gfx_SetTextTransparentColor(dark_mode ? 0 : 255);

      if (!show_result) {
        gfx_PrintStringXY("AP Statistics Lexical Search Engine", 10, 10);
        gfx_PrintStringXY(alpha_mode ? "[A]" : "[1]", 300, 10);
        gfx_PrintStringXY(status, 10, 30);
        gfx_PrintStringXY("Query: ", 10, 50);
        gfx_PrintStringXY(search_buffer, 60, 50);
        gfx_PrintStringXY("Press [MODE] to open Glossary", 10, 160);
        gfx_PrintStringXY("Press [GRAPH] to toggle Dark Mode", 10, 175);
        gfx_PrintStringXY("Press [STAT] for the Panic Button", 10, 190);

        char count_str[32];
        sprintf(count_str, "Searches This Session: %d", search_count);
        print_centered(count_str, 215);

        // Draw trivia at the bottom
        gfx_SetTextFGColor(dark_mode ? 200 : 100); // Muted color
        print_centered(trivia[trivia_idx], 230);
        gfx_SetTextFGColor(dark_mode ? 255 : 0);
      } else {
        // Render the decompressed result
        int y = 10;
        gfx_PrintStringXY("Title: ", 10, y);
        y += 10;
        y = print_compressed_string(10, y, 300, title, title_len);
        y += 10;

        // Draw Tabs (Screen is 320px wide, so 64px per tab max)
        gfx_PrintStringXY(active_tab == 0 ? "[F1]COND" : " F1Cond ", 0, y);
        gfx_PrintStringXY(active_tab == 1 ? "[F2]FORM" : " F2Form ", 64, y);
        gfx_PrintStringXY(active_tab == 2 ? "[F3]CALC" : " F3Calc ", 128, y);
        gfx_PrintStringXY(active_tab == 3 ? "[F4]INFO" : " F4Info ", 192, y);
        gfx_PrintStringXY(active_tab == 4 ? "[F5]STEP" : " F5Step ", 256, y);

        // Draw an active underline beneath the selected tab
        gfx_SetColor(dark_mode ? 255 : 0);
        gfx_FillRectangle(active_tab * 64, y + 10, 64, 2);

        y += 15;

                const char *fb_cond = "No specific conditions are required for this concept.";
                const char *fb_form = "No specific formula is required. See the INFO tab.";
                const char *fb_calc = "No calculator shortcut exists for this topic.";
                const char *fb_step = "No tutorial available. See the INFO tab for details.";

                if (active_tab == 0) {
                    y = print_compressed_string(10, y, 300, c_len <= 3 ? fb_cond : c_str, c_len <= 3 ? strlen(fb_cond) : c_len);
                } else if (active_tab == 1) {
                    y = print_compressed_string(10, y, 300, f_len <= 3 ? fb_form : f_str, f_len <= 3 ? strlen(fb_form) : f_len);
                } else if (active_tab == 2) {
                    y = print_compressed_string(10, y, 300, k_len <= 3 ? fb_calc : k_str, k_len <= 3 ? strlen(fb_calc) : k_len);
                } else if (active_tab == 3) {
                    y = print_compressed_string(10, y, 300, i_str, i_len);
                } else if (active_tab == 4) {
                    y = print_compressed_string(10, y, 300, t_len <= 3 ? fb_step : t_str, t_len <= 3 ? strlen(fb_step) : t_len);
                }

        gfx_PrintStringXY("Press CLEAR to search again.", 10, 220);
      }
    }

      gfx_SwapDraw();
      redraw = false;
    }

    kb_Scan();
    uint8_t key = os_GetCSC();

    // Global stealth toggle (Moved to STAT key to avoid conflict with 'B')
    if (key == sk_Stat) {
      stealth_mode = !stealth_mode;
      redraw = true;
      continue;
    }

    if (stealth_mode)
      continue;

    if (show_result) {
      if (key == sk_Clear) {
        show_result = false;
        search_buffer[0] = '\0';
        buf_len = 0;
        status = "Type keyword and press ENTER.";
        trivia_idx = rand() % 5; // new trivia on back
        redraw = true;
      } else if (key == sk_Yequ) { // F1
        active_tab = 0;
        redraw = true;
      } else if (key == sk_Window) { // F2
        active_tab = 1;
        redraw = true;
      } else if (key == sk_Zoom) { // F3
        active_tab = 2;
        redraw = true;
      } else if (key == sk_Trace) { // F4
        active_tab = 3;
        redraw = true;
      } else if (key == sk_Graph) { // F5
        active_tab = 4;
        redraw = true;
      } else if (key == sk_Right) {
        if (active_tab < 4) {
          active_tab++;
          redraw = true;
        }
      } else if (key == sk_Left) {
        if (active_tab > 0) {
          active_tab--;
          redraw = true;
        }
      }
    } else {
      if (key == sk_Clear) {
        if (buf_len > 0) {
          buf_len = 0;
          search_buffer[0] = '\0';
          status = "Type keyword and press ENTER.";
          redraw = true;
        } else {
          break; // Exit app
        }
      } else if (key == sk_Enter) {
        if (strcmp(search_buffer, "antigravity") == 0) {
          gfx_FillScreen(0);
          gfx_SetTextFGColor(6); // Bright green
          print_centered("WAKE UP, NEO...", 100);
          print_centered("THE AP EXAM HAS YOU.", 120);
          gfx_SwapDraw();
          delay(3000);
          search_buffer[0] = '\0';
          buf_len = 0;
          redraw = true;
          continue;
        }

        // Idea #11: Keyword Synonyms
        if (strcmp(search_buffer, "sd") == 0)
          strcpy(search_buffer, "deviation");
        else if (strcmp(search_buffer, "ci") == 0)
          strcpy(search_buffer, "confidence");
        else if (strcmp(search_buffer, "df") == 0)
          strcpy(search_buffer, "degrees");
        else if (strcmp(search_buffer, "ho") == 0)
          strcpy(search_buffer, "null");
        else if (strcmp(search_buffer, "ha") == 0)
          strcpy(search_buffer, "alternative");

        // Hash and search
        uint32_t target_hash = djb2_hash(search_buffer);
        uint8_t branch, node;

        if (binary_search_keyword(db->index_ptr, db->num_keywords, target_hash,
                                  &branch, &node)) {
          if (get_node_data(db, branch, node, &title, &title_len, &c_str,
                            &c_len, &f_str, &f_len, &k_str, &k_len, &i_str,
                            &i_len, &t_str, &t_len)) {
            show_result = true;
            search_count++;
            // active_tab = 0; // Removed to implement Tab Memory (Idea #28)
          } else {
            status = "Error loading node data.";
          }
        } else {
          status = "Keyword not found. Try again.";
          search_buffer[0] = '\0';
          buf_len = 0;
        }
        redraw = true;
      } else if (key == sk_Alpha) {
        alpha_mode = !alpha_mode;
        redraw = true;
      } else if (key == sk_Mode) {
        gui_terms_loop();
        redraw = true;
      } else if (key == sk_Graph && !show_result) {
        dark_mode = !dark_mode;
        redraw = true;
      } else if (key == sk_Stat && !show_result) {
        strcpy(search_buffer, "panic");
        buf_len = 5;
        redraw = true;
      } else if (key == sk_Del && buf_len > 0) {
        buf_len--;
        search_buffer[buf_len] = '\0';
        redraw = true;
      } else if (key > 0 && key < 60 && buf_len < 19) {
        char c = alpha_mode ? chars_alpha[key] : chars_normal[key];
        if (c != '\0') {
          search_buffer[buf_len++] = c;
          search_buffer[buf_len] = '\0';
          redraw = true;
        }
      }
    }
  }
}
