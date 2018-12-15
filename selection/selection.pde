static final int X_PO = 0;
static final int Y_PO = 1;
static final int X_LE = 2;
static final int Y_LE = 3;

static final int TEXT_X    = 0;
static final int TEXT_Y    = 1;
static final int TEXT_SIZE = 2;

static final int ZERO    = 0;
static final int FIRST   = 1;
static final int SECOND  = 2;
static final int THIRD   = 3;
static final int FOURTH  = 4;
static final int FIFTH   = 5;
static final int SIXTH   = 6;

static final int NOW_CHOOSE =   0;
static final int X_LENGTH   = 650;
static final int MOVE       =   1;

static final float [] seven       = {480, -60, X_LENGTH, 60, ZERO};
static final float [] before_last = {420, 40, X_LENGTH, 70, FIRST};
static final float [] last        = {360, 140, X_LENGTH, 80, SECOND};//
static final float [] now         = {300, 250, X_LENGTH, 100, THIRD};// Y_PO 250~350
static final float [] next	 	  = {360, 380, X_LENGTH, 80, FOURTH};// Y_PO 380~460
static final float [] after_next  = {420, 490, X_LENGTH, 70, FIFTH}; // y_PO 490~560
static final float [] six         = {480, 600, X_LENGTH, 60, SIXTH};

static final float [] chooseBar   = {180, 230, X_LENGTH, 140};
  
static final float [] beforeToseven = {MOVE, map(MOVE, 0, seven[X_PO]-before_last[X_PO], 0, before_last[Y_PO]-seven[Y_PO]), 0, map(MOVE, 0, seven[X_PO]-before_last[X_PO], 0, before_last[Y_LE]-seven[Y_LE])};
static final float [] lastTobefore  = {MOVE, map(MOVE, 0, before_last[X_PO]-last[X_PO], 0, last[Y_PO]- before_last[Y_PO]), 0, map(MOVE, 0, before_last[X_PO]-last[X_PO], 0, last[Y_LE]-before_last[Y_LE])};
static final float [] nowTolast     = {MOVE, map(MOVE, 0, last[X_PO]-now[X_PO], 0, now[Y_PO]-last[Y_PO]), 0, map(MOVE, 0, last[X_PO]-now[X_PO], 0, now[Y_LE]-last[Y_LE])};
static final float [] nextTonow     = {MOVE, map(MOVE, 0, next[X_PO]-now[X_PO], 0, next[Y_PO]-now[Y_PO]), 0, map(MOVE, 0, next[X_PO]-now[X_PO], 0, now[Y_LE]-last[Y_LE])};
static final float [] afterTonext   = {MOVE, map(MOVE, 0, after_next[X_PO]-next[X_PO], 0, after_next[Y_PO]-next[Y_PO]), 0, map(MOVE, 0, after_next[X_PO]-next[X_PO], 0, next[Y_LE]-after_next[Y_LE])};
static final float [] sixToafter    = {MOVE, map(MOVE, 0, six[X_PO]-after_next[X_PO], 0, six[Y_PO]-after_next[Y_PO]), 0, map(MOVE, 0, six[X_PO]-after_next[X_PO], 0, after_next[Y_LE]-six[Y_LE])};

static final float [] text0 	 = {seven[X_PO]+20       , (2*seven[Y_PO] + seven[Y_LE])/2             , 35};
static final float [] text1 	 = {before_last[X_PO]+20 , (2*before_last[Y_PO] + before_last[Y_LE])/2 , 40};
static final float [] text2 	 = {last[X_PO]+20        , (2*last[Y_PO] + last[Y_LE])/2               , 50};
static final float [] text3 	 = {now[X_PO]+20         , (2*now[Y_PO] + now[Y_LE])/2                 , 65};
static final float [] text4 	 = {next[X_PO]+20        , (2*next[Y_PO] + next[Y_LE])/2               , 50};
static final float [] text5  	 = {after_next[X_PO]+20  , (2*after_next[Y_PO] + after_next[Y_LE])/2   , 40};
static final float [] text6  	 = {six[X_PO]+20         , (2*six[Y_PO] + six[Y_LE])/2                 , 35};

static final float [] chooseText = {chooseBar[X_PO]+20   , (2*chooseBar[Y_PO] + chooseBar[Y_LE])/2     , 70};

