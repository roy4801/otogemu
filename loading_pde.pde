LoadingScene loading;

static final int progressBarWidth = 600;

class LoadingScene
{
	PImage loading_bg;
	//
	int count;
	int ldRate;
	int rtJudge;
	//
	int fillX;
	int fillY;
	//
	boolean isLoad;

	LoadingScene()
	{
		// loading_bg = loadImage("loading_bg.png");
		//
		fillX = 0;
		fillY = 20;
		//
		count = 0;
		ldRate = 1;
		rtJudge = 120;
		//
		isLoad = false;
	}

	void setBackground()
	{
		// image(loading_bg, 0, 0, 800, 600);
	}

	void loadScene()
	{
		setBackground();
		if(fillX >= progressBarWidth)
			fillX = progressBarWidth;

		stroke(0, 0, 0);
		noFill();
		strokeWeight(2);
		rect(100, 500, progressBarWidth, 20);

		noStroke();
		fill(255, 255, 255);
		rect(101, 501, fillX-1, fillY-1);

		loadNumber(fillX);

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
	//
	// Get/Set functions
	int getFillX()
	{
		return fillX;
	}
}

void setup()
{
	size(800, 600);
	frameRate(120);
	loading = new LoadingScene();
	loading.setBackground();
}

void draw()
{
	loading.loadScene();

	if(loading.getFillX() < 25)
		loading.fillX += 1;
}