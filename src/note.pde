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

static final int [] perfect = {4, 9};
static final int [][] great =
{
    {-1, 3},
    {10, 13}
};
static final int [][] good =
{
    {-4, -1},
    {14, 17},
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
    boolean on;
    int appType;   // note app type : NOTE_APP_WHITE, NOTE_APP_RED
    int noteType;  // note type     : NOTE_SHORT, NOTE_LONG
    //
    int x, y;       // now position
    int notePos;    // which column: d, f, j, k
    //
    // int start;      // Start time in ms
    // int dur;        // Duration in ms
    
    // judge
    boolean prevKey;

    Note()
    {
        // cnter = new Counter(dur);
        on = true;
        appType = NOTE_APP_NONE;
        noteType = NOTE_NONE;
        // judge
        prevKey = false;
    }
    Note(int appType, int noteType, int notePos, int x, int y)
    {
        this.appType = appType;
        this.noteType = noteType;
        this.notePos = notePos;
        this.x = x;
        this.y = y;
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

        if(y > endPoint[notePos][1] + 2 * pressedBlockH)
            on = false;
    }
    void judge()
    {
        if(!on)
            return;

        println(x, y);
        int judgeY = y - endPoint[notePos][1];
        println(judgeY);

        // the column of the notePos is pressed
        if(!prevKey && keyHandler.getKey(notePos))
        {
            if(judgeY >= perfect[0] && judgeY <= perfect[1])
            {
                scene.addPerfect();
                on = false;
            }
            else if((judgeY >= great[0][0] && judgeY <= great[0][1])
                 || (judgeY >= great[1][0] && judgeY <= great[1][1]))
            {
                scene.addGreat();
                on = false;
            }
            else if(judgeY >= good[0][0] && judgeY <= good[0][1]
                || judgeY >= good[1][1] && judgeY <= good[1][1])
            {
                scene.addGood();
                on = false;
            }
        }
        prevKey = keyHandler.getKey(notePos);
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
    void setEndPos(int pos)
    {
        notePos = pos;
    }
    void setType(int app, int type)
    {
        appType = app;
        noteType = type;
    }
    // void setTime(int s, int d)
    // {
    //     start = s;
    //     dur = d;
    // }
}