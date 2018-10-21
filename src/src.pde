import processing.sound.*;
import java.nio.file.Path;
import java.nio.file.Paths;

// Constants
static final int fps = 120;

//
KeyHandler keyHandler;
Scene scene;
Game game;

////////////////////////////////////////
// TESTING
// FumenParser fumenParser = new FumenParser();
void file(String path)
{
    BufferedReader br = null;
    FileReader fr = null;

    try {

        //br = new BufferedReader(new FileReader(FILENAME));
        fr = new FileReader(path);
        br = new BufferedReader(fr);

        String sCurrentLine;

        while ((sCurrentLine = br.readLine()) != null) {
            println(sCurrentLine);
        }

    } catch (IOException e) {

        e.printStackTrace();

    } finally {

        try {

            if (br != null)
                br.close();

            if (fr != null)
                fr.close();

        } catch (IOException ex) {

            ex.printStackTrace();

        }

    }
}

void test()
{
    Path currentRelativePath = Paths.get("");
    String s = currentRelativePath.toAbsolutePath().toString() + "/src/1.txt";
    println(s);

    file(s);

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
