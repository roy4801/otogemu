import processing.sound.*;
import java.io.FilenameFilter;
import java.nio.file.Path;
import java.nio.file.Paths;

// Constants
static final int fps = 120;

static final String proj_path = "/Users/roy4801/Desktop/Program/myProj/otogemu/src/";

//
KeyHandler keyHandler;
Scene scene;
Game game;

////////////////////////////////////////
// TESTING
void test()
{
    FumenParser fumenParser = new FumenParser();
    Fumen f = fumenParser.getFumen("bg1");

    f.music.play();

    // exit();
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


    ////////////////////////////////////////
    // TESTING
    //test();
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


    // TESTING
    if(keyHandler.getKey(KEY_ESC))
        println("ESC");
}
