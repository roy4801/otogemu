static final float speed = 1.f;
static final float unit = 800.f; // pixel per sec
static final float moveUnit = unit / (float)fps;

static final float longBarW = 17;
float longBarH = 0;

static final float offsetToStartTime = (endPoint[0][POS_Y] + pressedBlockH) / unit * 1000.f;

static final int NOTE_APP_NONE  = -1;
static final int NOTE_APP_WHITE = 0;
static final int NOTE_APP_RED   = 1;
static final int NOTE_APP_TOTAL = 2;

static final int NOTE_NONE  = -1;
static final int NOTE_SHORT = 0;
static final int NOTE_LONG  = 1;
static final int NOTE_TOTAL = 2;

static final int JUDGE_NONE = 0;
static final int JUDGE_PERFECT = 1;
static final int JUDGE_GREAT = 2;
static final int JUDGE_GOOD = 3;
static final int JUDGE_POOR = 4;
static final int JUDGE_MISS = 5;

static final int JUDGE_LONG_START = 0;
static final int JUDGE_LONG_PRESS = 1;

// Notice: Adjust judgement should only touch diff[]
// diff[]: Each value in diff[] means height of each judge category
static final int [] diff = {13, 16, 18, 10};// 11 14 15 5
// offset: Shift the judgeLine in y axis
static final int offset = 0;

// Do not edit the arrays below
static final int judgeLineY = endPoint[0][POS_Y] + offset;

static final int [] perfect = {-diff[0], diff[0]};
static final int [][] great =
{
    {-(perfect[1]+diff[1]), -(perfect[1]+1)},
    {(perfect[1]+1), (perfect[1]+diff[1])}
};
static final int [][] good =
{
    {-(great[1][1]+diff[2]), -(great[1][1]+1)},
    {(great[1][1]+1), (great[1][1]+diff[2])}
};
static final int [][] miss =
{
    {-(good[1][1] + diff[3]), -(good[1][1]+1)},
    {(good[1][1]+1), (good[1][1] + diff[3])}
};

static final int endLineY = endPoint[0][POS_Y] + miss[1][1] + pressedBlockH;
PImage [] noteImg = new PImage[2];

void loadNoteImage()
{
    noteImg[NOTE_APP_WHITE] = LoadImage("note_white.png");
    noteImg[NOTE_APP_RED] = LoadImage("note_red.png");
}

class Note
{
    ////////////////////////////////////
    //// DEBUG only
    void printDbg()
    {
        println(String.format("noteType:%d\nnoteCol: %d\nx = %d y = %d\nstartTime: %d\ntouchTime: %d\nendTime: %d\n", noteType, noteCol, x, y, startTime, touchTime, endTime));
    }
    ////////////////////////////////////
    boolean on;
    boolean end;
    // Type
    int appType;       // note app type : NOTE_APP_WHITE, NOTE_APP_RED
    int noteType;      // note type     : NOTE_SHORT, NOTE_LONG
    // Pos
    int x, y;          // now position
    int noteCol;       // which column: d, f, j, k
    // Time
    int startTime;     // startTime in ms    : startTime to move
    int touchTime;     // touchTime in ms    : touches the judge line
    // For NOTE_LONG
    int endTime;       // endTime  in ms     : pressing time for a long note
    int judgeStat;
    
    // judge
    boolean prevKey;

