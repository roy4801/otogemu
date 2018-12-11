class Clock
{
	int origin;

	Clock()
	{
		origin = 0;
	}
	//
	void start()
	{
		origin = millis();
	}

	int getPassed()
	{
		return millis() - origin;
	}
	int getNow()
	{
		return millis();
	}
}

class CountDownClock
{
	Clock clk;
	int lim;

	CountDownClock()
	{
		clk = new Clock();
	}
	CountDownClock(int l)
	{
		clk = new Clock();
		lim = l;
	}
	CountDownClock(float sec)
	{
		clk = new Clock();
		lim = (int)(sec * 1000);
	}
	//
	void start()
	{
		clk.start();
	}
	// judge
	boolean isEnd()
	{
		if(clk.getPassed() >= lim)
		{
			println(">> End");
			return true;
		}
		else
			return false;
	}
	// get
	float getPassedSec()
	{
		return (float)clk.getPassed() / 1000.f;
	}
	int getPassed()
	{
		return clk.getPassed();
	}
	// set
	void setLimit(int l)
	{
		lim = l;
	}
	void setLimitSec(float s)
	{
		lim = (int)(s * 1000);
	}
}