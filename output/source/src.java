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

//
KeyHandler keyHandler;


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
public void keyPressed()
{
    keyHandler.setKey(key, true);
}
public void keyReleased()
{
    keyHandler.setKey(key, false);
}

public void draw()
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
	public void setKey(char c, boolean flag)
	{
		if(c == 'd' || c == 'D')
			setKey(KeyType.KEY_D, flag);
		if(c == 'f' || c == 'F')
			setKey(KeyType.KEY_F, flag);
		if(c == 'j' || c == 'J')
			setKey(KeyType.KEY_J, flag);
		if(c == 'k' || c == 'K')
			setKey(KeyType.KEY_K, flag);
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
static final float unit = 1.f;
static final float moveUnit = unit / (float)fps;


enum noteAppearType
{
	NOTE_APP_WHITE,
	NOTE_APP_RED,
	NOTE_APP_TOTAL
}

enum noteType
{
	NOTE
}

PImage [] noteImg = new PImage[2];

public void loadNoteImage()
{
	noteImg[noteAppearType.NOTE_APP_WHITE.ordinal()] = new PImage();
	noteImg[noteAppearType.NOTE_APP_WHITE.ordinal()] = loadImage("data/note_white.png");
	noteImg[noteAppearType.NOTE_APP_RED.ordinal()] = new PImage();
	noteImg[noteAppearType.NOTE_APP_RED.ordinal()] = loadImage("data/note_red.png");
}

static final int TotalNoteType = noteAppearType.NOTE_APP_TOTAL.ordinal();

class Note
{
	noteAppearType app_type;
	noteType type;
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
