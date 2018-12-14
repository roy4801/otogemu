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

  
static final float [] beforeToseven = {MOVE, map(MOVE, 0, seven[X_PO]-before_last[X_PO], 0, before_last[Y_PO]-seven[Y_PO]), 0, map(MOVE, 0, seven[X_PO]-before_last[X_PO], 0, before_last[Y_LE]-seven[Y_LE])};
static final float [] lastTobefore  = {MOVE, map(MOVE, 0, before_last[X_PO]-last[X_PO], 0, last[Y_PO]- before_last[Y_PO]), 0, map(MOVE, 0, before_last[X_PO]-last[X_PO], 0, last[Y_LE]-before_last[Y_LE])};
static final float [] nowTolast     = {MOVE, map(MOVE, 0, last[X_PO]-now[X_PO], 0, now[Y_PO]-last[Y_PO]), 0, map(MOVE, 0, last[X_PO]-now[X_PO], 0, now[Y_LE]-last[Y_LE])};
static final float [] nextTonow     = {MOVE, map(MOVE, 0, next[X_PO]-now[X_PO], 0, next[Y_PO]-now[Y_PO]), 0, map(MOVE, 0, next[X_PO]-now[X_PO], 0, now[Y_LE]-last[Y_LE])};
static final float [] afterTonext   = {MOVE, map(MOVE, 0, after_next[X_PO]-next[X_PO], 0, after_next[Y_PO]-next[Y_PO]), 0, map(MOVE, 0, after_next[X_PO]-next[X_PO], 0, next[Y_LE]-after_next[Y_LE])};
static final float [] sixToafter    = {MOVE, map(MOVE, 0, six[X_PO]-after_next[X_PO], 0, six[Y_PO]-after_next[Y_PO]), 0, map(MOVE, 0, six[X_PO]-after_next[X_PO], 0, after_next[Y_LE]-six[Y_LE])};

static final float [] text0  = {seven[X_PO]+20       , (2*seven[Y_PO] + seven[Y_LE])/2             , 35};
static final float [] text1  = {before_last[X_PO]+20 , (2*before_last[Y_PO] + before_last[Y_LE])/2 , 40};
static final float [] text2  = {last[X_PO]+20        , (2*last[Y_PO] + last[Y_LE])/2               , 50};
static final float [] text3  = {now[X_PO]+20         , (2*now[Y_PO] + now[Y_LE])/2                 , 65};
static final float [] text4  = {next[X_PO]+20        , (2*next[Y_PO] + next[Y_LE])/2               , 50};
static final float [] text5  = {after_next[X_PO]+20  , (2*after_next[Y_PO] + after_next[Y_LE])/2   , 40};
static final float [] text6  = {six[X_PO]+20         , (2*six[Y_PO] + six[Y_LE])/2                 , 35};

static final float [] text1_0 = {MOVE, map(MOVE, 0, text0[TEXT_X]-text1[TEXT_X], 0, text1[TEXT_Y]-text0[TEXT_Y]), map(MOVE, 0, text0[TEXT_X]-text1[TEXT_X], 0, text1[TEXT_SIZE]-text0[TEXT_SIZE])};
static final float [] text2_1 = {MOVE, map(MOVE, 0, text1[TEXT_X]-text2[TEXT_X], 0, text2[TEXT_Y]-text1[TEXT_Y]), map(MOVE, 0, text1[TEXT_X]-text2[TEXT_X], 0, text2[TEXT_SIZE]-text1[TEXT_SIZE])};
static final float [] text3_2 = {MOVE, map(MOVE, 0, text2[TEXT_X]-text3[TEXT_X], 0, text3[TEXT_Y]-text2[TEXT_Y]), map(MOVE, 0, text2[TEXT_X]-text3[TEXT_X], 0, text3[TEXT_SIZE]-text2[TEXT_SIZE])};
static final float [] text4_3 = {MOVE, map(MOVE, 0, text4[TEXT_X]-text3[TEXT_X], 0, text4[TEXT_Y]-text3[TEXT_Y]), map(MOVE, 0, text4[TEXT_X]-text3[TEXT_X], 0, text3[TEXT_SIZE]-text4[TEXT_SIZE])};
static final float [] text5_4 = {MOVE, map(MOVE, 0, text5[TEXT_X]-text4[TEXT_X], 0, text5[TEXT_Y]-text4[TEXT_Y]), map(MOVE, 0, text5[TEXT_X]-text4[TEXT_X], 0, text4[TEXT_SIZE]-text5[TEXT_SIZE])};
static final float [] text6_5 = {MOVE, map(MOVE, 0, text6[TEXT_X]-text5[TEXT_X], 0, text6[TEXT_Y]-text5[TEXT_Y]), map(MOVE, 0, text6[TEXT_X]-text5[TEXT_X], 0, text5[TEXT_SIZE]-text6[TEXT_SIZE])};