static final float [] text1_0 = {MOVE, map(MOVE, 0, text0[TEXT_X]-text1[TEXT_X], 0, text1[TEXT_Y]-text0[TEXT_Y]), map(MOVE, 0, text0[TEXT_X]-text1[TEXT_X], 0, text1[TEXT_SIZE]-text0[TEXT_SIZE])};
static final float [] text2_1 = {MOVE, map(MOVE, 0, text1[TEXT_X]-text2[TEXT_X], 0, text2[TEXT_Y]-text1[TEXT_Y]), map(MOVE, 0, text1[TEXT_X]-text2[TEXT_X], 0, text2[TEXT_SIZE]-text1[TEXT_SIZE])};
static final float [] text3_2 = {MOVE, map(MOVE, 0, text2[TEXT_X]-text3[TEXT_X], 0, text3[TEXT_Y]-text2[TEXT_Y]), map(MOVE, 0, text2[TEXT_X]-text3[TEXT_X], 0, text3[TEXT_SIZE]-text2[TEXT_SIZE])};
static final float [] text4_3 = {MOVE, map(MOVE, 0, text4[TEXT_X]-text3[TEXT_X], 0, text4[TEXT_Y]-text3[TEXT_Y]), map(MOVE, 0, text4[TEXT_X]-text3[TEXT_X], 0, text3[TEXT_SIZE]-text4[TEXT_SIZE])};
static final float [] text5_4 = {MOVE, map(MOVE, 0, text5[TEXT_X]-text4[TEXT_X], 0, text5[TEXT_Y]-text4[TEXT_Y]), map(MOVE, 0, text5[TEXT_X]-text4[TEXT_X], 0, text4[TEXT_SIZE]-text5[TEXT_SIZE])};
static final float [] text6_5 = {MOVE, map(MOVE, 0, text6[TEXT_X]-text5[TEXT_X], 0, text6[TEXT_Y]-text5[TEXT_Y]), map(MOVE, 0, text6[TEXT_X]-text5[TEXT_X], 0, text5[TEXT_SIZE]-text6[TEXT_SIZE])};

static final int DOWNWARDS  = -1; // mouse goes down pic goes up
static final int WHEELSTOP  =  0;
static final int UPWARDS    =  1; // mouse goes up pic goes down
static final int CHOOSE     =  2;

int global_wheel = WHEELSTOP;

// String [] songName = {"test11", "test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test10"};
// int textMidIdx = 3;
// boolean addFlag = false;
// boolean minFlag = false;
// int topStatus;
// int bottomStatus;

// int RANGE = songName.length;

class Bars
{
	float x_p;     //bars's x coordinate
	float y_p;     //bars's y coordinate
	float x_l;	   //bars's x length
	float y_l;     //bars's y length

	int initstatus;
	int status;    //bars's position
	/***************************
		FIRST    before_last
		SECOND   last
		THIRD    now
		FOURTH   next
		FIFTH    after_next
		SIXTH    six
	****************************/
	int wheelStatus;

	float textsize;

	String str;
	String lastString;
	String nextString;

	int lastIdx;
	int nextIdx;

	boolean allowTogetinitStatus;


	Bars(float x_p, float y_p, float x_l, float y_l, int status, float textsize)
	{
		this.x_p 	  = x_p;
		this.y_p 	  = y_p;
		this.x_l 	  = x_l;
		this.y_l 	  = y_l;
		this.status   = status;
		this.textsize = textsize;

		wheelStatus = WHEELSTOP;
		initstatus  = status;

		allowTogetinitStatus = false;

	}

