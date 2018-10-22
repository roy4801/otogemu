#include <iostream>
#include <map>
#include <fstream>
#include <cstring>
#include <cstdlib>

using namespace std;

char line[100];
bool flag = false;
string cmp;
int shortnote[9];
bool longTOshort = true;

map<int, char> xToBtn;

enum file_type{

	F_FROM,
	F_TO
};

enum note_type{

	NOTE_SHORT = 1,
	NOTE_LONG
};

void init(){

	xToBtn.insert(make_pair(64, 'd'));
	xToBtn.insert(make_pair(192, 'f'));
	xToBtn.insert(make_pair(320, 'j'));
	xToBtn.insert(make_pair(448, 'k'));

}


void usage(const char program[]){

	printf("Usage: ");
	printf("%s -i <intput> -o <output>", program);
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

int main(int argc, char* argv[])
{
	init();
	string filename[2];
	bool fileFlag[2] = {false};

	if(argc != 5){

		usage(argv[0]);
		return -1;
	}
	// Parse arguement
	int i = 1;
	while(i < argc){

		if(strcmp(argv[i], "-i") == 0){

			if(fileFlag[F_FROM]){

				usage(argv[0]);
				return -1;
			}
			i++;
			filename[F_FROM] = argv[i];
			fileFlag[F_FROM] = true;
		}
		else if(strcmp(argv[i], "-o") == 0){

			if(fileFlag[F_TO]){

				usage(argv[0]);
				return -1;
			}
			i++;
			filename[F_TO] = argv[i];
			fileFlag[F_TO] = true;
		}
		i++;
	}
	// Open fd
	fstream audio;
	audio.open(filename[F_FROM].c_str(), ios::in);
	
	if(!audio){
		fprintf(stderr, "Failed to open %s.", filename[F_FROM].c_str());
		return -1;
	}

	freopen(filename[F_TO].c_str(), "w", stdout);
	// Start to parse the osu 4k fumen
	while(!audio.eof()){

		audio.getline(line, sizeof(line));
		int len = strlen(line);

		if(flag){

			int note = searchSL(line, len);

			switch(note){
				//pull x y ts
				case NOTE_SHORT:
					pull_s(line, len);
					break;
				//pull x y ts te
				case NOTE_LONG:
					if(!longTOshort){

						pull_l(line, len);
					}
					else
						cvtLongToShort(line, len);
					break;
			}
		}

		if(cmp.assign(line) == "[HitObjects]")
			flag = true;
	}
	
	return 0;
}