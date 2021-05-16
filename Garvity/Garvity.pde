class Body{
  PVector location, velocity, acceleration;
  int mass;
  
  Body(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = (int)random(10);
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
    } else if(location.y < 0){
      location.y = 0;
      velocity.y *= -1;
    }
  }

  void display(){
    fill(255);
    ellipse(location.x, location.y, mass*10, mass*10);
  }  
}

void attact(Body body_1, Body body_2){
  float G = 100; //<>//
  PVector force = PVector.sub(body_1.location, body_2.location);
  float distance = force.mag();
  float magnitude = (G * body_1.mass * body_2.mass) / (distance * distance);
  force.setMag(magnitude);
  body_2.applyForce(force);
  body_1.applyForce(force.mult(-1));
}


Body body1, body2;

void setup(){
  size(900, 600);
  body1 = new Body();
  body2 = new Body();
}

void draw(){
  background(0);
  attact(body1, body2);

  body1.update();
  body2.update();
  body1.checkEdges();
  body2.checkEdges();
  body1.display();
  body2.display();
}
