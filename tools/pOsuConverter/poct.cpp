#include<iostream>
#include<fstream>
#include<cstring>

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

	if(line[len-9] == ',')
		return 1;
	else
		return 2;
}

void pull_s(char line[], int len){

	if(line[0] != NULL){
		
		printf("s:");
		int count = 0;
		char *pch;
		pch = strtok(line, ",:");
		while(pch != NULL){

			count++;
			if(count <=3)
				printf(" %s", pch);
			else
				break;

			pch = strtok(NULL, ",:");
		}
		putchar('\n');
	}
}

void pull_l(char line[], int len){

	if(line[0] != NULL){
	
		printf("l:");
		int count = 0;
		char *pch;
		pch = strtok(line, ",:");
		while(pch != NULL){

			count++;
			if(count <= 3 || count == 6)
				printf(" %s", pch);
			else if(count > 6)
				break;

			pch = strtok(NULL, ",:");
		}
		putchar('\n');
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
	
	// do{

		// audio.getline(line, sizeof(line));

		// int len = strlen(line);

		// if(flag){

		// 	int note = searchSL(line, len);
		// 	//1 = short
		// 	//2 = long

		// 	switch(note){
		// 		//pull x y ts
		// 		case 1:
		// 			pull_s(line, len);
		// 			break;
		// 		//pull x y ts te
		// 		case 2:
		// 			pull_l(line, len);
		// 			break;
		// 	}
		// }

		// if(cmp.assign(line) == "[HitObjects]")
		// 	flag = true;


	// }while(!audio.eof());

	while(!audio.eof()){

		audio.getline(line, sizeof(line));

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
					pull_l(line, len);
					break;
			}
		}

		if(cmp.assign(line) == "[HitObjects]")
			flag = true;
	}
	
	return 0;
}