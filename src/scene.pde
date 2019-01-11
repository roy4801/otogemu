static final int HIT_PERFECT = 0;
static final int HIT_GREAT   = 1;
static final int HIT_GOOD 	 = 2;
static final int HIT_POOR 	 = 3;
static final int HIT_TOTAL 	 = 4;

static final int CLICK_NONE  = -1;
static final int CLICK_INFO  = 0;
static final int CLICK_START = 1;
static final int CLICK_BACK  = 2;
// testing /////////////////////////////////
static final int CLICK_PSTART= 3;
// testing /////////////////////////////////

static final int MAX_SCORE = 1000000;

abstract class Layer
{
	PImage img = null;
	float x, y, w, h;
	// constants
	static final float default_w = 128.f;
	static final float default_h = 128.f;
	// constructors
	Layer()
	{
		w = default_w;
		h = default_h;

		x = y = 0;
	}
	Layer(float x_, float y_, float w_, float h_)
	{
		x = x_;
		y = y_;
		w = w_;
		h = h_;
	}
	Layer(PImage image, float x_, float y_, float w_, float h_)
	{
		img = image;
		x = x_;
		y = y_;
		w = w_;
		h = h_;
	}
	// main
	void draw()
	{
		if(img != null)
			image(img, x, y, w, h);
		else
			println("Layer.draw(): img is null");
	}

	// Init the image of a layer
	protected abstract void initImage();

	// getters/setters
	void setSize(float w_, float h_)
	{
		w = w_;
		h = h_;
	}
	void setPos(float x_, float y_)
	{
		x = x_;
		y = y_;
	}
	void setRect(float x_, float y_, float w_, float h_)
	{
		setSize(w_, h_);
		setPos(x_, y_);
	}
}

final color BLACK_LAYER = color(0, 0, 0, 255);
final color WHITE_LAYER = color(255, 255, 255, 255);
final color RED_LAYER   = color(255, 0, 0, 255);
final color GREEN_LAYER = color(0, 255, 0, 255);
final color BLUE_LAYER  = color(0, 0, 255, 255);
class ColorLayer extends Layer
{
	color colour;

	ColorLayer(color type)
	{
		colour = type;
		initImage();
	}
	ColorLayer(color type, int alpha)
	{
		colour = type;
		alpha <<= 24;
		colour &= alpha;
		initImage();
	}
	ColorLayer(int r, int g, int b, int a)
	{
		colour = color(r, g, b, a);
		initImage();
	}

	// @override
	protected void initImage()
	{
		img = createImage((int)w, (int)h, ARGB);
		for(int i = 0; i < img.pixels.length; i++)
		{
			img.pixels[i] = colour;
		}
	}

	void setColor(int r, int g, int b, int a)
	{
		colour = color(r, g, b, a);
		initImage();
	}
}

class UILayer
{
	ArrayList<Layer> layers = new ArrayList<Layer>();
    Map<String, Integer> layerIndex = new HashMap<String, Integer>();

    UILayer()
    {
    }

    void addLayer(String name, Layer l)
    {
    	if(!layerIndex.containsKey(name))
    	{
    		layerIndex.put(name, layers.size());
    		layers.add(l);
    		println(String.format("UILayer.addLayer(): %s -> %d", name, layerIndex.get(name)));
    		println(String.format("UILayer.addLayer(): layer.size() = "+ layers.size()));
    	}
    	else
    	{
    		println(String.format("UILayer.addLayer(): Contains same layer name."));
    	}
    }

    void draw(int idx)
    {
    	layers.get(idx).draw();
    }

    void draw(String name)
    {
    	// println(String.format("UILayer.draw(): %s -> %d", name, layerIndex.get(name)));
    	draw(layerIndex.get(name));
    }
}

