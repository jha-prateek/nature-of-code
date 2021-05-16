class Fluid{
  float dragCoefficient;
  float x,y,w,h;
  
  Fluid(float _dragCoefficient) {
    dragCoefficient = _dragCoefficient;
    x = 0;
    y = height/2;
    w = width;
    h = height/2;
  }
  
  void display() {
    fill(75);
    rect(x,y,w,h);
  }
}

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
  
  boolean isInsideFluid(Fluid _fluid){
    if (location.x > _fluid.x && 
        location.x < _fluid.x + _fluid.w && 
        location.y > _fluid.y && 
        location.y < _fluid.y + _fluid.h)return true;
    else return false;
  }
  
  void createDrag(Fluid _fluid){
    float speed = velocity.mag();
    float dragMagnitude = _fluid.dragCoefficient * speed * speed;
    PVector drag = velocity.get();
    drag.setMag(-1);
    drag.mult(dragMagnitude);  
    applyForce(drag);
  }
  
  void display(){
    fill(255);
    ellipse(location.x, location.y, mass*10, mass*10);
  }
}

Ball[] balls = new Ball[10];
Fluid fluid;

void initialize(){
  for(int i=0; i<balls.length; i++) balls[i] = new Ball();
}

void setup(){
  size(900, 600);
  initialize();  
  fluid = new Fluid(0.05);
}

void draw(){
  background(0);
  fluid.display();
  
  for(int i=0; i<balls.length; i++){
    // the force
    // of gravity is calculated relative to an object’s mass. The bigger the object, the stronger the
    // force. So if the force is scaled according to mass, it is canceled out when acceleration is
    // divided by mass. 
    PVector gravity = new PVector(0, 0.9).mult(balls[i].mass); // F = A x M
    balls[i].applyForce(gravity);
    
    if(key == 'w'){
      PVector wind = new PVector(0.08,0);
      balls[i].applyForce(wind);
    }
    
    float u = 0.09;
    float N = 1;
    PVector friction = balls[i].velocity.get();
    friction.setMag(-1);     // -1 x v
    friction.mult(u * N); // u x N
    balls[i].applyForce(friction);
    
    if(balls[i].isInsideFluid(fluid))balls[i].createDrag(fluid);
    
    balls[i].update();
    balls[i].checkEdges();
    balls[i].display();
  }
}

void keyPressed() {
  if(key == 'r') initialize();  
}
