//class scoreBoard
class scoreBoard {
  int spacew, spaceh;
  color perimColor;
  int x, y;
  int svG;  //GS
  float gY, svGY, aY, svAY; //GS
  float rhfSpeed = 1;  //GS
  float txtX, txtY = 0.2; //GS
  int game;  //GS
  
  scoreBoard() {  // constructore
    spacew = width/3;
    spaceh = width/3;
    perimColor = color(255);    
  }
  
  //method display for initial
  void display(int cordx, int cordy) {
    x = cordx;
    y = cordy;
    pushMatrix();
    translate (x, y);
    strokeWeight(5);
    stroke(perimColor);
    noFill();
    rect(20, 20, spacew-spacew/10, spaceh/4*3,10); //spacew-spacew/10 = 420, spaceh/4*3 = 340
    rect(spacew/8+20, spaceh/3-10, spacew/5, spacew/5);
    rect((spacew/8)*4.5+20, spaceh/3-10, spacew/5, spacew/5);
    fill(232, 146, 7);
    textSize(32);
    text("Period 1", (spacew/8)*3.8, spaceh/3-50);
    textSize(24);
    text("GS", spacew/4*1.1, (spaceh/3)*1.8);
    text("HOU", (spacew/4)*2.8, (spaceh/3)*1.8); 
    fill(#59E357);
    textSize(42);
    text(" 0", spacew/5+19, spaceh/2*0.9);   // i period team 1
    text(" 0", spacew/5*3+35, spaceh/2*0.9);  // i period team 2
    //GS - draw frame for text
    noFill();  //GS
    rect(500, 20, spacew-spacew/10+5, spaceh/4*3+5, 10);  //GS
    
    //GS - Insert RHF Scale
    // Try linear Gradient with lerpcolor()
    fill(255);
    line(1070, 100, 1150, 100);
    rect(1100, 100, 20, 650);
    line(1070, 750, 1150, 750);
    textAlign(CENTER);
    textSize(32);
    text("Elation", 1110, 80); 
    text("Despair", 1110, 790);
    //GS - End RHF Scale
    popMatrix();
  } // end display
  
  // refresh to update based on selected game
  void refresh(int period, int[][] arrayG, int game) {    
    score1=0; 
    score2=0;    
    pushMatrix();
      translate (x,y);    
      for (int i=0; i<period; i++) {
        fill(0); // clean previous scores
        noStroke();
        rect(spacew/8+23, spaceh/3-5, spacew/5-5, spacew/5-5);
        rect((spacew/8)*4.5+24, spaceh/3-5, spacew/5-5, spacew/5-5);
        rect((spacew/8)*3*0.9, spaceh/3-80, 200,40);
        textSize(32);
        fill(232, 146, 7);  // text color
        if (period==4) {
          text("FINAL", (spacew/8)*3, spaceh/3-50);   // Final period
        }
        else text("Period "+str(period), (spacew/8)*2.75, spaceh/3-50);

        fill(#59E357);  // score color
        score1 = score1 + arrayG[i][0];  // add values for the periods
        score2 = score2 + arrayG[i][1];  // add values for the periods
        text(score1, spacew/5, spaceh/2*0.9);   // i period team 1
        text(score2, spacew/5*3.2, spaceh/2*0.9);  // i period team 2
          
        // GS RHF Print based on score result by period and the place will be random
        textSize(32);
        float yval1, yval2;
        if (score1 > score2) {
          yval1 = random(150,300);
          yval2 = random(550,700);
        }
        else {
          if (score1 == score2) {  // tie score
            yval2 = 425;
            yval1 = 425;
          }
          else {
            yval2 = random(150,300);
            yval1 = random(550,700);
          }
        }
        
       //clear prior and RHF text
       fill(0);
       noStroke();
       rect(1124, 115, 45, 630);
       rect(1050, 115, 45, 630);   
       // end clear prior and RHF text
       fill(#CE1141); //Rocket Red
       text("G", 1065, yval2); //GS
       fill(#006BB6); //Warrior Blue
       text("A", 1145, yval1); //GS
     }
      
     textAlign(LEFT);  //GS
     // GS static text begin.  
     fill(0);
     noStroke();
     rect(502, 22, spacew-spacew/10, spaceh/4*3, 10);  //GS
     textSize(18);
     textAlign(CENTER);
     fill(255);
     switch(game) {
          case 0:
            fill(0); // clean previous scores
            noStroke();
            rect(spacew/8+23, spaceh/3-5, spacew/5-5, spacew/5-5);
            rect((spacew/8)*4.5+24, spaceh/3-5, spacew/5-5, spacew/5-5);
            rect((spacew/8)*3*0.9, spaceh/3-80, 200,40);
            rect(500,400,500,300);
            
            //clear prior and RHF text
            rect(1124, 115, 45, 630);
            rect(1050, 115, 45, 630);   
            // end clear prior and RHF text
            textSize(32);
            fill(255);
            text("G", 1065, 425);
            text("A", 1145, 425);
            break;
          case 1:
            text("Game 1", spacew*1.5, spaceh*txtY);  //GS Testing
            text("Kevin Durant scores 37 points in 119 - 106", spacew*1.52, spaceh*txtY + 60);
            text("victory.", spacew*1.52, spaceh*txtY + 80);
            text("Houston MSDS student excels in multi-tasking", spacew*1.52, spaceh*txtY + 110);
            text("as he watches game and participates in Cloud", spacew*1.52, spaceh*txtY + 130);
            text("Computing class at the same time.", spacew*1.52, spaceh*txtY + 150);
            break;
          case 2:
            text("Game 2", spacew*1.52, spaceh*txtY);
            text("Rockets route the Warriors 127-105 to even", spacew*1.52, spaceh*txtY + 60);
            text("series.", spacew*1.52, spaceh*txtY + 80);
            text("In other news, Gracious professor cancels",  spacew*1.52, spaceh*txtY + 110);
            text("Data Mining class to allow students to",  spacew*1.52, spaceh*txtY + 130);
            text("watch basketball.", spacew*1.52, spaceh*txtY + 150);
            break;
          case 3:
            text("Game 3", spacew*1.52, spaceh*txtY);
            text("Stephen Curry scores 35 as Warriors route", spacew*1.52, spaceh*txtY + 60);
            text("Rockets by 41 points. ",  spacew*1.52, spaceh*txtY + 80);
            break;
          case 4:
            text("Game 4", spacew*1.52, spaceh*txtY);
            text("Rockets even series at 2 games apiece", spacew*1.52, spaceh*txtY + 60);
            text("with victory.",  spacew*1.52, spaceh*txtY + 80);
            break;
          case 5:
            text("Game 5", spacew*1.52, spaceh*txtY);
            text("Life Changing Data Visualization class", spacew*1.52, spaceh*txtY + 60);
            text("to important to miss as Rockets dispatch", spacew*1.52, spaceh*txtY + 80);
            text("Warrriors and claim 3-2 series lead.", spacew*1.52, spaceh*txtY + 100);
            break;
          case 6:
            text("Game 6", spacew*1.52, spaceh*txtY);
            text("Klay Thompson scores 35 as Warriors force", spacew*1.52, spaceh*txtY + 60);
            text("game 7 in the Western Conference finals", spacew*1.52, spaceh*txtY + 80);
            break;
          case 7:
            text("Game 7", spacew*1.52, spaceh*txtY);
            text("The Golden State Warriors advance to", spacew*1.52, spaceh*txtY + 60);
            text("fourthstraight NBA Finals with a 101 - 92", spacew*1.52, spaceh*txtY + 80); 
            text("victory over the Rockets.", spacew*1.52, spaceh*txtY + 100);
            text("Houston MSDS student has 'no clue' what", spacew*1.52, spaceh*txtY + 130);
            text("was said in Cloud Computing Class.", spacew*1.52, spaceh*txtY + 150);
            text("Rethinks life.", spacew*1.52, spaceh*txtY + 170);
            break;
          default:
            //clear prior and RHF text
            fill(0);
            noStroke();
            rect(1124, 115, 45, 630);
            rect(1050, 115, 45, 630);   
            // end clear prior and RHF text
            textSize(32);
            fill(255);
            text("G", 1065, 425);
            text("A", 1145, 425);
            break;
      } //GS static text end
    popMatrix();
  } // end refresh  
}// end class
