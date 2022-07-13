/****************************************************************************/
/*                                 APPEARENCE                               */
/****************************************************************************/

static const unsigned int borderpx       = 1;
static const unsigned int snap           = 5;
static const unsigned int systraypinning = 0;
static const unsigned int systrayonleft  = 0;
static const unsigned int systrayspacing = 2;
static const int systraypinningfailfirst = 1;
static const int showsystray             = 1;
static const int showbar                 = 1;
static const int topbar                  = 0;
static const int user_bh                 = 20;
static const char *fonts[]               = {"JetBrainsMono Nerd Font:size=10"};

static const char dmenufont[]            = "JetBrainsMono Nerd Font:size=10";
static const char dmenu_height[]         = "5";
static const char dmenu_nb[]             = "#000000";
static const char dmenu_nf[]             = "#FFFFFF";
static const char dmenu_sb[]             = "#000000";
static const char dmenu_sf[]             = "#00FF00";

static const char col_fg[]               = "#3b3b3b";
static const char col_bg[]               = "#000000";
static const char col_fg_sel[]           = "#FFFFFF";
static const char col_bg_sel[]           = "#000000";
static const char col_border[]           = "#000000";
static const char col_border_sel[]       = "#FF0000";

static const char col_white[]            = "#FFFFFF";
static const char col_black[]            = "#000000";
static const char col_yellow[]           = "#FFFF00";
static const char col_red[]              = "#FF0000";

static const char *colors[][3]           = {
/*                     fg          bg           border                      */
	[SchemeNorm]   = { col_fg,     col_bg,      col_border },
	[SchemeSel]    = { col_fg_sel, col_bg_sel,  col_border_sel },
	[SchemeWarn]   = { col_black,  col_yellow,  col_red },
	[SchemeUrgent] = { col_white,  col_black,   col_border },
};

/****************************************************************************/
/*                                 AUTOSTART                                */
/****************************************************************************/

static const char *const autostart[] = {
    "slstatus", NULL,
    "nitrogen", "--restore", NULL,
	"lxsession", NULL,
	"dunst", NULL,
	"picom", NULL,
	"xset", "r", "rate", "200", "30", NULL,
	"setxkbmap",
        "-model", "pc105",
        "-layout", "us,ru,ua",
        "-option", "grp:win_space_toggle",
        "-option", "caps:ctrl_modifier", 
        NULL,
	NULL 
};

/****************************************************************************/
/*                                    TAGS                                  */
/****************************************************************************/

static const char *tags[] = {
             "web",   // 1
             "cmd",   // 2
             "doc",   // 3
             "msg",   // 4
             "mus",   // 5
             "vid",   // 6
             "gfx",   // 7
             "sys",   // 8
             "virt",  // 9
             "wine",  // 10
             "play",  // 11
             "recd",  // 12
             "kpxc",  // 13
             "torr",  // 14
             "emacs"  // 15
};

