static final float speed = 1.f;
static final float unit = 1.f;
static final float moveUnit = unit / (float)fps;


enum noteAppearType
{
	NOTE_APP_WHITE,
	NOTE_APP_RED,
	NOTE_APP_TOTAL
}

enum noteType
{
	NOTE
}

PImage [] noteImg = new PImage[2];

void loadNoteImage()
{
	noteImg[noteAppearType.NOTE_APP_WHITE.ordinal()] = new PImage();
	noteImg[noteAppearType.NOTE_APP_WHITE.ordinal()] = loadImage("data/note_white.png");
	noteImg[noteAppearType.NOTE_APP_RED.ordinal()] = new PImage();
	noteImg[noteAppearType.NOTE_APP_RED.ordinal()] = loadImage("data/note_red.png");
}

static final int TotalNoteType = noteAppearType.NOTE_APP_TOTAL.ordinal();

class Note
{
	noteAppearType app_type;
	noteType type;
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