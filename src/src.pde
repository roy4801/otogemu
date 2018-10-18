import processing.sound.*;

// Constants
static final int fps = 60;

//
SoundFile file;
Counter [] ctList;
Counter c;

//
KeyHandler keyHandler;

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
    game = new Game();

    c = new Counter();
    c.setDuration(1000);
    c.start();
}

boolean timeCnt = true;

//----------------------------------------------
// Processing input
void keyPressed()
{
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
    // scene.draw(); // background, score, 
    game.draw(); // game


    // if(keyD)
    // {
    //     print("D");
    //     fill(0, 0, 0);
    //     rect(trackPos[0] + 6, trackPos[1] + 502, 36, 13);
    // }


    // image(noteImg[0], 100, 100, 40, 20);
    // image(noteImg[1], 150, 100, 40, 20);

    if(timeCnt)
        // println(millis());

    if(timeCnt && c.isOver())
    {
        // println("The counter is over");
        timeCnt = false;
    }
}