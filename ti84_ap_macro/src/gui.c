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
static const int num_search_terms = NUM_TERMS;

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
  print_centered("AP MACROECONOMICS ENGINE", 120);
  print_centered("v2.0", 140);
  gfx_SetTextFGColor(100); // Grey text for build string
  print_centered("Build: " __DATE__ " " __TIME__, 160);
  gfx_SwapDraw();
  delay(1500); // 1.5 second delay
}

void gui_terms_loop(APStatsDB *db, char *search_buffer, int *buf_len, bool *show_result, int *active_tab) {
  int selected_in_page = 0;
  int page = 0;
  int rows = 15; // Reduced to make room for jump bar
  int cols = 2;
  int terms_per_page = rows * cols;
  int max_pages = (num_search_terms + terms_per_page - 1) / terms_per_page;
  bool redraw = true;
  bool in_jump_bar = false;
  int selected_letter = 0; // 0: A, 1: B, ...

  while (true) {
    if (redraw) {
      gfx_FillScreen(dark_mode ? 0 : 255);
      gfx_SetTextBGColor(dark_mode ? 0 : 255);
      gfx_SetTextTransparentColor(dark_mode ? 0 : 255);

      // Header
      gfx_SetColor(dark_mode ? 255 : 0);
      gfx_FillRectangle(0, 0, 320, 20);
      gfx_SetTextFGColor(dark_mode ? 0 : 255);
      gfx_PrintStringXY("Glossary - [ALPHA] to Jump", 5, 6);

      // Alphabetical Jump Bar
      int jump_y = 22;
      for (int i = 0; i < 26; i++) {
          int jx = 5 + (i * 12);
          char l[2] = {'A' + i, '\0'};
          if (in_jump_bar && selected_letter == i) {
              gfx_SetColor(dark_mode ? 150 : 180);
              gfx_FillRectangle(jx - 2, jump_y - 2, 10, 11);
              gfx_SetTextFGColor(dark_mode ? 255 : 0);
          } else {
              gfx_SetTextFGColor(dark_mode ? 180 : 100);
          }
          gfx_PrintStringXY(l, jx, jump_y);
      }

      int start_idx = page * terms_per_page;
      for (int i = 0; i < terms_per_page; i++) {
        int idx = start_idx + i;
        if (idx >= num_search_terms) break;

        int r = i % rows;
        int c = i / rows;
        int x = 15 + (c * 155);
        int y = 40 + (r * 12);

        if (!in_jump_bar && i == selected_in_page) {
          gfx_SetColor(dark_mode ? 100 : 200);
          gfx_FillRectangle(x - 5, y - 2, 145, 12);
          gfx_SetTextFGColor(dark_mode ? 255 : 0);
        } else {
          gfx_SetTextFGColor(dark_mode ? 200 : 80);
        }

        char term_buf[25];
        strncpy(term_buf, search_terms[idx], 20);
        term_buf[20] = '\0';
        if (strlen(search_terms[idx]) > 20) strcat(term_buf, "..");
        gfx_PrintStringXY(term_buf, x, y);
      }

      // Footer
      gfx_SetColor(dark_mode ? 255 : 0);
      gfx_HorizLine(0, 222, 320);
      char page_str[32];
      sprintf(page_str, "Page %d of %d", page + 1, max_pages);
      gfx_SetTextFGColor(dark_mode ? 255 : 0);
      gfx_PrintStringXY(page_str, 220, 226);
      
      gfx_SwapDraw();
      redraw = false;
    }

    kb_Scan();
    uint8_t key = os_GetCSC();

    if (key == sk_Clear) {
      break;
    } else if (key == sk_Down) {
      if (in_jump_bar) {
          in_jump_bar = false;
          selected_in_page = 0;
      } else if (selected_in_page < terms_per_page - 1 && (page * terms_per_page + selected_in_page + 1) < num_search_terms) {
        selected_in_page++;
      } else if (page < max_pages - 1) {
        page++;
        selected_in_page = 0;
      }
      redraw = true;
    } else if (key == sk_Up) {
      if (!in_jump_bar && selected_in_page < cols) {
          in_jump_bar = true;
      } else if (!in_jump_bar) {
          selected_in_page--;
      } else if (page > 0) {
          page--;
          selected_in_page = terms_per_page - 1;
      }
      redraw = true;
    } else if (key == sk_Left) {
      if (in_jump_bar) {
          if (selected_letter > 0) selected_letter--;
      } else if (selected_in_page >= rows) {
          selected_in_page -= rows;
      }
      redraw = true;
    } else if (key == sk_Right) {
      if (in_jump_bar) {
          if (selected_letter < 25) selected_letter++;
      } else if (selected_in_page < rows && (page * terms_per_page + selected_in_page + rows) < num_search_terms) {
          selected_in_page += rows;
      }
      redraw = true;
    } else if (key == sk_Enter) {
      if (in_jump_bar) {
          char target = 'a' + selected_letter;
          // Jump to first term starting with target
          for (int i = 0; i < num_search_terms; i++) {
              if (search_terms[i][0] >= target) {
                  page = i / terms_per_page;
                  selected_in_page = i % terms_per_page;
                  in_jump_bar = false;
                  break;
              }
          }
      } else {
        int idx = page * terms_per_page + selected_in_page;
        strcpy(search_buffer, search_terms[idx]);
        *buf_len = strlen(search_buffer);
        return; 
      }
      redraw = true;
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
  const char *status = "Type keyword and press ENTER.";
  const char *title, *c_str, *f_str, *k_str, *i_str, *t_str;
  size_t title_len, c_len, f_len, k_len, i_len, t_len;
  bool show_result = false;
  int active_tab = 0;

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

  const char *trivia[] = {"Trivia: GDP = C + I + G + (X - M)",
                          "Trivia: The Fed controls the money supply.",
                          "Trivia: Inflation hurts lenders, helps borrowers.",
                          "Trivia: SRAS is upward sloping.",
                          "Trivia: M1 includes currency and checkable deposits."};
  int trivia_idx = rand() % 5;
  int search_count = 0;
  bool alpha_mode = true;

  while (true) {
    if (redraw) {
      if (stealth_mode) {
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
          gfx_PrintStringXY("AP Macroeconomics Lexical Search Engine", 10, 10);
          gfx_PrintStringXY(alpha_mode ? "[A]" : "[1]", 300, 10);
          gfx_PrintStringXY(status, 10, 30);
          gfx_PrintStringXY("Query: ", 10, 50);
          gfx_PrintStringXY(search_buffer, 60, 50);
          gfx_PrintStringXY("Press [MODE] to open Glossary", 10, 160);
          gfx_PrintStringXY("Press [GRAPH] to toggle Dark Mode", 10, 175);
          gfx_PrintStringXY("Press [STAT] for Stealth Mode", 10, 190);

          char count_str[32];
          sprintf(count_str, "Searches: %d", search_count);
          print_centered(count_str, 215);
          print_centered(trivia[trivia_idx], 230);
        } else {
          int content_y = 10;
          int max_render_y = 210;

          gfx_PrintStringXY("Title: ", 10, content_y);
          content_y += 10;
          content_y = print_compressed_string(10, content_y, 300, max_render_y, title, title_len);
          content_y += 5;

          // Fixed Tab Bar
          int tab_y = 225;
          gfx_SetColor(dark_mode ? 255 : 0);
          gfx_FillRectangle(0, tab_y - 5, 320, 20);
          gfx_SetTextFGColor(dark_mode ? 0 : 255);
          gfx_PrintStringXY(active_tab == 0 ? "[F1]RULE" : " F1Rule ", 5, tab_y);
          gfx_PrintStringXY(active_tab == 1 ? "[F2]FORM" : " F2Form ", 65, tab_y);
          gfx_PrintStringXY(active_tab == 2 ? "[F3]PROB" : " F3Prob ", 125, tab_y);
          gfx_PrintStringXY(active_tab == 3 ? "[F4]WORD" : " F4Word ", 185, tab_y);
          gfx_PrintStringXY(active_tab == 4 ? "[F5]CALC" : " F5Calc ", 245, tab_y);
          
          // Logic for help text
          // (active_tab == 2) -> Example problems
          // (active_tab == 3) -> FRQ Wording guide

          gfx_SetTextFGColor(dark_mode ? 255 : 0);
          gfx_SetTextBGColor(dark_mode ? 0 : 255);

          const char *data_ptr;
          size_t data_len;
          switch (active_tab) {
            case 0: data_ptr = c_str; data_len = c_len; break;
            case 1: data_ptr = f_str; data_len = f_len; break;
            case 2: data_ptr = k_str; data_len = k_len; break;
            case 3: data_ptr = i_str; data_len = i_len; break;
            case 4: data_ptr = t_str; data_len = t_len; break;
            default: data_ptr = ""; data_len = 0; break;
          }
          print_compressed_string(10, content_y, 300, max_render_y, data_ptr, data_len);
        }
      }
      gfx_SwapDraw();
      redraw = false;
    }

    kb_Scan();
    uint8_t key = os_GetCSC();

    if (key == sk_Stat) {
      stealth_mode = !stealth_mode;
      redraw = true;
      continue;
    }

    if (stealth_mode) continue;

    if (show_result) {
      if (key == sk_Clear) {
        show_result = false;
        search_buffer[0] = '\0';
        buf_len = 0;
        status = "Type keyword and press ENTER.";
        trivia_idx = rand() % 5;
        redraw = true;
      } else if (key == sk_Yequ) { active_tab = 0; redraw = true; }
      else if (key == sk_Window) { active_tab = 1; redraw = true; }
      else if (key == sk_Zoom) { active_tab = 2; redraw = true; }
      else if (key == sk_Trace) { active_tab = 3; redraw = true; }
      else if (key == sk_Graph) { active_tab = 4; redraw = true; }
      else if (key == sk_Right && active_tab < 4) { active_tab++; redraw = true; }
      else if (key == sk_Left && active_tab > 0) { active_tab--; redraw = true; }
    } else {
      if (key == sk_Clear) {
        if (buf_len > 0) {
          buf_len = 0;
          search_buffer[0] = '\0';
          status = "Type keyword and press ENTER.";
          redraw = true;
        } else break;
      } else if (key == sk_Enter && buf_len > 0) {
        // Synonym expansion
        if (strcmp(search_buffer, "sd") == 0) strcpy(search_buffer, "deviation");
        else if (strcmp(search_buffer, "ci") == 0) strcpy(search_buffer, "confidence");
        else if (strcmp(search_buffer, "df") == 0) strcpy(search_buffer, "degrees");
        else if (strcmp(search_buffer, "ho") == 0) strcpy(search_buffer, "null");
        else if (strcmp(search_buffer, "ha") == 0) strcpy(search_buffer, "alternative");

        // Lowercase for hashing/searching
        for (int i = 0; search_buffer[i]; i++) search_buffer[i] = tolower(search_buffer[i]);

        uint8_t branch, node;
        if (find_best_node(db->index_ptr, db->num_keywords, search_buffer, &branch, &node)) {
          if (get_node_data(db, branch, node, &title, &title_len, &c_str, &c_len, &f_str, &f_len, &k_str, &k_len, &i_str, &i_len, &t_str, &t_len)) {
            show_result = true;
            search_count++;
            
            // Smart Tab Selection
            active_tab = 0; // Default to Rule
            if (c_len > 3) active_tab = 0;
            else if (f_len > 3) active_tab = 1;
            else if (k_len > 3) active_tab = 2;
            else if (i_len > 3) active_tab = 3;
            else if (t_len > 3) active_tab = 4;
            
          } else status = "Error loading node data.";
        } else {
          status = "Keyword not found. Try again.";
          search_buffer[0] = '\0';
          buf_len = 0;
        }
        redraw = true;
      } else if (key == sk_Alpha) { alpha_mode = !alpha_mode; redraw = true; }
      else if (key == sk_2nd) { alpha_mode = false; redraw = true; }
      else if (key == sk_Mode) {
        gui_terms_loop(db, search_buffer, &buf_len, &show_result, &active_tab);
        if (buf_len > 0) {
          // Trigger search after selecting from glossary
          uint8_t branch, node;
          if (find_best_node(db->index_ptr, db->num_keywords, search_buffer, &branch, &node)) {
            if (get_node_data(db, branch, node, &title, &title_len, &c_str, &c_len, &f_str, &f_len, &k_str, &k_len, &i_str, &i_len, &t_str, &t_len)) {
              show_result = true;
              search_count++;
              
              // Smart Tab Selection
              active_tab = 0;
              if (c_len > 3) active_tab = 0;
              else if (f_len > 3) active_tab = 1;
              else if (k_len > 3) active_tab = 2;
              else if (i_len > 3) active_tab = 3;
              else if (t_len > 3) active_tab = 4;
            }
          }
        }
        redraw = true;
      }
      else if (key == sk_Graph) { dark_mode = !dark_mode; redraw = true; }
      else if (key == sk_Del && buf_len > 0) {
        search_buffer[--buf_len] = '\0';
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
