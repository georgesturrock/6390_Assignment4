// MSDS 6390 - Visualization
// Assignment 4   - Animation 
// Names: George Sturrock and Alma Lopez
//   

//int[][] arrG1, arrG2, arrG3, arrG4, arrG5, arrG6, arrG7;
//Declare Classes
ball bball;
scoreBoard gameScore;
IntroText intro;  //GS

int ind=0; 
int score1=0, score2=0;
long lastTime;
int periodNum =0; 

PImage imgHOU;
PImage imgGS;

PImage imgpeople;
PImage header; 

String winner;

// Games scores
int[][] arrG1 = { {29,30}, {27,26}, {31,24}, {32,26} },  //Game 1 per periods
        arrG2 = { {21,26},{29,38},{29,31},{26,32} },  //Game 2 per periods
        arrG3 = { {31,22},{23,21},{34,24},{38,18} },  //Game 3 per periods
        arrG4 = { {28,19},{18,34},{34,17},{12,25} },  //Game 4 per periods
        arrG5 = { {17,23},{28,22},{27,26},{22,27} },  //Game 5 per periods
        arrG6 = { {22,39},{29,22},{33,16},{31,9} },  //Game 6 per periods
        arrG7 = { {19,24},{24,30},{33,15},{25,23} };  //Game 7 per periods

//float txtX, txtY; //GS
//GS draw function switches
int switch1 = 0, switch2 = 0;

void setup(){
  size(1400,1000);   // Canvas size

//Construct Classes
  bball = new ball();  
  gameScore = new scoreBoard();
  intro = new IntroText();
  
//background for basketball shoots   
  imgpeople = loadImage("people2.gif");  //for background
  header = loadImage("header2.png");  //for background
  ind = 0;
  lastTime = millis();
  winner="";
  //float txtX = 640; //GS
  //float txtY = 300;  //GS

  imgHOU = loadImage("HoustonNBA.gif");  // Houston Logo
  imgGS = loadImage("WarriorsNBA.png");   // Warriors/GS logo
  background(0);
  stroke(255);
  
}

void draw() {
  
  if (millis() < 48001){     
    //if (millis() < 501){
    background(0);
    intro.display();
  } else {
      if (switch2 == 0){
        switch2 = 1; //<>//
        background(0);
        gameScore.display(60,165);
        fill(255);
      }
    image(header,width/2-header.width/2,5);
    timeline();  // draws the interactive timeline
    gameSelection();  // Game selection function
    pushMatrix();  // shoots animation 
      translate (50, height/3*2-80);
      image(imgpeople,0,0);  // people background
      fill(#935F0C);
      noStroke();
      rect(0,300,imgpeople.width,30); // floor
      strokeWeight(3);
      bball.display();
      basket(); 
      if (ind !=0)  bball.shoot();  //freeze when no game selected  
    popMatrix();
  }   
   
}