    Note()
    {
        // cnter = new Counter(dur);
        on = false;
        end = false;
        
        appType = NOTE_APP_NONE;
        noteType = NOTE_NONE;
        //
        x = y = 0;
        noteCol = KEY_NONE;
        // Time
        startTime = touchTime = endTime = -1;

        // judge
        prevKey = false;

        judgeStat = JUDGE_LONG_START;
    }
    Note(int appType, int noteType, int noteCol, int x, int y, int startTime, int touchTime, int endTime)
    {
        this.appType = appType;
        this.noteType = noteType;
        this.noteCol = noteCol;
        this.x = x;
        this.y = y;
        this.startTime = startTime;
        this.touchTime = touchTime;
        this.endTime = endTime;
        on = end = false;
        prevKey = false;
        judgeStat = JUDGE_LONG_START;
    }
    //
    // Main functions
    void reset()
    {
        on = end = false;
        x = endPoint[noteCol][0];
        y = 0;

        // Need refactoring (copy from fumenParser Line 162)
        setStartTime((int)(getTouchTime() - offsetToStartTime));
        if(getStartTime() < 0)
        {
            setY((int)(endPoint[noteCol][1] - (getTouchTime() * unit / 1000.f)));
        }
    }
    void check(Clock clk)
    {
        // If a note is ended, then don't check
        if(end)
            return;

        if(startTime <= 0 || clk.getPassed() >= startTime)
        {
            on = true;
        }
    }
    void update()
    {
        if(!on)
            return;

        y += moveUnit * speed;

        // If the y of a note is excess of the judge line of its column
        if(noteType == NOTE_SHORT)
            if(y > endLineY)
            {
                // on = false;
                end = true;
            }
        else if(noteType == NOTE_LONG)
            if(y + pressedBlockH - longBarH > endLineY)
            {
                // on = false;
                end = true;
            }
    }
    //
    // judgement
    int judgePress(int nowY)
    {
        int rt = JUDGE_NONE;
        // Adjust the judge point to mid of a note
        int judgeY = judgeLineY - (nowY + pressedBlockH / 2);
        // the column of the noteCol is pressed
        if(!prevKey && keyHandler.getKey(noteCol))
        {
            if(judgeY >= perfect[0] && judgeY <= perfect[1])
            {
                scene.addPerfect();
                rt = JUDGE_PERFECT;
            }
            else if((judgeY >= great[0][0] && judgeY <= great[0][1])
                 || (judgeY >= great[1][0] && judgeY <= great[1][1]))
            {
                scene.addGreat();
                rt = JUDGE_GREAT;
            }
            else if(judgeY >= good[0][0] && judgeY <= good[0][1]
                || judgeY >= good[1][0] && judgeY <= good[1][1])
            {
                scene.addGood();
                rt = JUDGE_GOOD;
            }
            else if(judgeY >= miss[0][0] && judgeY <= miss[0][1]
                || judgeY >= miss[1][0] && judgeY <= miss[1][1])
            {
                scene.addMiss();
                scene.resetCombo();
                rt = JUDGE_MISS;
            }
        }
        // Has benn judged
        if(rt != JUDGE_NONE)
        {
            if(rt != JUDGE_MISS)
                scene.addCombo();
            scene.addDistance(judgeY);
            // DBG(roy4801)
            // println("judgePress(): judgeY = " + judgeY);
        }

        return rt;
    }
    int judgeRelease(int nowY)
    {
        int rt = JUDGE_NONE;
        int judgeY = judgeLineY - (nowY + pressedBlockH / 2);
        // the column of the noteCol is pressed
        if(prevKey && !keyHandler.getKey(noteCol))
        {
            if(judgeY >= perfect[0] && judgeY <= perfect[1])
            {
                scene.addPerfect();
                rt = JUDGE_PERFECT;
            }
            else if((judgeY >= great[0][0] && judgeY <= great[0][1])
                 || (judgeY >= great[1][0] && judgeY <= great[1][1]))
            {
                scene.addGreat();
                rt = JUDGE_GREAT;
            }
            else if(judgeY >= good[0][0] && judgeY <= good[0][1]
                 || judgeY >= good[1][1] && judgeY <= good[1][1])
            {
                scene.addGood();
                rt = JUDGE_GOOD;
            }
            else if(judgeY >= miss[0][0] && judgeY <= miss[0][1]
                 || judgeY >= miss[1][0] && judgeY <= miss[1][1])
            {
                scene.addMiss();
                scene.resetCombo();
                rt = JUDGE_MISS;
            }
        }

        if(rt != JUDGE_NONE)
        {
            if(rt != JUDGE_MISS)
                scene.addCombo();
            scene.addDistance(judgeY);
        }

        return rt;
    }

    void judge()
    {
        if(!on)
            return;

        int judge = JUDGE_NONE;

        if(noteType == NOTE_SHORT)
        {
            judge = judgePress(y);
        }
        else if(noteType == NOTE_LONG)
        {
            switch(judgeStat)
            {
                case JUDGE_LONG_START:
                {
                    judge = judgePress(y);
                    if(judge != JUDGE_MISS)
                    {
                        judgeStat = JUDGE_LONG_PRESS;
                    }
                }
                break;

                case JUDGE_LONG_PRESS:
                    if(prevKey)
                    {
                        judge = judgeRelease((int)(y + pressedBlockH - longBarH));
                    }
                break;
            }
        }

        // if judge then turn off, however it's not end (touch the end)
        if(judge != JUDGE_NONE)
        {
            on = false;
            end = true;
        }
        // if a note is end, then it's off
        // end flag may turn off by Game.update()
        if(end)
        {
            if(on)
            {
                scene.addMiss();
                scene.resetCombo();
            }
            on = false;
        }


        // save the now key state to prevKey for next round
        prevKey = keyHandler.getKey(noteCol);
    }
    //
    void draw(boolean static_print)
    {
        // static_print for GAME_WAITING
        if(on || static_print)
        {
            // Long bar for NOTE_LONG
            if(noteType == NOTE_LONG)
            {
                longBarH = (endTime - touchTime) * unit / 1000.f;

                fill(232, 159, 197);
                rect(x + (pressedBlockW - longBarW) / 2, y + pressedBlockH - longBarH, longBarW, longBarH);
                image(noteImg[appType], x, y + pressedBlockH - longBarH, pressedBlockW, pressedBlockH);
            }

            image(noteImg[appType], x, y, pressedBlockW, pressedBlockH);
        }
    }
    //
    // Get/Set functions
    void setInitPos(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    void setY(int y)
    {
        this.y = y;
    }
    void setCol(int pos)
    {
        noteCol = pos;
        // Set appType depending on the noteCol (which column)
        switch(noteCol)
        {
            case KEY_D:
            case KEY_K:
                appType = NOTE_APP_WHITE;
            break;

            case KEY_F:
            case KEY_J:
                appType = NOTE_APP_RED;
            break;
        }
    }
    void setType(int type)
    {
        noteType = type;
    }
    void setStartTime(int start)
    {
        startTime = start;
    }
    void setTouchTime(int e)
    {
        touchTime = e;
    }
    void setEndTime(int end)
    {
        endTime = end;
    }

    int getTouchTime()
    {
        return touchTime;
    }
    int getStartTime()
    {
        return startTime;
    }
}
