static final float speed = 1.f;
static final float moveUnit = 1.f / (float)fps;

class Note
{
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