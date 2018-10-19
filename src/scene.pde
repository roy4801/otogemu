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
		numOfperfect++;
	}
	void addGreat()
	{
		numOfgreat++;
	}
	void addGood()
	{
		numOfgood++;
	}
	void addPoor()
	{
		numOfpoor++;
	}
}