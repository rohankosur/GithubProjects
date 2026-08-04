#ifndef GUI_H
#define GUI_H

#include "appvar_manager.h"
#include <stdbool.h>

void gui_init(void);
void gui_cleanup(void);
void gui_splash(void);
void gui_terms_loop(APStatsDB *db, char *search_buffer, int *buf_len, bool *show_result, int *active_tab);
void gui_search_loop(APStatsDB *db);

#endif // GUI_H