static final int DOWNWARDS  = -1; // mouse goes down pic goes up
static final int WHEELSTOP  =  0;
static final int UPWARDS    =  1; // mouse goes up pic goes down

String [] testText = {"test7", "test1", "test2", "test3", "test4", "test5", "test6"};
int textIdx;
boolean textFlag = true;

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

	}

	void update(int status)
	{
		//println("in: " + status);
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

						if(round(y_p) == (int) before_last[Y_PO])
						{
							this.status = FIRST;
						}
					break;
					case FIRST:
						x_p -= lastTobefore[X_PO];
						y_p += lastTobefore[Y_PO];
						y_l += lastTobefore[Y_LE];

						textSize(textsize+=text2_1[TEXT_SIZE]);

						if(round(y_p) == (int)last[Y_PO])
						{
							this.status = SECOND;
						}
					break;
					case SECOND:
						x_p -= nowTolast[X_PO];
						y_p += nowTolast[Y_PO];
						y_l += nowTolast[Y_LE];

						textSize(textsize+=text3_2[TEXT_SIZE]);

						if(round(y_p) == (int)now[Y_PO])
						{
							this.status = THIRD;
							// println("SECOND: " + x_p);
							// println("SECOND: " + y_p);
							// println("SECOND: " + y_l);
						}
					break;
					case THIRD:
						x_p += nextTonow[X_PO];
						y_p += nextTonow[Y_PO];
						y_l -= nextTonow[Y_LE];

						textSize(textsize-=text4_3[TEXT_SIZE]);

						if(round(y_p) == (int)next[Y_PO])
						{
							this.status = FOURTH;
						}
					break;
					case FOURTH:
						x_p += afterTonext[X_PO];
						y_p += afterTonext[Y_PO];
						y_l -= afterTonext[Y_LE];

						textSize(textsize-=text5_4[TEXT_SIZE]);

						if(round(y_p) == (int)after_next[Y_PO])
						{
							this.status = FIFTH;
						}
					break;
					case FIFTH:
						x_p += sixToafter[X_PO];
						y_p += sixToafter[Y_PO];
						y_l -= sixToafter[Y_LE];

						textSize(textsize-=text6_5[TEXT_SIZE]);

						if(round(y_p) == (int)six[Y_PO])
						{
							this.status = ZERO;
							x_p = seven[X_PO];
							y_p = seven[Y_PO];
							y_l = seven[Y_LE];
						}
					break;
				}
			break;

			//MouseWheel down picture up
			case DOWNWARDS:
				//println(status);
				switch(status)
				{
					case FIRST:	
						x_p += beforeToseven[X_PO];
						y_p -= beforeToseven[Y_PO];
						y_l -= beforeToseven[Y_LE];
						
						textSize(textsize-=text1_0[TEXT_SIZE]);
						// writeString();
						
						if(round(y_p) == (int)seven[Y_PO])
						{
							this.status = SIXTH;
							x_p = six[X_PO];
							y_p = six[Y_PO];
							y_l = six[Y_LE];
							textsize = text6[TEXT_SIZE];
							changeText();
							lastIdx--;
							if(lastIdx == -1)
							{
								lastIdx = 6;
							}
						}

					break;
					case SECOND:
						x_p += lastTobefore[X_PO];
						y_p -= lastTobefore[Y_PO];
						y_l -= lastTobefore[Y_LE];
						
						textSize(textsize-=text2_1[TEXT_SIZE]);
						// writeString();
						
						if(round(y_p) == (int)before_last[Y_PO])
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
						// writeString();

						if(round(y_p) == (int)last[Y_PO])
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
						// writeString();

						if(round(y_p) == (int)now[Y_PO])
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
						// writeString();

						if((round(y_p) == (int)next[Y_PO]))
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
						// writeString();

						if(round(y_p) == (int)after_next[Y_PO])
						{
							this.status = FIFTH;
							textsize    = text5[TEXT_SIZE];
							textFlag = false;
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
					break;
				}
			break;
		}
	}

	void draw()
	{
		fill(255);
		rect(x_p, y_p, x_l, y_l);
		writeString();
		//textAlign(CENTER);
	}

	void writeString()
	{
		fill(70);
		text(str, x_p+20, (2*y_p+y_l)/2);
	}

	void changeWheelstate(int state)
	{
		wheelStatus = state;
	}

	void insertString(String text)
	{
		str = text;
	}
	void deliverString(String str, int state)
	{
		//(state == DOWNWARDS) ? lastString = str : nextString = str;
		switch(state)
		{
			case DOWNWARDS:
				lastString = str;
			break;
			case UPWARDS:
				nextString = str;
			break;
		}
	}

	void setlastIdx(int idx, int range)
	{
		if(idx == 0)
		{
			lastIdx = 5;
		}
		else if(idx - 2 < 0)
		{
			lastIdx = range-1;
			println("idx: " + idx + " " + lastIdx);
		}
		else
		{
			lastIdx = idx - 2;
			println("idx: " + idx + " " + lastIdx);
		}
	}

	void changeText()
	{
		println("FIRST: " + str);
		if(textFlag && initstatus == SIXTH);
		else 
		{
			//println(str);
			str        = lastString;
			lastString = testText[lastIdx];
		}
		//lastIdx--;
	}

	int getStatus()
	{
		return status;
	}

	String getlastString()
	{
		return lastString;
	}

	String getnextString()
	{
		return nextString;
	}

	String getStr()
	{
		return str;
	}

	int getlastIdx()
	{
		return lastIdx;
	}
}

