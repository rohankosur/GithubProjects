#include <tice.h>
#include <ti/getcsc.h>
#include <graphx.h>
#include "appvar_manager.h"
#include "gui.h"

APStatsDB g_db;

int main(void) {
    gui_init();
    gui_splash();

    if (!init_database(&g_db)) {
        gfx_FillScreen(255);
        gfx_PrintStringXY("Error: Failed to load STATDAT1", 10, 10);
        gfx_SwapDraw();
        while (os_GetCSC() != sk_Clear);
    } else {
        gui_search_loop(&g_db);
    }

    close_database(&g_db);
    gui_cleanup();
    return 0;
}
