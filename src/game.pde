import java.util.*;

static final int [] trackPos = {100, 0};
static final int [][] btnPos =
{
    {trackPos[0] + 6, trackPos[1] + 516},
    {trackPos[0] + 43, trackPos[1] + 516},
    {trackPos[0] + 81, trackPos[1] + 516},
    {trackPos[0] + 118, trackPos[1] + 516}
};

static final int [][] endPoint =
{
    {trackPos[0] + 6,   trackPos[1] + 503}, // KEY_D
    {trackPos[0] + 43,  trackPos[1] + 503}, // KEY_F
    {trackPos[0] + 81,  trackPos[1] + 503}, // KEY_J
    {trackPos[0] + 118, trackPos[1] + 503}  // KEY_K
};

static final String [] hitSEList = {"soft-hitclap.wav", "normal-hitclap.mp3"};

static final int POS_X = 0;
static final int POS_Y = 1;

static final int pressedBlockW = 37;
static final int pressedBlockH = 13;

// For GAME_WAITING
static final float waitSeconds = 3.0f;

static final int GAME_NONE    = 0;
static final int GAME_PLAYING = 1;
static final int GAME_STOP    = 2;
static final int GAME_WAITING = 3; // for waiting secs in the begining
static final int GAME_PAUSE   = 4; // for pause the game during a gameplat

static final int GAME_ENTRY = GAME_WAITING;

class Game
{
    // imgs
    PImage trackImg;
    PImage []btnImg;
    
    // UI layers
    ArrayList<ColorLayer> layers = new ArrayList<ColorLayer>();
    Map<String, Integer> layerIndex = new HashMap<String, Integer>();

    // sound effect
    ddf.minim.AudioSample hitSE; // TODO(roy4801): fix this
    int hitse_type = 0;

    // fumen
    FumenParser fumenParser = new FumenParser();
    Fumen nowFumen = null;
    ArrayList<Note> noteList = null;

    // Time related
    Clock clk = new Clock();
    CountDownClock wait = new CountDownClock(waitSeconds); // for GAME_WAITING

    // prev key
    boolean [] prev = new boolean[TotalKeys];

    // game state
    int gameState = GAME_NONE;

    // Flags
    boolean b_seEnable = false;
    boolean b_drawJudgingArea = false;

    Game()
    {
        // init
        Arrays.fill(prev, false);
        // test
        setupUILayers();
    }
    // Loading functions
    void loadResource()
    {
        // Loading resources
        trackImg = LoadImage("4k_layout.png");

        btnImg = new PImage[TotalKeys];

        btnImg[KEY_D] = LoadImage("4k_d.png");
        btnImg[KEY_F] = LoadImage("4k_f.png");
        btnImg[KEY_J] = LoadImage("4k_j.png");
        btnImg[KEY_K] = LoadImage("4k_k.png");

        // Loading sound effect
        if(b_seEnable)
            hitSE = LoadSoundEffect(hitSEList[hitse_type]);
    }

    void loadFumenResource(String str)
    {
        nowFumen = fumenParser.getFumen(str);
        noteList = nowFumen.getNoteList();
    }

    void reloadCurrentFumen()
    {
        nowFumen.resetFumen();
        noteList = nowFumen.getNoteList();
        gameState = GAME_NONE;
    }

    void setupUILayers()
    {
        // Score background layer
        // layerIndex.put("score", layers.size());
        
        // layer.add(scoreLayer);
        
        // print(String.format("Game.setupUILayers(): %d\n", layers.size()));
    }
    /////////////////////////////////////
    /// main function
    void start()
    {
        // println("Game.start()");
        wait.start();
        gameState = GAME_ENTRY;
        // println("Game.start(): gameState = " + gameState);
    }

    void stop()
    {
        nowFumen.stop();
        gameState = GAME_STOP;
    }

    void pause()
    {
        nowFumen.pause();
        clk.pause();
        gameState = GAME_PAUSE;
    }

    void resume()
    {
        nowFumen.resume();
        clk.resume();
        gameState = GAME_PLAYING;
    }

    // Need to refactoring
    void update()
    {
        if(gameState == GAME_PLAYING)
        {
            for(int i = 0; i < noteList.size(); i++)
            {
                // println("Update " + str(i) + "\n");
                noteList.get(i).check(clk);
                noteList.get(i).update();
                noteList.get(i).judge();
            }

            // println("Game.update(): nowFumen.isMusicEnd() = "+(nowFumen.isMusicEnd() ? "True" : "False"));
            // Possibily bugged out
            if(nowFumen.isMusicEnd())
            {
                gameState = GAME_STOP;
            }
        }
        else if(gameState == GAME_WAITING)
        {
            if(wait.isEnd())
            {
                // println("Game.update(): wait ended");
                gameState = GAME_PLAYING;
                clk.start();
                // println("Game.update(): Start the clk");
            }
        }
    }

