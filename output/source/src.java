import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 
import java.util.Arrays; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class src extends PApplet {



// Constants
static final int fps = 30;

//
SoundFile file;
Counter [] ctList;
Counter c;


// Init
public void setup()
{
    
    noStroke();
    
    frameRate(fps);
    randomSeed(0);

    // file = new SoundFile(this, "bg1.mp3");
    // println("Channel= " + file.channels());
    // println("Duration= " + file.duration() + " seconds");
    // file.play();
    KeyHandler kh = new KeyHandler();

    kh.setKey(KeyType.KEY_D, true);

    for(int i = 0; i < TotalKeys; i++)
    {
        if(kh.getKey(i))
        {
            println("Yes");
        }
    }

    c = new Counter();
    c.setDuration(1000);
    c.start();
}

boolean timeCnt = true;

public void draw()
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
class Counter
{
    boolean on, over;
    int dur;
    int start;

    // Constructer
    Counter()
    {
        on = over = false;
        dur = start = -1;
    }
    Counter(int dur)
    {
        this.dur = dur;
    }
    //
    public void setDuration(final int dur)
    {
        this.dur = dur;
    }
    public void start()
    {
        if(on)
        {
            println("Sound: Counter is already on!");
            return;
        }

        if(dur != -1)
        {
            on = true;
        }
        else
        {
            println("Sound: The duration or start is -1");    
        }
    }
    public void update()
    {
        if(on)
        {
            int now = millis();

            if(now - start >= dur)
                over = true;
        }
    }

    public boolean isOver()
    {
        return over;
    }
}


enum KeyType
{
    KEY_D,
    KEY_F,
    KEY_J,
    KEY_K,
    KEY_TOTAL
}

static final int TotalKeys = KeyType.KEY_TOTAL.ordinal();

class KeyHandler
{
	boolean [] kState;

	KeyHandler()
	{
		kState = new boolean[TotalKeys];

		Arrays.fill(kState, false);
	}

	public void setKey(KeyType type, boolean flag)
	{
		kState[type.ordinal()] = flag;
	}
	public boolean getKey(KeyType type)
	{
		return kState[type.ordinal()];
	}
	public boolean getKey(int type)
	{
		return kState[type];
	}
}
static final float speed = 1.f;
static final float moveUnit = 1.f / (float)fps;

class Note
{
	int x, y;
	int endX, endY; // end position
	//
	int sMs; // Start time in ms
	int dur; // Duration in ms
	//
	Counter cnter;
	PImage img; // future

	Note()
	{
		cnter = new Counter(dur);
	}

	public void update()
	{
		cnter.update();

		y += moveUnit * speed;
	}
	/**
	 * void display()
	 */
	public void display()
	{
		fill(255, 0, 0);
		rect(x, y, 100, 200);
	}
}
  public void settings() {  size(800, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "src" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
