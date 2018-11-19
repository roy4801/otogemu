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
	boolean init;

	CountDownClock()
	{
		clk = null;
		init = false;
	}
	CountDownClock(int l)
	{
		clk = null;
		lim = l;
		init = false;
	}
	//
	void start()
	{
		if(!init)
		{
			clk = new Clock();
			init = true;
		}
		clk.start();
	}
	// judge
	boolean isEnd()
	{
		if(!init)
			start();

		if(clk.getPassed() >= lim)
		{
			println("CountDownClock.clk.getPassed()= " + clk.getPassed());
			init = false;
			return true;
		}
		else
			return false;
	}
	boolean isInit()
	{
		return init;
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
}