    void draw()
    {
        switch(gameState)
        {
            case GAME_WAITING:
            {
                // Track background
                image(trackImg, trackPos[0], trackPos[1], trackImg.width, trackImg.height);

                // Note
                for(int i = 0; i < noteList.size(); i++)
                    noteList.get(i).draw(true);
                /////

                // println("GAME_WAITING");
                float s = waitSeconds - wait.getPassedSec();
                final int[] textReg = {trackPos[0] + 80, trackPos[1] + 100};

                if(s >= 1.f)
                    text((int)s, textReg[0], textReg[1]);
                else
                    text("Start", textReg[0], textReg[1]);
            }
            break;

            case GAME_PLAYING:
            {
                // Track background
                image(trackImg, trackPos[0], trackPos[1], trackImg.width, trackImg.height);

                // Key
                fill(255, 255, 255); // Color white
                if(keyHandler.getKey(KEY_D))
                {
                    rect(endPoint[KEY_D][POS_X], endPoint[KEY_D][POS_Y], pressedBlockW-1, pressedBlockH);

                    if(b_seEnable && !prev[KEY_D])
                        hitSE.trigger();
                }
                if(keyHandler.getKey(KEY_F))
                {
                    rect(endPoint[KEY_F][POS_X], endPoint[KEY_F][POS_Y], pressedBlockW, pressedBlockH);

                    if(b_seEnable && !prev[KEY_F])
                        hitSE.trigger();
                }
                if(keyHandler.getKey(KEY_J))
                {
                    rect(endPoint[KEY_J][POS_X], endPoint[KEY_J][POS_Y], pressedBlockW-1, pressedBlockH);

                    if(b_seEnable && !prev[KEY_J])
                        hitSE.trigger();
                }
                if(keyHandler.getKey(KEY_K))
                {
                    rect(endPoint[KEY_K][POS_X], endPoint[KEY_K][POS_Y], pressedBlockW-1, pressedBlockH);

                    if(b_seEnable && !prev[KEY_K])
                        hitSE.trigger();
                }
                // Save now key state to prev for next loop
                for(int i = 0; i < TotalKeys; i++)
                    prev[i] = keyHandler.getKey(i);

                // Note
                for(int i = 0; i < noteList.size(); i++)
                    noteList.get(i).draw(false);

                // d f j k buttons overlay
                if(!b_drawJudgingArea)
                {
                    image(btnImg[KEY_D], btnPos[KEY_D][0], btnPos[KEY_D][1]);
                    image(btnImg[KEY_F], btnPos[KEY_F][0], btnPos[KEY_F][1]);
                    image(btnImg[KEY_J], btnPos[KEY_J][0], btnPos[KEY_J][1]);
                    image(btnImg[KEY_K], btnPos[KEY_K][0], btnPos[KEY_K][1]);
                }

                // For adjustment use
                if(b_drawJudgingArea)
                    game.drawJudgingArea();

                // Start play fumen music
                nowFumen.playMusic();
            }
            break;

            case GAME_PAUSE:
            {
                image(trackImg, trackPos[0], trackPos[1], trackImg.width, trackImg.height);

                for(int i = 0; i < noteList.size(); i++)
                    noteList.get(i).draw(false);
                if(!b_drawJudgingArea)
                {
                    image(btnImg[KEY_D], btnPos[KEY_D][0], btnPos[KEY_D][1]);
                    image(btnImg[KEY_F], btnPos[KEY_F][0], btnPos[KEY_F][1]);
                    image(btnImg[KEY_J], btnPos[KEY_J][0], btnPos[KEY_J][1]);
                    image(btnImg[KEY_K], btnPos[KEY_K][0], btnPos[KEY_K][1]);
                }
            }
            break;
        }
    }
    /////////////////////////////////////
    /// Get/Set function
    boolean isEnd()
    {
        return gameState == GAME_STOP && gameState != GAME_NONE ? true : false;
    }

    int getNowFumenTotalNote()
    {
        return nowFumen.getNoteListSize();
    }
    /////////////////////////////////////
    void drawJudgingArea()
    {
        int x = endPoint[0][POS_X], y = judgeLineY;
        int wid = 4*pressedBlockW + 1;
        int fade = 100;

        // Perfect
        fill(0, 255, 0, fade);   // green
        rect(x, y, wid, perfect[1]);
        rect(x, y - perfect[1] + 1, wid, perfect[1]);

        // Great
        int gw = great[1][1] - great[1][0]+1;
        fill(255, 255, 0, fade); // yellow
        rect(x, y + perfect[1], wid, gw);
        rect(x, y - great[1][1] + 1, wid, gw);

        // Good
        int gdw = good[1][1] - good[1][0]+1;
        fill(0, 0, 255, fade);   // blue
        rect(x, y + great[1][1], wid, gdw);
        rect(x, y - good[1][1] + 1, wid, gdw);

        // Miss
        int msw = miss[1][1] - miss[1][0]+1;
        fill(255, 255, 255, fade); // white
        rect(x, y + good[1][1], wid, msw);
        rect(x, y - miss[1][1] + 1, wid, msw);

        // Centural
        fill(255, 0, 0);
        rect(x, y - 1 , wid, 3);

        // End line
        fill(255, 0, 0);
        rect(x, endLineY - 2, wid, 3);
    }
}