	void update(int status, int idx)
	{
		switch(wheelStatus)
		{	
			case UPWARDS:
				switch(status)
				{
					case ZERO:
						x_p -= beforeToseven[X_PO];
						y_p += beforeToseven[Y_PO];
						y_l += beforeToseven[Y_LE];

						textSize(textsize+=text1_0[TEXT_SIZE]);

						if(round(y_p) >= (int) before_last[Y_PO])
						{
							this.status = FIRST;
							textsize    = text1[TEXT_SIZE];
							minFlag     = true;
						}
					break;
					case FIRST:
						x_p -= lastTobefore[X_PO];
						y_p += lastTobefore[Y_PO];
						y_l += lastTobefore[Y_LE];

						textSize(textsize+=text2_1[TEXT_SIZE]);

						if(round(y_p) >= (int)last[Y_PO])
						{
							this.status = SECOND;
							textsize    = text2[TEXT_SIZE];
						}
					break;
					case SECOND:
						x_p -= nowTolast[X_PO];
						y_p += nowTolast[Y_PO];
						y_l += nowTolast[Y_LE];

						textSize(textsize+=text3_2[TEXT_SIZE]);

						if(round(y_p) >= (int)now[Y_PO])
						{
							this.status = THIRD;
							textsize    = text3[TEXT_SIZE];
						}
					break;
					case THIRD:
						x_p += nextTonow[X_PO];
						y_p += nextTonow[Y_PO];
						y_l -= nextTonow[Y_LE];

						textSize(textsize-=text4_3[TEXT_SIZE]);

						if(round(y_p) >= (int)next[Y_PO])
						{
							this.status = FOURTH;
							textsize    = text4[TEXT_SIZE];
						}
					break;
					case FOURTH:
						x_p += afterTonext[X_PO];
						y_p += afterTonext[Y_PO];
						y_l -= afterTonext[Y_LE];

						textSize(textsize-=text5_4[TEXT_SIZE]);

						if(round(y_p) >= (int)after_next[Y_PO])
						{
							this.status = FIFTH;
							textsize    = text5[TEXT_SIZE];
						}
					break;
					case FIFTH:
						x_p += sixToafter[X_PO];
						y_p += sixToafter[Y_PO];
						y_l -= sixToafter[Y_LE];

						textSize(textsize-=text6_5[TEXT_SIZE]);

						if(round(y_p) >= (int)six[Y_PO])
						{
							this.status = ZERO;
							x_p = seven[X_PO];
							y_p = seven[Y_PO];
							y_l = seven[Y_LE];
							textsize    = text0[TEXT_SIZE];
							allowTogetinitStatus = true;
						}
					break;
					case SIXTH:
						textSize(1);
					break;
				}
			break;

			//MouseWheel down picture up
			case DOWNWARDS:
				switch(status)
				{
					case FIRST:	
						x_p += beforeToseven[X_PO];
						y_p -= beforeToseven[Y_PO];
						y_l -= beforeToseven[Y_LE];
						
						textSize(textsize-=text1_0[TEXT_SIZE]);
						
						if(round(y_p) <= (int)seven[Y_PO])
						{
							this.status = SIXTH;
							x_p = six[X_PO];
							y_p = six[Y_PO];
							y_l = six[Y_LE];
							textsize = text6[TEXT_SIZE];
							allowTogetinitStatus = true;
						}

					break;
					case SECOND:
						x_p += lastTobefore[X_PO];
						y_p -= lastTobefore[Y_PO];
						y_l -= lastTobefore[Y_LE];
						
						textSize(textsize-=text2_1[TEXT_SIZE]);
						
						if(round(y_p) <= (int)before_last[Y_PO])
						{
							this.status = FIRST;
							textsize    = text1[TEXT_SIZE];
						}
					break;
					case THIRD:
						x_p += nowTolast[X_PO];
						y_p -= nowTolast[Y_PO];
						y_l -= nowTolast[Y_LE];

						textSize(textsize-=text3_2[TEXT_SIZE]);

						if(round(y_p) <= (int)last[Y_PO])
						{
							this.status = SECOND;
							textsize    = text2[TEXT_SIZE];
						}
					break;
					case FOURTH:
						x_p -= nextTonow[X_PO];
						y_p -= nextTonow[Y_PO];
						y_l += nextTonow[Y_LE];

						textSize(textsize+=text4_3[TEXT_SIZE]);

						if(round(y_p) <= (int)now[Y_PO])
						{
							this.status = THIRD;
							textsize    = text3[TEXT_SIZE];
						}
					break;
					case FIFTH:
						x_p -= afterTonext[X_PO];
						y_p -= afterTonext[Y_PO];
						y_l += afterTonext[Y_LE];

						textSize(textsize+=text5_4[TEXT_SIZE]);

						if((round(y_p) <= (int)next[Y_PO]))
						{
							this.status = FOURTH;
							textsize    = text4[TEXT_SIZE];
						}
					break;
					case SIXTH:
						if(lastIdx == -1)
							lastIdx = 6;
						
						x_p -= sixToafter[X_PO];
						y_p -= sixToafter[Y_PO];
						y_l += sixToafter[Y_LE];
						
						textSize(textsize+=text6_5[TEXT_SIZE]);

						if(round(y_p) <= (int)after_next[Y_PO])
						{
							this.status = FIFTH;
							textsize    = text5[TEXT_SIZE];
							addFlag = true;
						}
					break;
				}
			break;

			case WHEELSTOP:
				switch(status)
				{
					case ZERO:
						x_p = seven[X_PO];
						y_p = seven[Y_PO];
						y_l = seven[Y_LE];
						this.status = ZERO;
						textsize    = text0[TEXT_SIZE];
						textSize(text0[TEXT_SIZE]);
						topStatus = idx;
					break;
					case FIRST:
						x_p = before_last[X_PO];
						y_p = before_last[Y_PO];
						y_l = before_last[Y_LE];
						this.status = FIRST;
						textsize    = text1[TEXT_SIZE];
						textSize(text1[TEXT_SIZE]);
					break;
					case SECOND:
						x_p = last[X_PO];
						y_p = last[Y_PO];
						y_l = last[Y_LE];
						this.status = SECOND;
						textsize    = text2[TEXT_SIZE];
						textSize(text2[TEXT_SIZE]);
					break;
					case THIRD:
						x_p = now[X_PO];
						y_p = now[Y_PO];
						y_l = now[Y_LE];
						this.status = THIRD;
						textsize    = text3[TEXT_SIZE];
						textSize(text3[TEXT_SIZE]);
					break;
					case FOURTH:
						x_p = next[X_PO];
						y_p = next[Y_PO];
						y_l = next[Y_LE];
						this.status = FOURTH;
						textsize    = text4[TEXT_SIZE];
						textSize(text4[TEXT_SIZE]);
					break;
					case FIFTH:
						x_p = after_next[X_PO];
						y_p = after_next[Y_PO];
						y_l = after_next[Y_LE];
						this.status = FIFTH;
						textsize    = text5[TEXT_SIZE];
						textSize(text5[TEXT_SIZE]);
					break;
					case SIXTH:
						x_p = six[X_PO];
						y_p = six[Y_PO];
						y_l = six[Y_LE];
						this.status = SIXTH;
						textsize    = text6[TEXT_SIZE];
						textSize(text6[TEXT_SIZE]);
						bottomStatus = idx;
					break;
				}
			break;
		}
	}