static const Rule rules[] = {
/*    class              inst  title          tag           float   monitor */
	{ "firefox",         NULL, NULL,          1 << 0,       0,      - 1     },

	{ "kitty",           NULL, NULL,          1 << 1,       0,      - 1     },
	{ "DBeaver",         NULL, NULL,          1 << 1,       0,      - 1     },
	{ "code-oss",        NULL, NULL,          1 << 1,       0,      - 1     },
	{ "GitKraken",       NULL, NULL,          1 << 1,       0,      - 1     },

	{ "okular",          NULL, NULL,          1 << 2,       0,      - 1     },
	{ "Zathura",         NULL, NULL,          1 << 2,       0,      - 1     },
	{ NULL,              NULL, "LibreOffice", 1 << 2,       0,      - 1     },

	{ "TelegramDesktop", NULL, NULL,          1 << 3,       0,      - 1     },
	{ "Skype",           NULL, NULL,          1 << 3,       0,      - 1     },
	{ "Thunderbird",     NULL, NULL,          1 << 3,       0,      - 1     },
	{ "Signal",          NULL, NULL,          1 << 3,       0,      - 1     },

	{ "cantata",         NULL, NULL,          1 << 4,       0,      - 1     },
	{ "deemix-gui",      NULL, NULL,          1 << 4,       0,      - 1     },

	{ "mpv",             NULL, NULL,          1 << 5,       1,      - 1     },
	{ "Popcorn-Time",    NULL, NULL,          1 << 5,       0,      - 1     },

	{ "Viewnior",        NULL, NULL,          1 << 6,       0,      - 1     },
	{ "Gimp",            NULL, NULL,          1 << 6,       0,      - 1     },
	{ "MyPaint",         NULL, NULL,          1 << 6,       0,      - 1     },
    
	{ "GParted",         NULL, NULL,          1 << 7,       0,      - 1     },
	{ "Thunar",          NULL, NULL,          1 << 7,       0,      - 1     },
	{ "Pcmanfm",         NULL, NULL,          1 << 7,       0,      - 1     },
	{ "VeraCrypt",       NULL, NULL,          1 << 7,       0,      - 1     },
	{ "GEdit",           NULL, NULL,          1 << 7,       0,      - 1     },

	{ "Virt-manager",    NULL, NULL,          1 << 8,       0,      - 1     },

	{ NULL,              NULL, "Wine",        1 << 9,       1,      - 1     },
	{ NULL,              NULL, "Winetricks",  1 << 9,       1,      - 1     },
	{ ".exe",            NULL, NULL,          1 << 9,       1,      - 1     },

	{ "Steam",           NULL, NULL,          1 << 10,      0,      - 1     },
	{ "Flashplayer",     NULL, NULL,          1 << 10,      0,      - 1     },

	{ "obs",             NULL, NULL,          1 << 11,      0,      - 1     },

	{ "KeePassXC",       NULL, NULL,          1 << 12,      0,      - 1     },

	{ "qBittorrent",     NULL, NULL,          1 << 13,      0,      - 1     },

	{ "Emacs",           NULL, NULL,          1 << 14,      0,      - 1     },
    /*                                  FLOATING                            */
	{ "Pavucontrol",     NULL, NULL,          0,            1,      - 1     },
	{ "Nitrogen",        NULL, NULL,          0,            1,      - 1     },
	{ "XTerm",           NULL, NULL,          0,            1,      - 1     },
	{ "Alacritty",       NULL, NULL,          0,            1,      - 1     },
	{ "Galculator",      NULL, NULL,          0,            1,      - 1     },
};

/****************************************************************************/
/*                                  LAYOUTS                                 */
/****************************************************************************/

static const float mfact     = 0.55; // master area size [0.05..0.95]
static const int nmaster     = 1;    // number of clients in master area
static const int resizehints = 1;    
static const int lockfullscreen = 1; 

static const Layout layouts[] = {
/*    symbol         layout                                                 */
	{ "[tile]",      tile    },    
	{ "[float]",     NULL    }, 
};

/****************************************************************************/
/*                                    MAPS                                  */
/****************************************************************************/

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static char dmenumon[2]       = "0"; /* manipulated in spawn() */
static const char *dmenucmd[] = { 
    "dmenu_run", "-b",
    "-m",  dmenumon,
    "-h",  dmenu_height,
    "-fn", dmenufont,
    "-nb", dmenu_nb,
    "-nf", dmenu_nf,
    "-sb", dmenu_sb,
    "-sf", dmenu_sf,
    NULL
};
static const char *emacsclient[]  = { "emacsclient -ca emacs", NULL };
static const char *termcmd[]      = { "kitty", NULL };
static const char *webcmd[]       = { "firefox", NULL };
static const char *mutecmd[]      = { "pactl", "set-sink-mute", "0", "toggle", NULL };
static const char *volucmd[]      = { "pactl", "set-sink-volume", "0", "+1%", NULL };
static const char *voldcmd[]      = { "pactl", "set-sink-volume", "0", "-1%", NULL };
static const char *mpctogglecmd[] = { "mpc", "--port = 8888", "toggle", NULL };
static const char *mpcnextcmd[]   = { "mpc", "--port = 8888", "next", NULL };
static const char *mpcprevcmd[]   = { "mpc", "--port = 8888", "prev", NULL };
static const char *powermenu[]    = { "bm-power", NULL };
static const char *screenshot[]   = { "bm-screenshot", NULL };
static const char *searchweb[]    = { "bm-search", NULL };

