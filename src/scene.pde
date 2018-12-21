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
	int lastPress = -1;            // Judgement of sast pressed note
	String [] lastPress_str = {"Perfect", "Great", "Good", "MISS"};
	//
	// TODO(roy4801): implement
	ArrayList<Integer> distance = new ArrayList<Integer>();
	//
	boolean clickPStart;
	boolean clickStart;
	boolean clickInfo;
	boolean clickBack;
	// boolean isStart;
	// boolean isEnd;
	// boolean menu;
	// boolean isLeft;
	//
	//
	int [] hit = new int[HIT_TOTAL];
	//
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
		// isStart	   = false;
		// isEnd 	   = false;
		// menu 	   = true;
		// isLeft 	   = true;
		//
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

		//menu 	   = true;
		//isEnd 	   = false;
		//isStart    = false;
		clickPStart= false;
		clickStart = true;
		clickInfo  = true;
		clickBack  = false;
		//isLeft 	   = true;

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

	void initgamebackground()
	{
		//frameRate(fps);
		tint(38, 38, 38, 4);//temp fix
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
		//tint(255, 255, 255, 255);// temp fix
		clickPStart= false;
		clickStart = false;
		clickInfo  = false;
		clickBack  = false;
	}

	void initscoreboard()
	{
		textSize(40);
		fill(255, 255, 255);
		text("0000000", 620, 40);
	}
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
	//build funtion
	//build info page
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
		// frameRate(fps);
		String sscore = nf(nowScore, 7);
		//tint(255, 255, 255, 255);
		//initgamebackground();
		//tint(38, 38, 38, 100);
		cleanGameBackGround();
		//initgamebackground();
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
	//reset counter
	void resetCombo()
	{
		combo = 0;
	}
	//
	void printscore()
	{
		calcScore();
		// fill(255, 255, 230);
		// rect(620, 5, 200, 40);
		String sprintscore = nf(nowScore, 7);
		textSize(40);
		fill(255, 255, 255);
		textAlign(LEFT);
		text(sprintscore, 620, 40);
	}
	void printcombo(int combo)
	{
		textSize(35);
		fill(255, 255, 255);
		textAlign(CENTER);
		//if(combo != 0)
		text(str(combo), 180, 180);
		if(highestCombo < combo)
		  highestCombo = combo;

		//TODO(roy4801): temporary. Need to move
		if(lastPress != -1)
			text(lastPress_str[lastPress], 180, 250);
	}

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

// void keyPressed(){

//   if(key == ESC){

//     key = 0;
//   }
// }

// void setup(){

//   size(800, 600);
//   tmp = new Scene();
//   tmp.initmenu();
// }

// void draw(){
	
  //  if(tmp.menu){
	
  //     if(mousePressed){

  //       if(mouseX >= 50 && mouseX <= 300 && mouseY >= 100 && mouseY <= 155){

  //           if(tmp.clickInfo)
  //             tmp.buildInfo();
  //         }
  //         else if(mouseX >= 50 && mouseX <= 300 && mouseY >= 280 && mouseY <= 335){

  //           if(tmp.clickStart){

  //             tmp.initgamebackground();
  //             tmp.initscoreboard();
  //             tmp.isStart = true;
  //           }
  //         }
  //         else if(mouseX >= 270 && mouseX <= 520 && mouseY >= 545 && mouseY <= 600){

  //           if(tmp.clickBack)
  //             tmp.initmenu();
  //         }
  //     }
  // }




//   if(tmp.isStart){

//     tmp.initgamebackground();

//     int p = (int)random(0, 100);

//     if(p >= 0 && p < 70){
	  
//       s = s + 500;
//       tmp.addcombo();
//       tmp.addperfect();
//     }
//     else if(p >= 70 && p < 90){
	  
//       s = s + 300;
//       tmp.addcombo();
//       tmp.addgreat();
//     }
//     else if(p >= 90 && p < 99){
	  
//       s = s + 150;
//       tmp.addcombo();
//       tmp.addgood();
//     }
//     else{

//       tmp.resetcombo();
//       tmp.addMiss();
//     }
//     count++;

//     tmp.printscore(s);
//     tmp.printcombo(tmp.getcombo());

//     tmp.leavegame();
//     if(tmp.isLeft){

//       tmp.isEnd = false;
//     }

//     if(count == 100){

//       tmp.isStart = false;
//       tmp.isEnd = true;
//       count = 0;
//     }
//   }



//   if(tmp.isEnd){

//     tmp.FinishScene(s);
//     if(mousePressed && mouseButton == LEFT){
  
//       if(mouseX >= 270 && mouseX <= 520 && mouseY >= 545 && mouseY <= 600){

//         if(tmp.clickBack)
//           tmp.initmenu();
//       }
//     }
//   }

//   if(tmp.isLeft){

//     tmp.initmenu();
//     count = 0;
//   }
// }
