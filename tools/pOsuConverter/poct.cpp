#include "poct.h"

using namespace std;

char line[100];
bool flag = false;
string cmp;
int shortnote[9];
bool longTOshort = false;

map<int, char> xToBtn;

void init(){

	xToBtn.insert(make_pair(64, 'd'));
	xToBtn.insert(make_pair(192, 'f'));
	xToBtn.insert(make_pair(320, 'j'));
	xToBtn.insert(make_pair(448, 'k'));

}


void usage(const char program[]){

	printf("Usage: ");
	printf("%s [-c] -i <intput> -o <output>\n", program);
	printf("\t-c, --convert  Converts long notes to short notes\n");
}

int searchSL(char line[], int len){

	if(line[len-9] == ',')
		return NOTE_SHORT;
	else
		return NOTE_LONG;
}

/**
 * void pull_s(char line[], int len)
 * Get the information of a short note from input file
 *   - line : one line
 *   - len  : length of a length
 */
void pull_s(char line[], int len){

	if(line != NULL && line[0] != '\0'){

		printf("s");
		int count = 0;
		char *pch;
		bool noteXFlag = false;
		bool noteYFlag = false;

		pch = strtok(line, ",:");

		while(pch != NULL){

			count++;

			if(count <=3){
				if(!noteXFlag){
					printf(" %c", xToBtn[atoi(pch)]);
					noteXFlag = true;
				}
				else if(!noteYFlag){
					noteYFlag = true;
					// skip y data
				}
				else
					printf(" %s", pch);
			}
			else
				break;

			pch = strtok(NULL, ",:");
		}
		putchar('\n');
	}
}

void pull_l(char line[], int len){

	if(line != NULL && line[0] != '\0'){
	
		printf("l");
		int count = 0;
		char *pch;
		bool noteXFlag = false;
		bool noteYFlag = false;

		pch = strtok(line, ",:");
		
		while(pch != NULL){

			count++;
			if(count <= 3 || count == 6)
			{
				if(!noteXFlag){
					printf(" %c", xToBtn[atoi(pch)]);
					noteXFlag = true;
				}
				else if(!noteYFlag){
					noteYFlag = true;
					// skip y data
				}
				else
					printf(" %s", pch);
			}
			else if(count > 6)
				break;

			pch = strtok(NULL, ",:");
		}
		putchar('\n');
	}
}

void cvtLongToShort(char line[], int len){

	char tmp_KEY;
	int tmp_ENDTIME;

	if(line != NULL && line[0] != '\0'){
	
		printf("s");
		int count = 0;
		char *pch;
		bool noteXFlag = false;
		bool noteYFlag = false;

		pch = strtok(line, ",:");
		
		while(pch != NULL){

			count++;
			if(count <= 3 || count == 6)
			{
				if(!noteXFlag){
					
					printf(" %c", xToBtn[atoi(pch)]);
					tmp_KEY = xToBtn[atoi(pch)];
					noteXFlag = true;
				}
				else if(!noteYFlag){
					
					noteYFlag = true;
					// skip y data
				}
				else if(count == 6){

					tmp_ENDTIME = atoi(pch);
				}
				else
					printf(" %s", pch);
			}
			else if(count > 6)
				break;

			pch = strtok(NULL, ",:");
		}
		putchar('\n');

		printf("s");
		printf(" %c", tmp_KEY);
		printf(" %d\n", tmp_ENDTIME);
	}
}