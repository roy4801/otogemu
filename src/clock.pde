class Clock
{
	int origin;
	boolean paused;
	int offset;

	Clock()
	{
		origin = offset = 0;
		paused = false;
	}
	//
	void start()
	{
		origin = millis();
	}
	void pause()
	{
		paused = true;
	}
	void resume()
	{
		if(paused)
		{
			paused = false;
			offset = getNow() - origin;
		}
	}
	int getPassed()
	{
		return millis() - origin + offset;
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
			// println(">> End");
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