	void draw()
	{
		fill(255);
		rect(x_p, y_p, x_l, y_l);
		writeString(str);
	}

	void writeString(String str)
	{
		fill(70);
		if(str != null)
		{
			text(str, x_p+20, (2*y_p+y_l)/2);
		}
	}

	void changeWheelstate(int state)
	{
		wheelStatus = state;
	}

	void insertString(String text)
	{
		str = text;
	}

	void giveString(String str)
	{
		this.str = str;
	}

	int getinitStatus()
	{	
		if(allowTogetinitStatus)
		{
			allowTogetinitStatus = false;
			return initstatus;
		}
		else
		{
			//println("permission " + status +  " deny!!");
			return -1;		
		}
	}

	int getStatus()
	{
		return status;
	}

	String getStr()
	{
		return str;
	}

}

class Selection
{
	Bars [] bars;

	int r, g, b;
	int state;

	int left;
	int right;

	boolean hasWheelMove;
	boolean chooseSong;

	Selection()
	{
		r = 0;
		g = 0;
		b = 0;

		left = 0;
		right = 7;

		state = 0;

		bars = new Bars[7];
		bars[0] = new Bars(seven[X_PO]       , seven[Y_PO]       , seven[X_LE]       , seven[Y_PO]       , ZERO   , text0[TEXT_SIZE]);
		bars[1] = new Bars(before_last[X_PO] , before_last[Y_PO] , before_last[X_LE] , before_last[Y_LE] , FIRST  , text1[TEXT_SIZE]);
		bars[2] = new Bars(last[X_PO]        , last[Y_PO]        , last[X_LE]        , last[Y_LE]        , SECOND , text2[TEXT_SIZE]);
		bars[3] = new Bars(now[X_PO]         , now[Y_PO]         , now[X_LE]         , now[Y_LE]         , THIRD  , text3[TEXT_SIZE]);
		bars[4] = new Bars(next[X_PO]        , next[Y_PO]        , next[X_LE]        , next[Y_LE]        , FOURTH , text4[TEXT_SIZE]);
		bars[5] = new Bars(after_next[X_PO]  , after_next[Y_PO]  , after_next[X_LE]  , after_next[Y_LE]  , FIFTH  , text5[TEXT_SIZE]);
		bars[6] = new Bars(six[X_PO]         , six[Y_PO]         , six[X_LE]         , six[X_PO]         , SIXTH  , text6[TEXT_SIZE]);

		hasWheelMove = false;
		chooseSong = false;

	}

