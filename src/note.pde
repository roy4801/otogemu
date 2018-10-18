static final float speed = 1.f;
static final float unit = 261.f;
static final float moveUnit = unit / (float)fps;


static final int NOTE_APP_WHITE = 0;
static final int NOTE_APP_RED   = 1;
static final int NOTE_APP_TOTAL = 2;

static final int NOTE_WHITE = 0;
static final int NOTE_RED   = 1;
static final int NOTE_TOTAL = 2;


PImage [] noteImg = new PImage[2];

void loadNoteImage()
{
	noteImg[NOTE_APP_WHITE] = new PImage();
	noteImg[NOTE_APP_WHITE] = loadImage("data/note_white.png");
	noteImg[NOTE_APP_RED] = new PImage();
	noteImg[NOTE_APP_RED] = loadImage("data/note_red.png");
}

class Note
{
	int app_type;
	int type;
	//
	int x, y;
	int endX, endY; // end position
	//
	int sMs; // Start time in ms
	int dur; // Duration in ms
	//
	Counter cnter;
	PImage img; // future

	Note()
	{
		cnter = new Counter(dur);
	}

	void update()
	{
		cnter.update();

		y += moveUnit * speed;
	}
	/**
	 * void display()
	 */
	void display()
	{
		fill(255, 0, 0);
		rect(x, y, 100, 200);
	}
}