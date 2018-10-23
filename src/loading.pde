int [] loadingCase = {1, 2, 3};

class LoadingScene
{
    PImage loadingbackground;
    //
    int count;
    int ldRate;
    int rtJudge;
    int choosCase;
    //
    int fillx;
    int filly;
    //
    boolean isLoad;

    LoadingScene()
    {
        loadingbackground = LoadUI("loadingbackground.png");
        //
        fillx = 0;
        filly = 20;
        //
        count = 0;
        ldRate = 1;
        rtJudge = 120;
        choosCase = 1;
        //
        isLoad = true;
    }

    void setbackgound()
    {
        image(loadingbackground, 0, 0, 800, 600);
    }

    void loadScene()
    {
        setbackgound();
        // if(fillx >= 600)
        // {
        //     fillx = 600;
        // }

        stroke(0, 0, 0);
        noFill();
        strokeWeight(2);
        rect(100, 500, 600, 20);

        if(fillx <= 600)
        {
            noStroke();
            fill(255, 255, 255);
            rect(101, 501, fillx-1, filly-1);

            loadnumber(fillx);
        }
        else
        {
            noStroke();
            fill(255, 255, 255);
            rect(101, 501, 600-1, filly-1);

            loadnumber(600);
        }
    }

    void loadnumber(int fillx)
    {
        textSize(30);

        textAlign(RIGHT);

        text("Loading", 215, 490);
        ldRate++;

        if(ldRate > rtJudge)
          ldRate = 1;

        printcommon(ldRate);

        fillx = fillx / 6;

        textAlign(CENTER);
        text(str(fillx) + "%", 285, 491);
    }

    void printcommon(int ldRate)
    {
        if(ldRate % (rtJudge/4) == 0)
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

    void addfillx()
    {
        if(fillx == 184)
            choosCase++;

        if(choosCase == loadingCase[0])
            fillx += 4;
        else if(choosCase == loadingCase[1])
            fillx += 10;
    }
}

// void setup()
// {
//     size(800, 600);
//     loading = new LoadingScene();
//     loading.setbackgound();
// }

// void draw()
// {
//     loading.loadScene();
//     loading.addfillx();
// }