	void backgroundColor()
	{
		background(r, g, b);
	}

	void update()
	{
		for(int k = ZERO ; k <= SIXTH ; k++)
		{	
			bars[k].update(bars[k].getStatus(), k);
			bars[k].draw();
		}
	}

	void insertString(int i, int j)
	{
		int tmp_l = selection.getLeft();

		if(tmp_l + 1 == RANGE)
		{
			tmp_l = -1;
		}

		int tmp_r = selection.getRight();
		if(tmp_r - 1 == -1)
		{
			tmp_r = RANGE;
		}
		switch(global_wheel)
		{	
			case DOWNWARDS:
				for(int k = ZERO ; k <= SIXTH ; k++)
				{
					if(bars[k].getinitStatus() != -1)
					{
						bars[k].insertString(songName[right]);
						bars[topStatus].insertString(songName[tmp_l+1]);
						println("topStatus " + topStatus + " " + bars[topStatus].getStr());
						println("bottomStatus " + bottomStatus + " " + bars[bottomStatus].getStr());
					}
				}
			break;
			case UPWARDS:
				for(int k = ZERO ; k <= SIXTH ; k++)
				{
					if(bars[k].getinitStatus() != -1)
					{
						bars[k].insertString(songName[left]);

						bars[bottomStatus].insertString(songName[tmp_r-1]);

						println("topStatus " + topStatus + " " + bars[topStatus].getStr());
						println("bottomStatus " + bottomStatus + " " + bars[bottomStatus].getStr());
					}
				}
			break;
		}
	}

	void deal()
	{
		if(global_wheel == UPWARDS)
		{
			check();
		}
		for(int i = ZERO ; i <= SIXTH ; i++)
		{
			insertString(getLeft(), getRight());
		}
		if(global_wheel == DOWNWARDS)
		{
			check();
		}
	}

	void checkBound()
	{
		if(right > RANGE)
		{
			right = right - RANGE;
		}
	}

	void acTOchoose()
	{
		chooseSong = true;
	}

	void draw(int k)
	{
		if(k != bottomStatus)
		{
			bars[k].draw();
		}
	}

	void changeWheelstate(int i, int state)
	{
		bars[i].changeWheelstate(state);
	}

	String getStr(int i)
	{
		return bars[i].getStr();
	}

	int getLeft()
	{
		return left;
	}

	int getRight()
	{
		return right;
	}

	boolean isChoose()
	{
		return chooseSong;
	}

	void add()
	{
		switch(global_wheel)
		{
			case DOWNWARDS:
				left++;
				right++;
				textMidIdx++;
				if(left == RANGE)
				{
					left = 0;
				}
				if(right == RANGE)
				{
					right = 0;
				}
				if(textMidIdx == RANGE)
				{
					textMidIdx = 0;
				}
			break;
			case UPWARDS:
				left--;
				right--;
				textMidIdx--;
				if(left == -1)
				{
					left = RANGE-1;
				}
				if(right == -1)
				{
					right = RANGE-1;
				}
				if(textMidIdx == -1)
				{
					textMidIdx = RANGE-1;
				}
			break;
		}
	}

	void init(int left, int right)
	{
		for(int k = ZERO ; k <= SIXTH ; k++)
		{
			if(left == RANGE)
			{
				left = 0;
			}
			bars[k].giveString(songName[left++]);
		}
		hasWheelMove = false;
		checkBound();
		update();
		deal();
	}

	void wheeelMoveinit()
	{
		hasWheelMove = false;
	}

