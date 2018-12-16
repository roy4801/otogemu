int [] loadingCase = {1, 2, 3};

class LoadingScene
{
    PImage loadingBG;
    //
    int count;
    int ldRate;
    int rtJudge;
    int choosCase;
    //
    int fillX;
    int fillY;
    //
    boolean isLoad;

    LoadingScene()
    {
        loadingBG = LoadUI("loadingbackground.png");
        //
        fillX = 0;
        fillY = 20;
        //
        count = 0;
        ldRate = 1;
        rtJudge = 120;
        choosCase = 1;
        //
        isLoad = true;
    }

    void setBackground()
    {
        image(loadingBG, 0, 0, 800, 600);
    }

    void loadScene()
    {
        setBackground();

        stroke(0, 0, 0);
        noFill();
        strokeWeight(2);
        rect(100, 500, 600, 20);

        if(fillX <= 600)
        {
            noStroke();
            fill(255, 255, 255);
            rect(101, 501, fillX-1, fillY-1);

            loadNumber(fillX);
        }
        else
        {
            noStroke();
            fill(255, 255, 255);
            rect(101, 501, 600-1, fillY-1);

            loadNumber(600);
        }
    }

    void loadNumber(int fillX)
    {
        textSize(30);

        textAlign(RIGHT);

        text("Loading", 215, 490);
        ldRate++;

        if(ldRate > rtJudge)
          ldRate = 1;

        printCommon(ldRate);

        fillX = fillX / 6;

        textAlign(CENTER);
        text(str(fillX) + "%", 285, 491);
    }

    void printCommon(int ldRate)
    {
        if(ldRate % (rtJudge/10) == 0)
        {
            count++;
        }
        
        textAlign(CENTER);
        
        if(count > 3)
            count = 0;

        if(count == 0)
        {
            text(" ", 200, 490);
        }
        else if(count == 1)
        {
            text(".", 220, 490);
        }
        else if(count == 2)
        {
            text("..", 225, 490);
        }
        else
        {
            text("...", 230, 490);
        }
    }

    void addFillX()
    {
        if(fillX == 190)
            choosCase++;

        if(choosCase == loadingCase[0])
            fillX += 10;
        else if(choosCase == loadingCase[1])
            fillX += 20;
    }
}