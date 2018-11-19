import processing.sound.*;
import java.io.FilenameFilter;
import java.nio.file.Path;
import java.nio.file.Paths;

static final int GLOBAL_MENU    = 0;
static final int GLOBAL_GAME    = 1;
static final int GLOBAL_END     = 2;
static final int GLOBAL_LOADING = 3;
// future
static final int GLOBAL_SELECT_SONG = 4;
static final int GLOBAL_SETTING_SCR = 5;

// testing //////////////////////////////////
static final int GLOBAL_PAUSE = 6;
// testing //////////////////////////////////


// Constants
static final int fps = 120;
static String proj_path = "";

void path()
{
    if(OsUtils.isWindows())
        proj_path = "C:\\Users\\lpc05\\Desktop\\otogemu\\src\\";
    else if(OsUtils.isMacos())
        proj_path = "/Users/roy4801/Desktop/Program/myProj/otogemu/src/";
    else
        proj_path = "/home/roy4801/Desktop/project/otogemu/src/";
}

////////////////////////////
/// Global variables
KeyHandler keyHandler;
LoadingScene loading;
Scene scene;
Game game;

int globalState = GLOBAL_LOADING;

////////////////////////////////////////
// TESTING
void test()
{

    exit();
}
////////////////////////////////////////

// Init
void setup()
{
    size(800, 600);
    noStroke();
    smooth();
    frameRate(fps);
    randomSeed(0);

    path();
    ////////////////////////////////////////
    // TESTING
    // test();
    ////////////////////////////////////////

    //----------------------------------------------
    keyHandler = new KeyHandler();
    loading = new LoadingScene();
    scene = new Scene();
    game = new Game();

    loading.loadScene();
}

//----------------------------------------------
// Processing input
void keyPressed()
{
    keyHandler.setKey(key, true);
    // clear the "ESC" key
    // if(key == ESC)
    // {
    //     exit(); // for testing usage
    //     // key = 0;
    // }

    // testing //////////////////////////////////

    if(key == ESC && globalState == GLOBAL_GAME)
    {
        key = 0;
        globalState = GLOBAL_PAUSE;
        tint(38, 38, 38, 100);
        scene.initgamebackground();
        game.draw();
        scene.printscore();
        scene.printcombo(scene.getcombo());
        tint(255, 255, 255, 255);
        scene.pauseScrene();
    }
    // testing //////////////////////////////////
}
void keyReleased()
{
    keyHandler.setKey(key, false);
}
void draw()
{
    switch(globalState)
    {
        case GLOBAL_LOADING:
        {
            if(loading.fillx == 190)
            {

                loadNoteImage();
                game.loadResource();
                scene.loadResource();
            }
            loading.loadScene();
            loading.addfillx();
            if(loading.fillx == 710)
            {
                scene.initmenu();
                globalState = GLOBAL_MENU;
            }
        }
        break;

        case GLOBAL_MENU:
        {
            int click_type = -1;
            if(mousePressed && mouseButton == LEFT)
                click_type = scene.click();

            switch(click_type)
            {
                case CLICK_INFO:
                    if(scene.clickInfo)
                        scene.buildInfo();
                break;

                case CLICK_START:
                    if(scene.clickStart)
                    {
                        scene.initgamebackground();
                        //scene.initscoreboard();
                        // scene.isStart = true;
                        globalState = GLOBAL_GAME;
                        //game.loadBGM();
                        game.start();
                    }
                break;

                case CLICK_BACK:
                    if(scene.clickBack)
                        scene.initmenu();
                break;
            }
        }
        break;
        // Game playing
        case GLOBAL_GAME:
        {
            // Update
            game.update();

            println("gameState: "+game.gameState);

            // Draw
            //scene.initgamebackground();

            game.draw();
            scene.printscore();
            scene.printcombo(scene.getcombo());

            if(game.isEnd())
            {
                globalState = GLOBAL_END;
            }
        }
        break;
        // score screen
        case GLOBAL_END:
        {
            scene.FinishScene();
            int click_type = -1;
            if(mousePressed && mouseButton == LEFT)
                click_type = scene.click();

            if(click_type == CLICK_BACK)
            {
                if(scene.clickBack)
                {
                    game.reloadCurrentFumen(); // for replay
                    scene.nowScore = 0;
                    globalState = GLOBAL_MENU;
                }
            }
        }
        break;
        // testing //////////////////////////////////
        case GLOBAL_PAUSE:
        {
            int click_type = -1;
            if(mousePressed && mouseButton == LEFT)
                click_type = scene.click();

            switch(click_type)
            {
                case CLICK_PSTART:
                    if(scene.clickPStart)
                    {
                        scene.initgamebackground();
                        //scene.initscoreboard();
                        // scene.isStart = true;
                        globalState = GLOBAL_GAME;
                        //game.loadBGM();
                        game.update();
                        game.draw();
                        scene.printscore();
                        scene.printcombo(scene.getcombo());
                    }
                break;

                case CLICK_BACK:
                    if(scene.clickBack)
                    {     
                        scene.initmenu();
                        globalState = GLOBAL_MENU;
                    }
                break;
            }
        }
        // testing //////////////////////////////////
    }


    ////////////////////////////////////////
    // TESTING
}