class Selection
{
	Bars [] bars;

	int r, g, b;
	int state;

	Selection()
	{
		r = 0;
		g = 0;
		b = 0;

		state = 0;

		bars = new Bars[7];
		bars[0] = new Bars(seven[X_PO]       , seven[Y_PO]       , seven[X_LE]       , seven[Y_PO]       , ZERO   , text0[TEXT_SIZE]);
		bars[1] = new Bars(before_last[X_PO] , before_last[Y_PO] , before_last[X_LE] , before_last[Y_LE] , FIRST  , text1[TEXT_SIZE]);
		bars[2] = new Bars(last[X_PO]        , last[Y_PO]        , last[X_LE]        , last[Y_LE]        , SECOND , text2[TEXT_SIZE]);
		bars[3] = new Bars(now[X_PO]         , now[Y_PO]         , now[X_LE]         , now[Y_LE]         , THIRD  , text3[TEXT_SIZE]);
		bars[4] = new Bars(next[X_PO]        , next[Y_PO]        , next[X_LE]        , next[Y_LE]        , FOURTH , text4[TEXT_SIZE]);
		bars[5] = new Bars(after_next[X_PO]  , after_next[Y_PO]  , after_next[X_LE]  , after_next[Y_LE]  , FIFTH  , text5[TEXT_SIZE]);
		bars[6] = new Bars(six[X_PO]         , six[Y_PO]         , six[X_LE]         , six[X_PO]         , SIXTH  , text6[TEXT_SIZE]);

	}

	void backgroundColor()
	{
		background(r, g, b);
	}

