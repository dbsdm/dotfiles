/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 5;        /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows monitor,X to pin systray to monitor */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitorr*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 17;        /* 0 means that dwm will calculate bar height, >= 1 user_bh */ 
static const char *fonts[]          = { "JetBrainsMono Nerd Font:size=10" };
static const char dmenufont[]       = "JetBrainsMono Nerd Font:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#bd93f9";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

static const char *const autostart[] = {
    "slstatus", NULL,
	"lxsession", NULL,
	"nm-applet", NULL,
	"betterlockscreen", "-w", NULL,
	"conky", NULL,
	"dunst", NULL,
	"picom", NULL,
	"xset", "r", "rate", "200", "30", NULL,
	"setxkbmap", "-model", "pc105", "-layout", "us,ru,ua", "-option", "grp:win_space_toggle", "-option", "caps:ctrl_modifier", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "www", "dev", "sys", "doc", "virt", "chat", "mus", "vid", "gfx" };

static const Rule rules[] = {
	/* class         instance title       tags mask     isfloating   monitor */
	{ "firefox",         NULL , NULL ,          1 << 0,       0,           - 1},
	{ "Brave-browser",   NULL , NULL ,          1 << 0,       0,           - 1},
	{ "Alacritty",       NULL , NULL ,          1 << 1,       0,           - 1},
	{ "code-oss",        NULL , NULL ,          1 << 1,       0,           - 1},
	{ "GitKraken",       NULL , NULL ,          1 << 1 ,      0,           - 1},
	{ "KeePassXC",       NULL , NULL ,          1 << 2,       0,           - 1},
	{ "GParted",         NULL , NULL ,          1 << 2,       0,           - 1},
	{ "Thunar",          NULL , NULL ,          1 << 2,       0,           - 1},
	{ "Pcmanfm",         NULL , NULL ,          1 << 2,       0,           - 1},
	{ "okular",          NULL , NULL ,          1 << 3,       0,           - 1},
	{ "Zathura",         NULL , NULL ,          1 << 3,       0,           - 1},
	{ NULL,              NULL , "LibreOffice" , 1 << 3,       0,           - 1},
	{ "Galculator",      NULL , NULL ,          1 << 3,       1,           - 1},
	{ "Virt-manager",    NULL , NULL ,          1 << 4,       1,           - 1},
	{ "TelegramDesktop", NULL , NULL ,          1 << 5,       0,           - 1},
	{ "Skype",           NULL , NULL ,          1 << 5,       0,           - 1},
	{ "Rhythmbox",       NULL , NULL ,          1 << 6,       0,           - 1},
	{ "cantata",         NULL , NULL ,          1 << 6,       0,           - 1},
	{ "deemix-gui",      NULL , NULL ,          1 << 6,       0,           - 1},
	{ "nuclear",         NULL , NULL ,          1 << 6,       0,           - 1},
	{ "mpv",             NULL , NULL ,          1 << 7,       1,           - 1},
	{ "obs",             NULL , NULL ,          1 << 7,       0,           - 1},
	{ "Popcorn-Time",    NULL , NULL ,          1 << 7,       0,           - 1},
	{ "Viewnior",        NULL , NULL ,          1 << 8,       0,           - 1},
	{ "Gimp",            NULL , NULL ,          1 << 8,       0,           - 1},

	{ NULL,              NULL , "Wine",         0,            1,           - 1},
	{ NULL,              NULL , "Winetricks",   0,            1,           - 1},
	{ "Pavucontrol",     NULL , NULL,           0,            1,           - 1},
	{ "Nitrogen",        NULL , NULL,           0,            1,           - 1},
	{ ".exe",            NULL , NULL,           0,            1,           - 1},
	{ "XTerm",           NULL , NULL,           0,            1,           - 1},
	{ "Kitty",           NULL , NULL,           0,            1,           - 1},
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *mutecmd[]  = { "pactl", "set-sink-mute", "0", "toggle", NULL };
static const char *volucmd[]  = { "pactl", "set-sink-volume", "0", "+1%", NULL };
static const char *voldcmd[]  = { "pactl", "set-sink-volume", "0", "-1%", NULL };
static const char *mpctogglecmd[]  = { "mpc", "--port=8888", "toggle", NULL };
static const char *mpcnextcmd[]  = { "mpc", "--port=8888", "next", NULL };
static const char *mpcprevcmd[]  = { "mpc", "--port=8888", "prev", NULL };
static const char *mpcpausecmd[]  = { "mpc", "--port=8888", "pause", NULL };
static const char *lockcmd[]  = { "betterlockscreen", "-l", NULL };
static const char *sscmd[]  = { "flameshot", "gui", NULL };

#include "movestack.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                       XK_h,      setmfact,       {.f = -0.01} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.01} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_q,      setlayout,      {0} },
	{ MODKEY,                       XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_Right,  viewnext,       {0} },
	{ MODKEY,                       XK_Left,   viewprev,       {0} },
	{ MODKEY,                       XK_Tab,    viewnext,       {0} },

	{ MODKEY|Mod1Mask,              XK_i,      spawn,          {.v = volucmd } },
	{ MODKEY|Mod1Mask,              XK_d,      spawn,          {.v = voldcmd } },
	{ MODKEY|Mod1Mask,              XK_m,      spawn,          {.v = mutecmd } },
	{ MODKEY|Mod1Mask,              XK_t,      spawn,          {.v = mpctogglecmd } },
	{ MODKEY|Mod1Mask,              XK_n,      spawn,          {.v = mpcnextcmd } },
	{ MODKEY|Mod1Mask,              XK_p,      spawn,          {.v = mpcprevcmd } },

	{ MODKEY|Mod1Mask,              XK_s,      spawn,          {.v = sscmd } },

	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY|ShiftMask,             XK_Tab,    viewprev,       {0} },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = mpcpausecmd } },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockcmd } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

