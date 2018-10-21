static final float speed = 1.f;
static final float unit = 261.f;
static final float moveUnit = unit / (float)fps;


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

static final int [] perfect = {-27, -10};//4, 9
static final int [][] great =
{
    {-35, -27},//-1, 3
    {-10, -6}//10, 13
};
static final int [][] good =
{
    {-45, -35},//-4, -1
    {-6, 0},//14, 17
};

PImage [] noteImg = new PImage[2];

void loadNoteImage()
{
    // noteImg[NOTE_APP_WHITE] = new PImage();
    noteImg[NOTE_APP_WHITE] = LoadImage("note_white.png");
    // noteImg[NOTE_APP_RED] = new PImage();
    noteImg[NOTE_APP_RED] = LoadImage("note_red.png");
}

class Note
{
    ////////////////////////////////////
    //// DEBUG only
    void printDbg()
    {
        println(String.format("noteType:%d\nnoteCol: %d\nstartTime: %d\ntouchTime: %d\nendTime: %d\n", noteType, noteCol, startTime, touchTime, endTime));
    }
    ////////////////////////////////////
    boolean on;
    // Type
    int appType;       // note app type : NOTE_APP_WHITE, NOTE_APP_RED
    int noteType;      // note type     : NOTE_SHORT, NOTE_LONG
    // Pos
    int x, y;          // now position
    int noteCol;       // which column: d, f, j, k
    // Time
    int startTime;     // startTime in ms    : startTime to move
    int touchTime;     // touchTime in ms    : touches the judge line
    int endTime;       // endTime  in ms     : pressing time for a long note
    
    // judge
    boolean prevKey;

    Note()
    {
        // cnter = new Counter(dur);
        on = true;
        
        appType = NOTE_APP_NONE;
        noteType = NOTE_NONE;
        //
        x = y = 0;
        noteCol = KEY_NONE;
        // Time
        startTime = touchTime = endTime = -1;

        // judge
        prevKey = false;
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
        prevKey = false;
    }
    //
    // Main functions
    void start()
    {
        on = true;
    }
    void update()
    {
        if(!on)
            return;

        y += moveUnit * speed;

        if(y > endPoint[notePos][1] + pressedBlockH)

            on = false;
    }
    void judge()
    {
        if(!on)
            return;

        // println(x, y);

        int judgeY = y - (endPoint[notePos][1] + pressedBlockH);

        // the column of the noteCol is pressed
        if(!prevKey && keyHandler.getKey(noteCol))
        {
            if(judgeY >= perfect[0] && judgeY <= perfect[1])
            {
                scene.addPerfect();
                on = false;
            }
            else if((judgeY >= great[0][0] && judgeY < great[0][1])
                 || (judgeY > great[1][0] && judgeY <= great[1][1]))
            {
                scene.addGreat();
                on = false;
            }
            else if(judgeY >= good[0][0] && judgeY < good[0][1]
                || judgeY > good[1][1] && judgeY <= good[1][1])
            {
                scene.addGood();
                on = false;
            }
        }
        prevKey = keyHandler.getKey(noteCol);
    }
    void draw()
    {
        if(on)
        {
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
}