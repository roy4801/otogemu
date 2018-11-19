import processing.sound.*;
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

static final String [] hitSEList = {"soft-hitclap.wav", "normal-hitclap.wav"};

static final int POS_X = 0;
static final int POS_Y = 1;

static final int pressedBlockW = 37;
static final int pressedBlockH = 13;

// For GAME_WAITING
static final int waitSeconds = 3;

static final int GAME_NONE    = 0;
static final int GAME_PLAYING = 1;
static final int GAME_STOP    = 2;
static final int GAME_WAITING = 3; // for waiting secs in the begining

static final int GAME_ENTRY = GAME_WAITING;

class Game
{
    // imgs
    PImage trackImg;
    PImage []btnImg;

    // sound effect
    SoundFile hitSE;
    int hitse_type = 0;
    // SoundHandler se = new SoundHandler();

    // fumen
    FumenParser fumenParser = new FumenParser();
    Fumen nowFumen = null;
    ArrayList<Note> noteList = null;

    Clock clk = new Clock();
    CountDownClock wait = new CountDownClock(waitSeconds);

    // prev key
    boolean [] prev = new boolean[TotalKeys];

    // game state
    int gameState = GAME_NONE;

    Game()
    {
        // init
        Arrays.fill(prev, false);
    }
    //
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
        // hitSE = LoadSoundEffect(hitSEList[hitse_type]);
        // se.addSoundFile(hitSEList[hitse_type], hitSE);

        // Loading fumen
        nowFumen = fumenParser.getFumen("bg1");
        noteList = nowFumen.getNoteList();
        
    }

    void reloadCurrentFumen()
    {
        nowFumen.resetFumen();
        noteList = nowFumen.getNoteList();
        gameState = GAME_NONE;
    }
    /////////////////////////////////////
    /// main function
    void start()
    {
        println("Game.start()");
        clk.start();
        gameState = GAME_ENTRY;
        println("gameState: "+gameState);
    }

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

            println("nowFumen.isMusicEnd() ? : "+(nowFumen.isMusicEnd() ? "True" : "False"));
            if(nowFumen.isMusicEnd())
            {
                gameState = GAME_STOP;
            }
        }
        else if(gameState == GAME_WAITING)
        {
            if(wait.isEnd())
            {
                gameState = GAME_PLAYING;
            }
        }
    }

    void draw()
    {
        switch(gameState)
        {
            case GAME_WAITING:
            {
                println("GAME_WAITING");
                float s = wait.getPassedSec();

                if(s >= 3.f)
                    text("Start", 350, 250);
                else if(s >= 2.f)
                    text("1", 350, 250);
                else if(s >= 1.f)
                    text("2", 350, 250);
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

                    // if(!prev[KEY_D])
                    //     se.play(hitSEList[hitse_type]);
                }
                if(keyHandler.getKey(KEY_F))
                {
                    rect(endPoint[KEY_F][POS_X], endPoint[KEY_F][POS_Y], pressedBlockW, pressedBlockH);

                    // if(!prev[KEY_F])
                    //     se.play(hitSEList[hitse_type]);
                }
                if(keyHandler.getKey(KEY_J))
                {
                    rect(endPoint[KEY_J][POS_X], endPoint[KEY_J][POS_Y], pressedBlockW-1, pressedBlockH);

                    // if(!prev[KEY_J])
                    //     se.play(hitSEList[hitse_type]);
                }
                if(keyHandler.getKey(KEY_K))
                {
                    rect(endPoint[KEY_K][POS_X], endPoint[KEY_K][POS_Y], pressedBlockW-1, pressedBlockH);

                    // if(!prev[KEY_K])
                    //     se.play(hitSEList[hitse_type]);
                }

                // Save now key state to prev for next loop
                for(int i = 0; i < TotalKeys; i++)
                    prev[i] = keyHandler.getKey(i);

                // Note
                for(int i = 0; i < noteList.size(); i++)
                    noteList.get(i).draw();


                // d f j k buttons overlay
                image(btnImg[KEY_D], btnPos[KEY_D][0], btnPos[KEY_D][1]);
                image(btnImg[KEY_F], btnPos[KEY_F][0], btnPos[KEY_F][1]);
                image(btnImg[KEY_J], btnPos[KEY_J][0], btnPos[KEY_J][1]);
                image(btnImg[KEY_K], btnPos[KEY_K][0], btnPos[KEY_K][1]);

                // Start play fumen music
                nowFumen.playMusic();
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
}