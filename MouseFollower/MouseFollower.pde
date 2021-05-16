class Mover{
  PVector location, velocity, acceleration;
  float noiseSpace;
  
  Mover(){
     location = new PVector(random(width), random(height));
     velocity = new PVector(random(-2,2),random(-2,2));
     noiseSpace = 0;
  }

  void update(){
    PVector mouse = new PVector(mouseX, mouseY); 
    PVector direction = PVector.sub(mouse, location);
    direction.normalize();
    float perlinNoise = map(noise(noiseSpace),0,1,0,2); 
    direction.mult(perlinNoise); 
    acceleration = direction;
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    noiseSpace += 0.01;
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
    fill(255);
    ellipse(location.x,location.y,16,16);
  }
}

Mover[] movers = new Mover[20];

void initializeFollowers(){
  for(int i=0; i<movers.length; i++){
    movers[i] = new Mover();
  }
}

void setup(){
  size(800, 700);
  background(0);
  //frameRate(24);
  initializeFollowers();
}

void draw(){
  background(0);
  for(int i=0; i<movers.length; i++){
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

void mouseClicked() {
 initializeFollowers();
}
