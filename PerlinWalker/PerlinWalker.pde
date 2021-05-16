
class Walker{
  int x,y, c;
  float tx, ty, tc;
  
  Walker(){
    x = 0;
    y = 0;
    tx = ty = tc = 0.0;
    c = 0;
  }
  
  void render(){
    //noStroke();
    fill(120, c, 120);
    ellipse(x, y, 10, 10);
  }
  
  void walk(){
    x = (int)map(noise(tx), 0, 1, 0, width);
    y = (int)map(noise(ty), 0, 1, 0, height);
    c = (int)map(noise(tc, tx), 0, 1, 0, 255);    
    tx += 0.01;
    ty += 0.02;
    tc += 0.1;
    render();
  }

}

Walker walker;

void setup(){
  size(600, 400);
  background(0);
  walker = new Walker();
}

void draw(){
  walker.walk();
}
