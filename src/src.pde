import processing.sound.*;

// Constants
static final int fps = 30;

//
SoundFile file;
Counter [] ctList;
Counter c;


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

    

    c = new Counter();
    c.setDuration(1000);
    c.start();
}

boolean timeCnt = true;

void draw()
{
    //----------------------------------------------
    // Processing input
    
    // if(keyPressed && key == 'p')
    // {
    //     file.play();
    // }
    
    //----------------------------------------------
    // Update Game Logic
    c.update();

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