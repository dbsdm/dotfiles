//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "$HOME/dotfiles/scripts/currentsong.sh",	1,		0},
	
    {"墳 ", "$HOME/dotfiles/scripts/getvolume-pa.sh",	1,		0},

	{"Root: ", "df -h / | awk 'FNR == 2 {print $4}'",	30,		0},

	{"Data: ", "df -h /dev/sdb1 | awk 'FNR == 2 {print $4}'",	30,		0},

	{"Mem: ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	5,		0},

	{"", "date '+%b %d (%a) %H:%M'",					1,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
