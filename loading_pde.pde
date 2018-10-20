loadingscrene loading;
class loadingscrene
{
	//
	//
	//
	//
	//
	//
	PImage loadingbackground;
	//
	//
	//
	//
	//
	int count;
	int ldrate;
	int rtjudge;
	//
	//
	//
	//
	//
	int fillx;
	int filly;
	//
	//
	//
	//
	//
	boolean isload;

	loadingscrene()
	{
		//
		//
		//
		//
		//
		loadingbackground = loadImage("loadingbackground.png"); 
		//
		//
		//
		//
		//
		fillx = 0;
		filly = 20;
		//
		//
		//
		//
		//
		count = 0;
		ldrate = 1;
		rtjudge = 120;
		//
		//
		//
		//
		//
		isload = false;
	}

	void setbackgound()
	{
		frameRate(240);
		image(loadingbackground, 0, 0, 800, 600);
	}

	void loadscrene()
	{
		setbackgound();
		if(fillx >= 600)
			fillx = 600;

		stroke(0, 0, 0);
		noFill();
		strokeWeight(2);
		rect(100, 500, 600, 20);

		noStroke();
		fill(255, 255, 255);
		rect(101, 501, fillx-1, filly-1);

		loadnumber(fillx);

	}

	void loadnumber(int fillx){

		textSize(30);

		textAlign(RIGHT);

		text("Loading", 215, 490);
		ldrate++;

		if(ldrate > rtjudge)
			ldrate = 1;

		printcommon(ldrate);

		fillx = fillx / 6;

		textAlign(CENTER);
		text(str(fillx) + "%", 285, 491);
	}

	void printcommon(int ldrate)
	{
		if(ldrate % (rtjudge/4) == 0)
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
}

void setup()
{
	size(800, 600);
	loading = new loadingscrene();
	loading.setbackgound();
}

void draw()
{
	loading.loadscrene();
	loading.fillx += 1;
}