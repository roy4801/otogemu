#include "poct.h"

using namespace std;

int main(int argc, char* argv[])
{
	init();
	string filename[2];
	bool fileFlag[2] = {false};

	if(argc < 5){

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
		else if(strcmp(argv[i], "-c") == 0 || strcmp(argv[i], "--convert") == 0)
		{
			longTOshort = true;
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