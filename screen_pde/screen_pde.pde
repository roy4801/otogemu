screen tmp;
int s = 0;
int count = 0;

class screen{
  //
  //store image
  PImage backgroundImg; //background image
  PImage infoImg; // Info image
  PImage startBnImg; //start button image
  PImage infoBnImg; //info button image
  PImage backBnImg; //back button image
  PImage gamebackgroundImg;// game back ground image
  PImage infotext;//info text
  PImage illustration;// example image
  //
  //counters   
  int combo;
  int numOfperfect;
  int numOfgreat;
  int numOfgood;
  int numOfpoor;
  int highestCombo;
  //
  //
  boolean clickStart;
  boolean clickInfo;
  boolean clickBack;
  boolean isStart;
  boolean isEnd;
  boolean menu;
  boolean isLeft;
  //
  // 
  screen(){
    //load image
    gamebackgroundImg = loadImage("gamebackground.jpg");
    backgroundImg = loadImage("backgroundImg.jpg");
    startBnImg = loadImage("start.png");
    infoBnImg = loadImage("info.png");
    backBnImg = loadImage("back.png");
    infoImg = loadImage("infoImg.jpg");
    infotext = loadImage("infotext.png");
    illustration = loadImage("illustration.png");
    //initial counters
    combo = 0;
    numOfperfect = 0;
    numOfgreat = 0;
    numOfgood = 0;
    numOfpoor = 0;
    highestCombo = 0;
    //
    clickStart = true;
    clickInfo = true;
    clickBack = false;
    isStart = false;
    isEnd = false;
    menu = true;
    isLeft = true;
    //
  }
  //
  // initial the frame
  // reset the frame  
  void initmenu(){

    image(backgroundImg, 0, 0, 800, 600);
    setStBn();
    setInfoBn();
    
    menu = true;
    isEnd = false;
    isStart = false;
    clickStart = true;
    clickInfo = true;
    clickBack = false;
    isLeft = true;

    combo = 0;
    numOfperfect = 0;
    numOfgreat = 0;
    numOfgood = 0;
    numOfpoor = 0;
    highestCombo = 0;
  }

  void initgamebackground(){

    image(gamebackgroundImg, 0, 0, 800, 600);
    menu = false;
    clickStart = false;
    clickInfo = false;
    clickBack = false;
    isLeft = false;
  }

  void initscoreboard(){

    textSize(40);
    fill(255, 255, 255);
    text("0000000", 620, 40);
    s = 0;
  }
  //
  //buttom set up
  //set start buttom
  void setStBn(){

    image(startBnImg, 50, 280, 250, 55);
    //50 <= mouseX <= 300
    //280 <= mouseY <= 335
  }
  //set info buttom
  void setInfoBn(){

    image(infoBnImg, 50, 100, 250, 55);
    //50 <= mouseX <= 300
    //250 <= mouseY <= 155
  }
  //set back buttom
  void setbackBn(){

    image(backBnImg, 270, 545, 250, 55);
    //270 <= mouseX <= 520
    //545 <= mouseY <= 600
  }
  //
  //build funtion
  //build info page
  void buildInfo(){

    image(infoImg, 0, 0, 800, 600);
    image(infotext, 320, 230, 400, 300);
    image(illustration, 100, 20, 145, 500);
    setbackBn();
    clickStart = false;
    clickInfo = false;
    clickBack = true;
    isLeft = false;
  }
  //build Finish page
  void Finishscreen(int score){

    String sscore = nf(score, 7);
    initgamebackground();
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
    text("Poor:"+str(numOfpoor), 550, 400);

    setbackBn();
    clickBack = true;
  }
  //
  //counter add  
  void addcombo(){

    combo++;
  }
  void addperfect(){

    numOfperfect++;
  }
  void addgreat(){

    numOfgreat++;
  }
  void addgood(){

    numOfgood++;
  }
  void addpoor(){

    numOfpoor++;
  }
  //
  //get data
  int getcombo(){

    return combo;
  }
  int gethighestCombo(){

    return highestCombo;
  }
  int getnumOfperfect(){

    return numOfperfect;
  }
  int getnumOfgreat(){

    return numOfgreat;
  }
  int getnumOfgood(){

    return numOfgood;
  }
  int getnumOfpoor(){

    return numOfpoor;
  }
  //
  //reset counter
  void resetcombo(){

    combo = 0;
  }
  //
  //
  void leavegame(){

    if(keyPressed){
    
      if(key == ESC){

        isLeft = true;
      }
    }
  }
  //
  //print 
  void printscore(int score){

    String sprintscore = nf(score, 7);
    textSize(40);
    fill(255, 255, 255);
    textAlign(LEFT);
    text(sprintscore, 620, 40);
  }
  void printcombo(int combo){

    textSize(35);
    fill(255, 255, 255);
    textAlign(CENTER);
    if(combo != 0)
      text(str(combo), 150, 150);
    if(highestCombo < combo)
      highestCombo = combo;
  }
}

void keyPressed(){

  if(key == ESC){

    key = 0;
  }
}

void setup(){

  size(800, 600);
  tmp = new screen();
  tmp.initmenu();
}

void draw(){
    
   if(tmp.menu){
    
      if(mousePressed){

        if(mouseX >= 50 && mouseX <= 300 && mouseY >= 100 && mouseY <= 155){

            if(tmp.clickInfo)
              tmp.buildInfo();
          }
          else if(mouseX >= 50 && mouseX <= 300 && mouseY >= 280 && mouseY <= 335){

            if(tmp.clickStart){

              tmp.initgamebackground();
              tmp.initscoreboard();
              tmp.isStart = true;
            }
          }
          else if(mouseX >= 270 && mouseX <= 520 && mouseY >= 545 && mouseY <= 600){

            if(tmp.clickBack)
              tmp.initmenu();
          }
      }
  }




  if(tmp.isStart){

    tmp.initgamebackground();

    int p = (int)random(0, 100);

    if(p >= 0 && p < 70){
      
      s = s + 500;
      tmp.addcombo();
      tmp.addperfect();
    }
    else if(p >= 70 && p < 90){
      
      s = s + 300;
      tmp.addcombo();
      tmp.addgreat();
    }
    else if(p >= 90 && p < 99){
      
      s = s + 150;
      tmp.addcombo();
      tmp.addgood();
    }
    else{

      tmp.resetcombo();
      tmp.addpoor();
    }
    count++;

    tmp.printscore(s);
    tmp.printcombo(tmp.getcombo());

    tmp.leavegame();
    if(tmp.isLeft){

      tmp.isEnd = false;
    }

    if(count == 100){

      tmp.isStart = false;
      tmp.isEnd = true;
      count = 0;
    }
  }



  if(tmp.isEnd){

    tmp.Finishscreen(s);
    if(mousePressed && mouseButton == LEFT){
  
      if(mouseX >= 270 && mouseX <= 520 && mouseY >= 545 && mouseY <= 600){

        if(tmp.clickBack)
          tmp.initmenu();
      }
    }
  }

  if(tmp.isLeft){

    tmp.initmenu();
    count = 0;
  }
}