	void wheelMove()
	{
		hasWheelMove = true;
	}

	boolean isWheelMove()
	{
		return hasWheelMove;
	}

	void print()
	{
		println("Left: " + left + " " + songName[left]);
		println("Right: " + right + " " + songName[right]);
		for(int i = 0 ; i < 7 ; i++)
		{
			println(i + ": " + bars[i].getStr());
		}
	}

	void check()
	{
		if(addFlag)
		{	
			addFlag = false;
			add();
		}
		if(minFlag)
		{
			minFlag = false;
			add();
		}
	}

	void wheelCheck(MouseEvent event)
	{
		selection.state += event.getCount();

	if(selection.state >= 1)
	{
		selection.state = 1;
		global_wheel    = DOWNWARDS;
		println("-------------------------DOWNWARDS-------------------------------");
		for(int i = 0 ; i < 7 ; i++)
		{
			selection.changeWheelstate(i, DOWNWARDS);
		}
	}
	else if(selection.state <= -1)
	{
		selection.state = -1;
		global_wheel    = UPWARDS;
		println("--------------------------UPWARDS-------------------------------");
		for(int i = 0 ; i < 7 ; i++)
		{
			selection.changeWheelstate(i, UPWARDS);
		}
	}
	else if(selection.state == 0)
	{
		selection.wheelMove();
		global_wheel = WHEELSTOP;
		selection.state = 0;
		println("--------------------------WHEELSTOP-------------------------------");
		for(int i = 0 ; i < 7 ; i++)
		{
			selection.changeWheelstate(i, WHEELSTOP);
		}
		println("topStatus: " + topStatus + " " + selection.getStr(topStatus));
		println("bottomStatus: " + bottomStatus + " " + selection.getStr(bottomStatus));
		selection.print();
	}
	}

	void click()
	{
		if(global_wheel == WHEELSTOP)
		{
			if(mouseButton == LEFT)
			{
				if(mouseX >= now[X_PO] && mouseX <= 800 && mouseY >= now[Y_PO] && mouseY <= (now[Y_PO] + now[Y_LE]))
				{
					fill(255);
					rect(chooseBar[X_PO], chooseBar[Y_PO], chooseBar[X_LE], chooseBar[Y_LE]);
					fill(30);
					textSize(chooseText[TEXT_SIZE]);
					text(songName[textMidIdx], chooseText[X_PO], chooseText[Y_PO]);
					acTOchoose();
					global_wheel = CHOOSE;
				}
			}
		}
		else if(global_wheel == CHOOSE)
		{
			if(mouseButton == LEFT)
			{
				if(mouseX >= chooseBar[X_PO] && mouseX <= 800 && mouseY >= chooseBar[Y_PO] && mouseY <= (chooseBar[Y_PO] + chooseBar[Y_LE]))
				{
					if(isChoose())
					{
						println("Success To Choose!!!");
					}
					else
					{
						println("Pressed Bar First");
					}
				}
			}
			if(mouseButton == RIGHT)
			{
				if(mouseX >= chooseBar[X_PO] && mouseX <= 800 && mouseY >= chooseBar[Y_PO] && mouseY <= (chooseBar[Y_PO] + chooseBar[Y_LE]))
				{
					global_wheel = WHEELSTOP;
				}
			}
		}	
	}
}

Selection selection;
GetbgmName getBgmName;
String [] songName;
int textMidIdx = 3;
boolean addFlag = false;
boolean minFlag = false;
int topStatus;
int bottomStatus;

int RANGE;


//////////for testing////////////
void setup()
{
	frameRate(120);
	selection = new Selection();
	getBgmName = new GetbgmName();

	songName = getBgmName.listFileNames(getBgmName.getPath());
	RANGE = songName.length;
	getBgmName.rightShift(songName);

	size(800, 600);
	selection.backgroundColor();
	selection.init(selection.getLeft(), selection.getRight());
	selection.print();
}

void mouseWheel(MouseEvent event)
{
	selection.wheelCheck(event);
}

void mousePressed()
{
	selection.click();
}

void draw()
{
	if(global_wheel != CHOOSE)
	{
		selection.backgroundColor();
		selection.update();

		selection.deal();
	}
	else
	{
	}
}



//////////for testing////////////