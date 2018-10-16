import processing.sound.*;

SoundFile file;

Counter [] ctList;

Counter c;

void setup()
{
    size(800, 600);
    noStroke();
    smooth();
    frameRate(30);
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
    if(timeCnt)
        println(millis());
    
    // Update
    c.update();


    // Draw
    if(timeCnt && c.isOver())
    {
        println("The counter is over");
        timeCnt = false;
    }


    // if(keyPressed && key == 'p')
    // {
    //     file.play();
    // }
}