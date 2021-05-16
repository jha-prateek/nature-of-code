class BouncingBall{
  PVector position, velocity;
  
  BouncingBall(){
    position = new PVector(width/2, height/2);
    velocity = new PVector(1, 1.3);
  }
  
  void display(){
    position.add(velocity);
    
    if((position.x > width) || (position.x < 0)){
      velocity.x *= -1;
    }
    
    if((position.y > height) || (position.y < 0)){
      velocity.y *= -1;
    }
    
    background(0);
    stroke(0);
    fill(175);
    ellipse(position.x, position.y, 30, 30);
    
  }
}

BouncingBall ball;

void setup(){
  size(800, 700);
  background(0);
  frameRate(240);
  ball = new BouncingBall();
}

void draw(){
  ball.display();
}