	void test()
	{
		rect(seven[X_PO]       , seven[Y_PO]       , seven[X_LE]       , seven[Y_PO]);
		rect(before_last[X_PO] , before_last[Y_PO] , before_last[X_LE] , before_last[Y_LE]);
		rect(last[X_PO]        , last[Y_PO]        , last[X_LE]        , last[Y_LE]);
		rect(now[X_PO]         , now[Y_PO]         , now[X_LE]         , now[Y_LE]); //main
		rect(next[X_PO]        , next[Y_PO]        , next[X_LE]        , next[Y_LE]);
		rect(after_next[X_PO]  , after_next[Y_PO]  , after_next[X_LE]  , after_next[Y_LE]);
		rect(six[X_PO]         , six[Y_PO]         , six[X_LE]         , six[X_PO]);
		textSize(65);
		fill(50);
		text("test", now[X_PO]+20, (2*now[Y_PO] + now[Y_LE])/2);
		textSize(50);
		text("test", last[X_PO]+20, (2*last[Y_PO] + last[Y_LE])/2);
		text("test", next[X_PO]+20, (2*next[Y_PO] + next[Y_LE])/2);
		textSize(40.5);
		text("test", before_last[X_PO]+20, (2*before_last[Y_PO] + before_last[Y_LE])/2);
		text("test", after_next[X_PO]+20, (2*after_next[Y_PO] + after_next[Y_LE])/2);
	}

	void update(int i)
	{
		bars[i].update(bars[i].getStatus());
		// if(i == 5)
		// 	println(bars[i].getStatus());
	}

	void insertString(int i, String str)
	{
		bars[i].insertString(str);
	}

	void draw(int i)
	{
		bars[i].draw();
		// if(i == 5)
		// 	println(bars[i].getStatus());
	}

	void changeWheelstate(int i, int state)
	{
		bars[i].changeWheelstate(state);
	}

	String getStr(int i)
	{
		return bars[i].getStr();
	}

	void setString(int i, int range, String str)
	{
		bars[i].insertString(str);

		//set lastString
		if(i == range-1)
		{
			bars[0].deliverString(str, DOWNWARDS);
		}
		else
		{
			bars[i+1].deliverString(str, DOWNWARDS);
		}

		//set nextString
		if(i == 0)
		{
			bars[range-1].deliverString(str, UPWARDS);
		}
		else
		{
			bars[i-1].deliverString(str, UPWARDS);
		}

		bars[i].setlastIdx(i, range);

	}

	void print()
	{
		for(int i = 0 ; i < 7 ; i++)
		{
			println(i + ": " + bars[i].getStr() + " " + bars[i].getlastString() + " " + bars[i].getnextString() + " " + bars[i].getlastIdx());
		}
	}
}

Selection selection;


//////////for testing////////////
void setup()
{
	frameRate(120);
	selection = new Selection();

	size(800, 600);
	selection.backgroundColor();
	for(int i = 0 ; i < testText.length ; i++)
	{
		selection.setString(i, testText.length, testText[i]);
	}
	selection.print();
}

void mouseWheel(MouseEvent event)
{
	selection.state += event.getCount();

	if(selection.state >= 1)
	{
		selection.state = 1;
		for(int i = 0 ; i < 7 ; i++)
		{
			selection.changeWheelstate(i, DOWNWARDS);
		}
	}
	else if(selection.state <= -1)
	{
		selection.state = -1;
		for(int i = 0 ; i < 7 ; i++)
		{
			selection.changeWheelstate(i, UPWARDS);
		}
	}
	else
	{
		selection.state = 0;
		for(int i = 0 ; i < 7 ; i++)
		{
			selection.changeWheelstate(i, WHEELSTOP);
		}
	}
}

void draw()
{
	selection.backgroundColor();


	for(int i = 0 ; i < 7 ; i++)
	{
		// if(i == 5)
		// 	println(random(1, 20));
		//selection.insertString(i, testText[textIdx]);
		//println(textIdx);

		selection.update(i);
		selection.draw(i);
	}
}



//////////for testing////////////