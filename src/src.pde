import processing.sound.*;

// Constants
static final int fps = 120;

//
SoundFile file;

//
KeyHandler keyHandler;
Scene scene;
Game game;


// Init
void setup()
{
    size(800, 600);
    noStroke();
    smooth();
    frameRate(fps);
    randomSeed(0);

    // file = new SoundFile(this, "bg1.mp3");
    // println("Channel= " + file.channels());
    // println("Duration= " + file.duration() + " seconds");
    // file.play();
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