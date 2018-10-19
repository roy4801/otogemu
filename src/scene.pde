/*
 * Notice: This file is only for testing
 * Waiting for merging screen_pde.pde
 */

static final int HIT_PERFECT = 0;
static final int HIT_GREAT = 1;
static final int HIT_GOOD = 2;
static final int HIT_POOR = 3;
static final int HIT_TOTAL = 4;

class Scene
{
	int combo;

	int [] hit = new int[HIT_TOTAL];


	void addCombo()
	{
		combo++;
	}
	void addPerfect()
	{
		hit[HIT_PERFECT]++;
	}
	void addGreat()
	{
		hit[HIT_GREAT]++;
	}
	void addGood()
	{
		hit[HIT_GOOD]++;
	}
	void addPoor()
	{
		hit[HIT_POOR]++;
	}

	void drawTest()
	{
		fill(255, 255, 255);
		textSize(25);
		textAlign(LEFT);
		text("Perfect " + str(hit[HIT_PERFECT]), 500, 200);
		text("Great " + str(hit[HIT_GREAT]), 500, 225);
		text("Good " + str(hit[HIT_GOOD]), 500, 250);
	}

	void draw()
	{
		drawTest();
		// drawScore();
	}
}