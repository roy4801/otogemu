
static final int [] trackPos = {100, 0};
static final int [][] btnPos =
{
	{6, 516},
	{43, 516},
	{81, 516},
	{118, 516}
};

static final int KEY_D = 0;
static final int KEY_F = 1;
static final int KEY_J = 2;
static final int KEY_K = 3;

static final int POS_X = 0;
static final int POS_Y = 1;

static final int pressedBlockW = 37;
static final int pressedBlockH = 13;

class Game
{
	PImage trackImg;
	PImage []btnImg;
	int [][] endPoint;

	boolean keyD;

	float tmpNoteD;

	Game()
	{
		endPoint = new int[TotalKeys][2];

		trackImg = LoadImage("4k_layout.png");

		btnImg = new PImage[TotalKeys];

		btnImg[KEY_D] = LoadImage("4k_d.png");
		btnImg[KEY_F] = LoadImage("4k_f.png");
		btnImg[KEY_J] = LoadImage("4k_j.png");
		btnImg[KEY_K] = LoadImage("4k_k.png");

		// Init end points
		endPoint[KEY_D][0] = trackPos[0] + 6;
		endPoint[KEY_D][1] = trackPos[1] + 503;
		
		endPoint[KEY_F][0] = trackPos[0] + 43;
		endPoint[KEY_F][1] = trackPos[1] + 503;
		
		endPoint[KEY_J][0] = trackPos[0] + 81;
		endPoint[KEY_J][1] = trackPos[1] + 503;
		
		endPoint[KEY_K][0] = trackPos[0] + 118;
		endPoint[KEY_K][1] = trackPos[1] + 503;

		tmpNoteD = 0;
	}

	void update()
	{
		tmpNoteD += moveUnit * speed;

		if(tmpNoteD > endPoint[KEY_D][1] + pressedBlockH)
			tmpNoteD = 0;
	}

	void draw()
	{
		// Track background
		image(trackImg, trackPos[0], trackPos[1], trackImg.width, trackImg.height);

		// Key
		fill(255, 255, 255); // Color white
		if(keyHandler.getKey(KeyType.KEY_D))
		{
        	rect(endPoint[KEY_D][POS_X], endPoint[KEY_D][POS_Y], pressedBlockW-1, pressedBlockH);
		}
		if(keyHandler.getKey(KeyType.KEY_F))
		{
			rect(endPoint[KEY_F][POS_X], endPoint[KEY_F][POS_Y], pressedBlockW, pressedBlockH);
		}
		if(keyHandler.getKey(KeyType.KEY_J))
		{
			rect(endPoint[KEY_J][POS_X], endPoint[KEY_J][POS_Y], pressedBlockW-1, pressedBlockH);
		}
		if(keyHandler.getKey(KeyType.KEY_K))
		{
			rect(endPoint[KEY_K][POS_X], endPoint[KEY_K][POS_Y], pressedBlockW-1, pressedBlockH);
		}

		// Note
		image(noteImg[0], endPoint[KEY_D][0], tmpNoteD, pressedBlockW, pressedBlockH);
		image(noteImg[1], endPoint[KEY_F][0], 0, pressedBlockW, pressedBlockH);
		image(noteImg[1], endPoint[KEY_J][0], 0, pressedBlockW, pressedBlockH);
		image(noteImg[0], endPoint[KEY_K][0], 0, pressedBlockW, pressedBlockH);


		// d f j k btns
		image(btnImg[KEY_D], btnPos[KEY_D][0], btnPos[KEY_D][1]);

	}

}