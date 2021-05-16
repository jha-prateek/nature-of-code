class Balloon{
  PVector location, velocity, acceleration;
  
  Balloon(){
    location = new PVector(random(width), height); //<>//
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update(){
    if(location.y > 0){
      PVector top = new PVector(location.x, 0);
      PVector thrust = PVector.sub(top, location);
      thrust.setMag(random(0, 0.5));
      acceleration.add(thrust);
      
      PVector wind = new PVector(random(0, 0.2), random(-0.8, 0.8));
      acceleration.add(wind);
      
      velocity.add(acceleration);
      velocity.limit(5);
      location.add(velocity);
    }
    acceleration.mult(0);
  }
  
  void checkEdges(){
    if(location.x < 0) location.x = 0;
    else if(location.x > width) location.x = width;
    if(location.y < 0) location.y = 0;
    else if(location.y > height) location.y = height;
  }
  
  void display(){ //<>//
    fill(255);
    ellipse(location.x, location.y, 25, 25);
  }
}

Balloon[] balloons = new Balloon[10];

void initializeBalloons(){
  for(int i=0; i<balloons.length; i++){
    balloons[i] = new Balloon();
  }
}

void setup(){
  size(900, 900);
  initializeBalloons();
}

void draw(){
  background(0);
  for(int i=0; i<balloons.length; i++){
    balloons[i].update();
    balloons[i].checkEdges();
    balloons[i].display();
  }
}

void mouseClicked() {
 initializeBalloons();
}
