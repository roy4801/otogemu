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
    if(key == ESC)
    {
        key = 0;//clear the "ESC" key
    }
    
    keyHandler.setKey(key, true);
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


    if(keyHandler.getKey(KEY_ESC))
        println("ESC");
    // if(keyD)
    // {
    //     print("D");
    //     fill(0, 0, 0);
    //     rect(trackPos[0] + 6, trackPos[1] + 502, 36, 13);
    // }


    // image(noteImg[0], 100, 100, 40, 20);
    // image(noteImg[1], 150, 100, 40, 20);

}