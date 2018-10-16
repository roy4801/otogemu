class Note
{
	int x, y;
	int sMs; // Start time in ms
	int dur; // Duration in ms
	Counter cnter;
	PImage img; // future

	Note()
	{
		cnter = new Counter();
	}

	void update()
	{
		cnter.update();
	}
}