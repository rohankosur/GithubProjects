#ifndef GUI_H
#define GUI_H

#include "appvar_manager.h"

void gui_init(void);
void gui_cleanup(void);
void gui_splash(void);
void gui_search_loop(APStatsDB *db);

#endif // GUI_H
