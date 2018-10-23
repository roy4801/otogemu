import processing.sound.*;
import java.io.FilenameFilter;
import java.nio.file.Path;
import java.nio.file.Paths;

static final int GLOBAL_MENU    = 0;
static final int GLOBAL_GAME    = 1;
static final int GLOBAL_END     = 2;
static final int GLOBAL_LOADING = 3;


// Constants
static final int fps = 120;
static String proj_path = "";

void path()
{
    if(OsUtils.isWindows())
        proj_path = "C:\\Users\\NT2018\\Desktop\\otogemu\\src\\";
    else if(OsUtils.isMacos())
        proj_path = "/Users/roy4801/Desktop/Program/myProj/otogemu/src/";
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
    if(key == ESC)
    {
        exit(); // for testing usage
        // key = 0;
    }
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
            if(loading.fillx == 184)
            {
                loadNoteImage();
                game.loadResource();
                scene.loadResource();
            }

            loading.loadScene();
            loading.addfillx();
            if(loading.fillx == 654)
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

        case GLOBAL_GAME:
        {
            // Update
            game.update();

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

        case GLOBAL_END:
        {
            scene.FinishScene();
            int click_type = -1;
            if(mousePressed && mouseButton == LEFT)
                click_type = scene.click();

            if(click_type == CLICK_BACK){

                if(scene.clickBack)
                {
                    game.reloadCurrentFumen(); // for replay
                    scene.nowScore = 0;
                    globalState = GLOBAL_MENU;
                }
            }
        }
        break;
    }

    ////////////////////////////////////////
    // TESTING
    //if(keyHandler.getKey(KEY_ESC))
    //    println("ESC");
}
