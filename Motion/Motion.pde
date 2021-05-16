class Mover{
  PVector location, velocity;
  
  Mover(){
     location = new PVector(width, height);
     velocity = new PVector(random(-2,2),random(-2,2));
  }

  void update(){
    location.add(velocity);
  }

  void checkEdges(){
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
}

Mover mover;

void setup(){
  mover = new Mover();
  size(800, 700);
  //frameRate(120);
}

void draw(){
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}
