import processing.sound.*;

// Constants
static final int fps = 30;

//
SoundFile file;
Counter [] ctList;
Counter c;

//
KeyHandler keyHandler;


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

    image(noteImg[0], 100, 100, 40, 20);
    image(noteImg[1], 150, 100, 40, 20);

    keyHandler = new KeyHandler();
    

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
    //----------------------------------------------
    // Update Game Logic
    c.update();

    if(keyHandler.getKey(KeyType.KEY_D))
        print("D");
    if(keyHandler.getKey(KeyType.KEY_F))
        print("F");
    if(keyHandler.getKey(KeyType.KEY_J))
        print("J");
    if(keyHandler.getKey(KeyType.KEY_K))
        print("K");

    println();


    //----------------------------------------------
    // Draw
    if(timeCnt)
        // println(millis());

    if(timeCnt && c.isOver())
    {
        // println("The counter is over");
        timeCnt = false;
    }
}