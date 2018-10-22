import processing.sound.*;
import java.io.FilenameFilter;
import java.nio.file.Path;
import java.nio.file.Paths;

// Constants
static final int fps = 120;


static String proj_path = "";

void path()
{
    if(OsUtils.isWindows())
        proj_path = "C:\\Users\\lpc05\\Desktop\\otogemu\\src\\";
    else if(OsUtils.isMacos())
        proj_path = "/Users/roy4801/Desktop/Program/myProj/otogemu/src/";
}

//
KeyHandler keyHandler;
Scene scene;
Game game;

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
    // Loading materials
    loadNoteImage();
    keyHandler = new KeyHandler();
    scene = new Scene();
    game = new Game();
    scene.initmenu();
    //game.start();
}

boolean timeCnt = true;

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

boolean print = true;
int now = 1;

void Menu(){

    if(scene.menu){

        int click_type = -1;
        if(mousePressed && mousePressed)
            click_type = scene.click();

        switch(click_type){
            
            case CLICK_INFO  :
                if(scene.clickInfo)
                    scene.buildInfo();
            break;
            case CLICK_START :
                if(scene.clickStart){

                    scene.initgamebackground();
                    scene.initscoreboard();
                    scene.isStart = true;
                    game.start();
                }
            break;
            case CLICK_BACK  :
                if(scene.clickBack)
                    scene.initmenu();
            break;
        }
    }
}

void gamePlay(){

    if(scene.isStart){

        //scene.initgamebackground();
        game.update();
        game.draw();
        //scene.printscore();
        //scene.printcombo(scene.getcombo());
    }
}

void endGame(){

    if(scene.isEnd){

    scene.FinishScene(1);
    int click_type = -1;
    if(mousePressed && mouseButton == LEFT)
        click_type = scene.click();

    if(click_type == CLICK_BACK){

        if(scene.clickBack)
            scene.initmenu();
    }
  }
}

void draw()
{
    // Clear the screen
    Menu();

    //----------------------------------------------
    // Update Game Logic
    //game.update();
    gamePlay();

    //----------------------------------------------
    // Draw
    //game.draw(); // game

    ////////////////////////////////////////
    // TESTING
    //if(keyHandler.getKey(KEY_ESC))
    //    println("ESC");
}