#include "movestack.c"
static Key keys[] = {
/*    	  mod                  key             func            arg          */
	{ MODKEY,              XK_d,           spawn,          {.v = dmenucmd}},
	{ MODKEY,              XK_Return,      spawn,          {.v = termcmd}},
	{ MODKEY,              XK_backslash,   spawn,          {.v = webcmd}},
	{ MODKEY,              XK_e,           spawn,          {.v = emacsclient }},
	{ MODKEY,              XK_j,           focusstack,     {.i = +1 }},
	{ MODKEY,              XK_k,           focusstack,     {.i = -1 }},
    	{ MODKEY,              XK_h,           setmfact,       {.f = -0.01}},
	{ MODKEY,              XK_l,           setmfact,       {.f = +0.01}},
	{ MODKEY,              XK_BackSpace,   setlayout,      {0}},
	{ MODKEY,              XK_f,           togglefloating, {0}},
	{ MODKEY,              XK_Right,       viewnext,       {0}},
	{ MODKEY,              XK_Left,        viewprev,       {0}},
	{ MODKEY,              XK_Tab,         viewnext,       {0}},

	{ MODKEY|Mod1Mask,     XK_i,           spawn,          {.v = volucmd}},
	{ MODKEY|Mod1Mask,     XK_d,           spawn,          {.v = voldcmd}},
	{ MODKEY|Mod1Mask,     XK_m,           spawn,          {.v = mutecmd}},
	{ MODKEY|Mod1Mask,     XK_t,           spawn,          {.v = mpctogglecmd}},
	{ MODKEY|Mod1Mask,     XK_n,           spawn,          {.v = mpcnextcmd}},
	{ MODKEY|Mod1Mask,     XK_p,           spawn,          {.v = mpcprevcmd}},

	{ MODKEY|ControlMask,  XK_s,           spawn,          {.v = screenshot}},
	{ MODKEY|ControlMask,  XK_p,           spawn,          {.v = powermenu}},
	{ MODKEY|ControlMask,  XK_f,           spawn,          {.v = searchweb}},

	{ MODKEY|ShiftMask,    XK_j,           movestack,      {.i = +1}},
	{ MODKEY|ShiftMask,    XK_k,           movestack,      {.i = -1}},
	{ MODKEY|ShiftMask,    XK_q,           killclient,     {0}},
	{ MODKEY|ShiftMask,    XK_f,           togglefullscr,  {0}},
	{ MODKEY|ShiftMask,    XK_Tab,         viewprev,       {0}},

	TAGKEYS(               XK_1,           0)
	TAGKEYS(               XK_2,           1)
	TAGKEYS(               XK_3,           2)
	TAGKEYS(               XK_4,           3)
	TAGKEYS(               XK_5,           4)
	TAGKEYS(               XK_6,           5)
	TAGKEYS(               XK_7,           6)
	TAGKEYS(               XK_8,           7)
	TAGKEYS(               XK_9,           8)
};

/****************************************************************************/
/*                                   MOUSE                                  */
/****************************************************************************/

static Button buttons[] = {
/*    click             mask            button          func            arg */
	{ ClkTagBar,        MODKEY,         Button1,        tag,            {0}},
	{ ClkTagBar,        MODKEY,         Button3,        toggletag,      {0}},
	{ ClkStatusText,    0,              Button2,        spawn,          {0}},
	{ ClkClientWin,     MODKEY,         Button1,        movemouse,      {0}},
	{ ClkClientWin,     MODKEY,         Button2,        togglefloating, {0}},
	{ ClkClientWin,     MODKEY,         Button3,        resizemouse,    {0}},
	{ ClkTagBar,        0,              Button1,        view,           {0}},
	{ ClkTagBar,        0,              Button3,        toggleview,     {0}},
	{ ClkTagBar,        MODKEY,         Button1,        tag,            {0}},
	{ ClkTagBar,        MODKEY,         Button3,        toggletag,      {0}},
};