class Scene
{
	// store image
	PImage backgroundImg;     // Background image
	PImage infoImg;           // Info image
	PImage startBnImg;        // Start button image
	PImage infoBnImg;         // Info button image
	PImage backBnImg;         // Back button image
	PImage gamebackgroundImg; // Game back ground image
	PImage infotext;          // Info text
	PImage illustration;      // Example image
	////
	// Counters
	int nowScore;
	int combo;
	int numOfperfect;
	int numOfgreat;
	int numOfgood;
	int numOfmiss;
	int highestCombo;
	// last pressed msg
	int lastPress = -1;              // Judgement of sast pressed note
	String [] lastPress_str = {"Perfect", "Great", "Good", "MISS"};
	boolean lastPress_valid = false; // Flag for last judgement msg
	//
	// TODO(roy4801): implement
	ArrayList<Integer> distance = new ArrayList<Integer>();
	//
	boolean clickPStart;
	boolean clickStart;
	boolean clickInfo;
	boolean clickBack;
	//
	int [] hit = new int[HIT_TOTAL];
	//
	UILayer ui = new UILayer();
	//
	Scene()
	{
		// initial counters
		nowScore     = 0;
		combo 		 = 0;
		numOfperfect = 0;
		numOfgreat 	 = 0;
		numOfgood 	 = 0;
		numOfmiss 	 = 0;
		highestCombo = 0;
		//
		clickPStart= false;
		clickStart = true;
		clickInfo  = true;
		clickBack  = false;

		// Add score background layer
		ColorLayer scoreLayer = new ColorLayer(WHITE_LAYER, 128);
        scoreLayer.setPos(615, 0);
        scoreLayer.setSize(190, 55);
        ui.addLayer("score", scoreLayer);

        ColorLayer wholeSceneLayer = new ColorLayer(BLACK_LAYER, 128);
        wholeSceneLayer.setRect(0, 0, 800, 600);
        ui.addLayer("pause", wholeSceneLayer);
	}
	void loadResource()
	{
		// Load image
		//gamebackgroundImg   = LoadUI("gameBackGround_resize.jpg");
		backgroundImg 	    = LoadUI("backgroundImg.jpg");
		startBnImg 		    = LoadUI("start.png");
		infoBnImg 		    = LoadUI("info.png");
		backBnImg		    = LoadUI("back.png");
		infoImg  		    = LoadUI("infoImg.jpg");
		infotext 		    = LoadUI("infotext.png");
		illustration 	    = LoadUI("illustration.png");
	}
	//
	// initial the frame
	// reset the frame
	void initmenu()
	{
		image(backgroundImg, 0, 0, 800, 600);
		setStBn();
		setInfoBn();

		clickPStart= false;
		clickStart = true;
		clickInfo  = true;
		clickBack  = false;

		nowScore     = 0;
		combo 		 = 0;
		numOfperfect = 0;
		numOfgreat   = 0;
		numOfgood 	 = 0;
		numOfmiss 	 = 0;
		highestCombo = 0;
	}

	void getGameBackGroundImg(String dir)
	{
		gamebackgroundImg = loadImage(dir);
	}

	// Initialize the game background
	void initGameBG()
	{
		image(gamebackgroundImg, 0, 0, 800, 600);
		noTint();// temp fix
		//menu 	   = false;
		clickPStart= false;
		clickStart = false;
		clickInfo  = false;
		clickBack  = false;
		//isLeft 	   = false;
	}

	void cleanGameBackGround()
	{
		image(backgroundImg, 0, 0, 800, 600);
		clickPStart= false;
		clickStart = false;
		clickInfo  = false;
		clickBack  = false;
	}
	// main
	void drawScene()
	{
		drawScore();
		drawCombo();
		drawLastPress();
	}

	// void initscoreboard()
	// {
	// 	textSize(40);
	// 	fill(255, 255, 255);
	// 	text("0000000", 620, 40);
	// }
	//
	//buttom set up
	//set start buttom

	// testing /////////////////////////////////////////
	void setStBn(int x, int y)
	{
		image(startBnImg, x, y, 250, 55);
	}
	// testing /////////////////////////////////////////
	void setStBn()
	{
		image(startBnImg, 50, 280, 250, 55);
		//50 <= mouseX <= 300
		//280 <= mouseY <= 335
	}
	//set info buttom
	void setInfoBn()
	{
		image(infoBnImg, 50, 100, 250, 55);
		//50 <= mouseX <= 300
		//250 <= mouseY <= 155
	}
	//set back buttom
	void setbackBn()
	{
		image(backBnImg, 270, 545, 250, 55);
		//270 <= mouseX <= 520
		//545 <= mouseY <= 600
	}
	//
	// build funtion
	// build info page
	void buildInfo()
	{
		image(infoImg, 0, 0, 800, 600);
		image(infotext, 320, 230, 400, 300);
		image(illustration, 100, 20, 145, 500);
		setbackBn();
		clickPStart= false;
		clickStart = false;
		clickInfo  = false;
		clickBack  = true;
		//isLeft 	   = false;
	}
  	//build Finish page
	void FinishScene()
	{
		String sscore = nf(nowScore, 7);

		cleanGameBackGround();

		textAlign(CENTER);
		textSize(80);
		fill(255, 255, 0);
		text("Congratulation!", 400, 100);

		fill(255, 255, 255);
		textSize(50);
		text("score:"+sscore, 400, 200);

		textSize(45);
		text("combo:"+str(highestCombo), 400, 250);

		textSize(40);
		fill(255, 255, 255);
		text("Perfect:"+str(numOfperfect), 280, 300);
		text("Great:"+str(numOfgreat), 550, 300);
		text("Good:"+str(numOfgood), 280, 400);
		text("Miss:"+str(numOfmiss), 550, 400);

		setbackBn();
		clickBack = true;
		tint(255, 255, 255, 255);
	}
	//for testing "ESC" leave game /////////////////////////////////////////////////

