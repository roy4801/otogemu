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