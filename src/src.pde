import java.io.FilenameFilter;
import java.nio.file.Path;
import java.nio.file.Paths;
import ddf.minim.*;

static PApplet application = null;

static final int GLOBAL_MENU    = 0;
static final int GLOBAL_GAME    = 1;
static final int GLOBAL_END     = 2;
static final int GLOBAL_LOADING = 3;
// future
static final int GLOBAL_SELECT_SONG = 4;
static final int GLOBAL_SETTING_SCR = 5;
static final int GLOBAL_PAUSE = 6;

// Constants
static final int fps = 120;
//
static String proj_path = "";
static String serial_port = "";
static boolean serial_valid = false;

void setInfo()
{
    if(OsUtils.isWindows())
    {
        // proj_path = "C:\\Users\\lpc05\\Desktop\\otogemu\\src\\";
        proj_path = "C:\\Users\\sf643\\Desktop\\otogemu\\src\\";
        serial_port = "COM5";
    }
    else if(OsUtils.isMacos())
        proj_path = "/Users/roy4801/Desktop/Program/myProj/otogemu/src/";
    else
    {
        proj_path = "/home/roy4801/Desktop/project/otogemu/src/";
        serial_port = "/dev/ttyACM0";
    }
    // Check if a serial port is valid
    println("Serial List:");
    String[] list = Serial.list();
    for(int i = 0; i < list.length; i++)
    {
        println(">>> " + list[i]);
        if(Objects.equals(list[i], serial_port))
        {
            serial_valid = true;
            break;
        }
    }
}


/// Global objects
KeyHandler keyHandler;
LoadingScene loading;
Scene scene;
Game game;

int globalState = GLOBAL_LOADING;

////////////////////////////////////////
// TESTING
void test()
{
}
////////////////////////////////////////

// Init
void setup()
{
    application = this;
    size(800, 600, P3D);
    noStroke();
    smooth();
    frameRate(fps);
    randomSeed(0);

    setInfo();
    ////////////////////////////////////////
    // TESTING
    test();
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
    // TODO: Move the out (to game?)
    // A key mus all handled by a keyHandler
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
    else if(key == ESC && globalState != GLOBAL_GAME)
    {
        key = 0;
    }

    // testing //////////////////////////////////
}
void keyReleased()
{
    keyHandler.setKey(key, false);
}
void serialEvent(Serial p)
{
    keyHandler.serialEvent(p);
}
//----------------------------------------------
// Draw frames
void draw()
{
    ////////////////////////////////////////
    // TESTING
    // test();
    ////////////////////////////////////////

    switch(globalState)
    {
        case GLOBAL_LOADING:
        {
            if(loading.fillX == 190)
            {
                loadNoteImage();
                game.loadResource();
                scene.loadResource();
            }
            loading.loadScene();
            loading.addFillX();
            if(loading.fillX == 710)
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

            // println("src.draw(): gameState = " + game.gameState);

            // Draw
            scene.initgamebackground();

            game.draw();
            scene.printscore();
            scene.printcombo(scene.getcombo());

            // println("src.draw(): game.isEnd() = " + (game.isEnd()?"True":"False"));
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
            game.pause();
            // Check if one clicked btns
            if(mousePressed && mouseButton == LEFT)
                click_type = scene.click();
            switch(click_type)
            {
                // Resume the gameplay
                case CLICK_PSTART:
                    if(scene.clickPStart)
                    {
                        game.resume();
                        scene.initgamebackground();
                        globalState = GLOBAL_GAME;
                    }
                break;
                // Back to the main menu
                case CLICK_BACK:
                    if(scene.clickBack)
                    {
                        // Stop the game
                        game.stop();
                        game.reloadCurrentFumen();
                        scene.initmenu();
                        globalState = GLOBAL_MENU;
                    }
                break;
            }
        }
        // testing //////////////////////////////////
    }
}
