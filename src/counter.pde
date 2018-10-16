class Counter
{
    boolean on, over;
    int dur;
    int start;

    // Constructer
    Counter()
    {
        on = over = false;
        dur = start = -1;
    }
    Counter(int dur)
    {
        this.dur = dur;
    }
    //
    void setDuration(final int dur)
    {
        this.dur = dur;
    }
    void start()
    {
        if(on)
        {
            println("Sound: Counter is already on!");
            return;
        }

        if(dur != -1)
        {
            on = true;
        }
        else
        {
            println("Sound: The duration or start is -1");    
        }
    }
    void update()
    {
        if(on)
        {
            int now = millis();

            if(now - start >= dur)
                over = true;
        }
    }

    boolean isOver()
    {
        return over;
    }
}