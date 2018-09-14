//class ball
class ball{  //Definition
//  float x,y;
  color bCollor;
  float rad;
  PVector location;  // Vector to handle location 
  PVector velocity;  // Velocity for the shoot
  PVector acceleration;  // Acceleration of the shoot 
  
  ball() {  // constructor
    location = new PVector(40,200);   // initial location
    velocity = new PVector(-10,-50);
    acceleration = new PVector(30,30);
    bCollor = color(245, 184, 25);  // ball color
    rad = 30;  //ball radiuos    
  } // ball
  
  // method to display ball
  void display() {
    fill(bCollor);
    stroke(1);
    ellipse(location.x,location.y, 2*rad,2*rad);
    noFill();
    ellipse(location.x,location.y, rad,2*rad);
  }  // display
  
  // method needed to make the shoots
  void shoot(){
    PVector scoreb = new PVector(random(260,280),70); // score basket location 
    PVector floor = new PVector(275,290);  // floor location
    
    if ((location.x < 270) && (location.x > 20)) {   // Identify the origin and sgoot direct to basket
       scoreb.sub(location);
       scoreb.setMag(5.5);
       acceleration = scoreb;
    
       velocity.add(acceleration);
       location.add(velocity);
       velocity.limit(random(1,15));   // random velocity
    }
    else{   // do the fall to the floor
        floor.sub(location);
        floor.setMag(1.5);
        acceleration = floor;
        velocity.add(acceleration);
        location.add(velocity);
        velocity.limit(random(1,3));
    }
    // When the ball is in the floor another initial random location is set
    if ((location.x>270) && (location.y>285)) {
      location.set(random(30,80),random(30,300));
    } 
  } // shoot
} // class ball
