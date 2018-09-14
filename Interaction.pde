// Draws the timeline
void timeline(){
  textAlign(LEFT);  //GS
  strokeWeight(3);
  stroke(255);
  line(40, 120, width-40, 120);
  fill(255);
  for (int g=1; g<8; g++){
    rect(width/8*g, 115, 10,10);
    textSize(16);
    text("Game "+str(g), width/8*g-20, 145);   // i period team 1  
  }
}


// Selects the game based on the position of the mouse in the timeline
void gameSelection(){
  int[][] gameNum={{0,0}};
  int[][] again={{0,0}};
  int game = 0;  //GS
  
  fill(#33CBCA);
  textSize(16);
  if (mouseY > 110 && mouseY < 150){
    //Game 1
    if (mouseX > width/8-20 && mouseX < width/8+10){
      gameNum = arrG1;
      rect(width/8, 115, 10,10);
      text("Game 1", width/8-20, 145);    
      game = 1;  //GS
    }
    //Game 2
    if (mouseX > width/8*2-20 && mouseX < width/8*2+10){
      gameNum = arrG2;
      rect(width/8*2, 115, 10,10);
      text("Game 2", width/8*2-20, 145);
      game = 2; //GS
    }
    //Game 3
    if (mouseX > width/8*3-20 && mouseX < width/8*3+10){
      gameNum = arrG3;
      rect(width/8*3, 115, 10,10);
      text("Game 3", width/8*3-20, 145);
      game = 3; //GS
    }
    //Game 4
    if (mouseX > width/8*4-20 && mouseX < width/8*4+10){
      gameNum = arrG4;
      rect(width/8*4, 115, 10,10);
      text("Game 4", width/8*4-20, 145);
      game = 4;  //GS
    }
    //Game 5
    if (mouseX > width/8*5-20 && mouseX < width/8*5+10){
      gameNum = arrG5;
      rect(width/8*5, 115, 10,10);
      text("Game 5", width/8*5-20, 145);
      game = 5;  //GS
    }
    //Game 6
    if (mouseX > width/8*6-20 && mouseX < width/8*6+10){
      gameNum = arrG6;
      rect(width/8*6, 115, 10,10);
      text("Game 6", width/8*6-20, 145);
      game = 6;  //GS    
    }
    //Game 7
    if (mouseX > width/8*7-20 && mouseX < width/8*7+10){
      gameNum = arrG7;
      rect(width/8*7, 115, 10,10);
      text("Game 7", width/8*7-20, 145);
      game = 7;  //GS
    }
  }
  else {
    game = 0;  
    gameScore.refresh(0, again, game);    
  }
  ind = game;
  // executes the refresh by period for the selected game
  if (gameNum[0][0]!= 0) {
    if ( millis() - lastTime > 2000 ) {
        switch(periodNum) {
        case 0:
          fill(0);
          noStroke();
          rect(600,600,500,400);
          gameScore.refresh(1, gameNum, game);  //GS
          periodNum++;
          break;
        case 1: 
          gameScore.refresh(2, gameNum, game);  //GS
          periodNum++;
          break;
        case 2: 
          gameScore.refresh(3, gameNum, game);  //GS
          periodNum++;
          break;
        case 3: 
          gameScore.refresh(4, gameNum, game);  //GS
          fill(0);
          noStroke();
          rect(600,600,400,400);
          if (score1 > score2) image(imgGS,680,600); 
          else image(imgHOU, 600,600);
          periodNum=0;
          break;    
        default:
          noStroke();
          rect(600,600,400,400);
          break;
        }
        lastTime = millis();
    }
  }  
}