	void pauseScrene()
	{
		// Draw the pause ui layer
		ui.draw("pause");

		clickPStart= true;
		clickBack = true;
		setbackBn();
		setStBn(270, 450);
	}
	//for testing "ESC" leave game /////////////////////////////////////////////////

	// Calculating the total score after playing a fumen
	void calcScore()
	{
		int total = game.getNowFumenTotalNote();

		nowScore = (int)(MAX_SCORE * (numOfperfect + 0.8 * numOfgreat + 0.4 * numOfgood) / total);
	}
	//
	//counter add
	void addCombo()
	{
		lastPress_valid = true;
		combo++;
	}
	void addPerfect()
	{
		numOfperfect++;
		// TODO(roy4801) temporary
		lastPress = 0;
	}
	void addGreat()
	{
		numOfgreat++;
		// TODO(roy4801) temporary
		lastPress = 1;
	}
	void addGood()
	{
		numOfgood++;
		// TODO(roy4801) temporary
		lastPress = 2;
	}
	void addMiss()
	{
		numOfmiss++;
		// TODO(roy4801) temporary
		lastPress = 3;
	}
	//
	//get data
	int getcombo()
	{
		return combo;
	}
	int gethighestCombo()
	{
		return highestCombo;
	}
	int getnumOfperfect()
	{
		return numOfperfect;
	}
	int getnumOfgreat()
	{
		return numOfgreat;
	}
	int getnumOfgood()
	{
		return numOfgood;
	}
	int getnumOfmiss()
	{
		return numOfmiss;
	}
	// set
	void addDistance(int dis)
	{
		distance.add(dis);
	}
	//
	// reset counter
	void resetCombo()
	{
		combo = 0;
	}
	// draw the score on the scr
	void drawScore()
	{
		// Draw the score layer
		ui.draw("score");

		calcScore();
		// fill(255, 255, 230);
		// rect(620, 5, 200, 40);
		String sprintscore = nf(nowScore, 7);
		textSize(40);
		fill(255, 255, 255);
		textAlign(LEFT);
		text(sprintscore, 620, 40);
	}
	// draw the combo on the scr
	void drawCombo()
	{
		textSize(35);
		fill(255, 255, 255);
		textAlign(CENTER);

		text(str(combo), 180, 180);
		if(highestCombo < combo)
		  highestCombo = combo;
	}
	// draw the lastPress_str[lastPress] on the scr
	void drawLastPress()
	{
		if(lastPress_valid && lastPress != 1)
		{
			text(lastPress_str[lastPress], 180, 250);
		}
	}
	//
	int click()
	{
		int click_type = CLICK_NONE;
		if(mouseX >= 50 && mouseX <= 300 && mouseY >= 100 && mouseY <= 155)
		{
			if(clickInfo)
				click_type = CLICK_INFO;
		}
		else if(mouseX >= 50 && mouseX <= 300 && mouseY >= 280 && mouseY <= 335)
		{
			if(clickStart)
			{
				//isStart = true;
				click_type = CLICK_START;
			}
		}
		else if(mouseX >= 270 && mouseX <= 520 && mouseY >= 545 && mouseY <= 600)
		{
			if(clickBack)
				click_type = CLICK_BACK;
		}
		// testing //////////////////////////////////////
		else if(mouseX >= 270 && mouseX <= 520 && mouseY >= 450 && mouseY <= 505)
		{
			if(clickPStart)
				click_type = CLICK_PSTART;
		}
		// testing //////////////////////////////////////
		return click_type;
	}
}