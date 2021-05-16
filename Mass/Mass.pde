class Ball{
  PVector location, velocity, acceleration;
  int mass;
  
  Ball(){
    location = new PVector(random(width), height/4);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = (int)random(5);
  }
  
  void applyForce(PVector _force){
    PVector force = PVector.div(_force, mass);
    acceleration.add(force);
  }
  
  void update(){
    velocity.add(acceleration);
    //velocity.limit(20);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void checkEdges(){
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }
  }
  
  void display(){
    fill(255);
    ellipse(location.x, location.y, mass*10, mass*10);
  }
}

Ball[] balls = new Ball[10];

void initialize(){
  for(int i=0; i<balls.length; i++) balls[i] = new Ball();
}

void setup(){
  size(900, 900);
  initialize();  
}

void draw(){
  background(0); //<>//
  for(int i=0; i<balls.length; i++){
    // the force
    // of gravity is calculated relative to an object’s mass. The bigger the object, the stronger the
    // force. So if the force is scaled according to mass, it is canceled out when acceleration is
    // divided by mass. 
    PVector gravity = new PVector(0, 0.9).mult(balls[i].mass);
    balls[i].applyForce(gravity);
    
    PVector wind = new PVector(0.001,0);
    balls[i].applyForce(wind);
    
    balls[i].update();
    balls[i].checkEdges();
    balls[i].display();
  }
}

void mouseClicked() {
  initialize();  
}
