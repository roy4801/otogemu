static final int [] trackPos = {100, 0};
static final int [][] btnPos =
{
    {trackPos[0] + 6, trackPos[1] + 516},
    {trackPos[0] + 43, trackPos[1] + 516},
    {trackPos[0] + 81, trackPos[1] + 516},
    {trackPos[0] + 118, trackPos[1] + 516}
};

static final int [][] endPoint =
{
    {trackPos[0] + 6,   trackPos[1] + 503}, // KEY_D
    {trackPos[0] + 43,  trackPos[1] + 503}, // KEY_F
    {trackPos[0] + 81,  trackPos[1] + 503}, // KEY_J
    {trackPos[0] + 118, trackPos[1] + 503}  // KEY_K
};

static final int POS_X = 0;
static final int POS_Y = 1;

static final int pressedBlockW = 37;
static final int pressedBlockH = 13;

class Game
{
    PImage trackImg;
    PImage []btnImg;

    ArrayList<Note> noteList = new ArrayList<Note>();

    Game()
    {
        trackImg = LoadImage("4k_layout.png");

        btnImg = new PImage[TotalKeys];

        btnImg[KEY_D] = LoadImage("4k_d.png");
        btnImg[KEY_F] = LoadImage("4k_f.png");
        btnImg[KEY_J] = LoadImage("4k_j.png");
        btnImg[KEY_K] = LoadImage("4k_k.png");

        // test
        boolean flip = false;
        for(int i = 0; i < 100; i++)
        {
            if(i % 4 == 0 && i != 0)
                flip = !flip;

            if(flip)
                noteList.add(new Note(NOTE_APP_WHITE, NOTE_SHORT, i % 4, endPoint[i % 4][0], 0 - 100 * i));
            else
                noteList.add(new Note(NOTE_APP_WHITE, NOTE_SHORT, 3 - i % 4, endPoint[3 - i % 4][0], 0 - 100 * i));
        }
        
    }

    void start()
    {
        // tmpNoteD.start();

        for(int i = 0; i < noteList.size(); i++)
        {
            // println("Start " + str(i) + "\n");
            noteList.get(i).start();
        }
    }

    void update()
    {
        // tmpNoteD.update();

        for(int i = 0; i < noteList.size(); i++)
        {
            // println("Update " + str(i) + "\n");
            noteList.get(i).update();
            noteList.get(i).judge();
        }


    }

    void draw()
    {
        // Track background
        image(trackImg, trackPos[0], trackPos[1], trackImg.width, trackImg.height);

        // Key
        fill(255, 255, 255); // Color white
        if(keyHandler.getKey(KeyType.KEY_D))
        {
            rect(endPoint[KEY_D][POS_X], endPoint[KEY_D][POS_Y], pressedBlockW-1, pressedBlockH);
        }
        if(keyHandler.getKey(KeyType.KEY_F))
        {
            rect(endPoint[KEY_F][POS_X], endPoint[KEY_F][POS_Y], pressedBlockW, pressedBlockH);
        }
        if(keyHandler.getKey(KeyType.KEY_J))
        {
            rect(endPoint[KEY_J][POS_X], endPoint[KEY_J][POS_Y], pressedBlockW-1, pressedBlockH);
        }
        if(keyHandler.getKey(KeyType.KEY_K))
        {
            rect(endPoint[KEY_K][POS_X], endPoint[KEY_K][POS_Y], pressedBlockW-1, pressedBlockH);
        }

        // Note
        for(int i = 0; i < noteList.size(); i++)
            noteList.get(i).draw();


        // d f j k buttons overlay
        image(btnImg[KEY_D], btnPos[KEY_D][0], btnPos[KEY_D][1]);
        image(btnImg[KEY_F], btnPos[KEY_F][0], btnPos[KEY_F][1]);
        image(btnImg[KEY_J], btnPos[KEY_J][0], btnPos[KEY_J][1]);
        image(btnImg[KEY_K], btnPos[KEY_K][0], btnPos[KEY_K][1]);

    }

}