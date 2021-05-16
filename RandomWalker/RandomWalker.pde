

class Walker{
  int x,y;
  
  Walker(){
    x = width/2;
    y = height/2;
  }
  
  void render(int extent){
    stroke(255);
    //point(x, y);
    circle(x, y, extent);
  }
  
  void walk(int walkStep){
    int randomStep = int(random(4));
    if(randomStep == 0)x += walkStep;
    else if(randomStep == 1) x -= walkStep;
    else if(randomStep == 2) y += walkStep;
    else y -= walkStep;
    
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
    
    render(walkStep);
  }

}

Walker walker;

void setup(){
  walker = new Walker();
  
  size(800, 700);
  background(0);
}

void draw(){
  walker.walk(3);
}
