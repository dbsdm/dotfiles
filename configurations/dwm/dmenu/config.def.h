/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;
static const char *fonts[] = { "monospace:size=10" };
static const char *prompt = NULL; 
static const char *colors[SchemeLast][2] = {
/*                   fg         bg                                          */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel]  = { "#eeeeee", "#005577" },
	[SchemeOut]  = { "#000000", "#00ffff" },
};
static unsigned int lines      = 0;
static unsigned int lineheight = 30;
static unsigned int min_lineheight = 0;
static const char worddelimiters[] = " ";
