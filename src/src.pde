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
    game.start();
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

void draw()
{
    // Clear the screen
    background(128);

    //----------------------------------------------
    // Update Game Logic
    game.update();


    //----------------------------------------------
    // Draw
    scene.draw(); // background, score, 
    game.draw(); // game

    ////////////////////////////////////////
    // TESTING
    if(keyHandler.getKey(KEY_ESC))
        println("ESC");
}
