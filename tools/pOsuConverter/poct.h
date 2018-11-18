#include <iostream>
#include <map>
#include <fstream>
#include <cstring>
#include <cstdlib>

void init();
void usage(const char program[]);
int searchSL(char line[], int len);
void pull_s(char line[], int len);
void pull_l(char line[], int len);
void cvtLongToShort(char line[], int len);

enum file_type{

	F_FROM,
	F_TO
};

enum note_type{

	NOTE_SHORT = 1,
	NOTE_LONG
};

extern char line[100];
extern bool flag;
extern std::string cmp;
extern int shortnote[9];
extern bool longTOshort;

extern std::map<int, char> xToBtn;