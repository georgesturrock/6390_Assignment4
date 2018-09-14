// draws court/basket scene
void basket(){
  int cwidth = width/3;
  int cheight = height/3;
  
  // basket
  stroke(255,0,0);
  strokeWeight(4);
  ellipse(280, 90, 85, 20);
  stroke(255);
  strokeWeight(3);
  ellipse(280, 110, 75, 10);
  ellipse(280, 130, 65, 10);
  line(238, 90, 248, 130);
  line(322, 90, 312, 130);
  line(265, 100, 265, 135);
  line(300, 100, 300, 135);
  strokeWeight(10);
  stroke(64,62,124);
  line(325, 10, 325, 120);
  noStroke();
  fill(64,62,124);
  rect(330,90,60, 20);
  fill(0);
  pushMatrix();
    translate(375,105);
    rotate(-PI/4);
    rect(0,0,20,190);
  popMatrix();  
}
