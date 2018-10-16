#include<iostream>
#include<fstream>

using namespace std;

// poct -i <intput> -o <output>

char line[100];
bool flag = false;
string cmp;
int shortnote[9];


void usage(const char program[])
{
	printf("Usage: ");
	printf("%s -i <intput> -o <output>", program);
}

int searchSL(char line[], int len){

	if(line[len-1-9] == ',')
		return 1;
	else
		return 2;
}

void pull_s(char line[], int len){

	int index = 0;
	char *pch;
	pch = strtok(line, ",:");
	while(pch != NULL){

		printf("%s ", pch)
	}
}

int main(int argc, char* argv[])
{
	if(argc != 5)
	{
		usage(argv[0]);
		return -1;
	}

	freopen("cvt.txt", "w", stdout);

	fstream audio;
	audio.open("audio.txt", ios::in);
	
	if(!audio)
		printf("file not open!\n");
	
	do{

		audio.getline(line, sizeof(line));
		printf("%s\n", line);

		int len = strlen(line);

		if(flag){

			int note = searchSL(line, len);
			//1 = short
			//2 = long

			switch(note){
				//pull x y ts
				case 1:
					pull_s(line, len);
					break;
				//pull x y ts te
				case 2:
					pull_l();
					break;
			}
		}

		if(cmp.assign(line) == '[HitObjects]')
			flag = true;


	}while(!audio.eof());
	
	return 0;
}