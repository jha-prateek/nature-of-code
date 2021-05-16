int[] rC;

void setup(){
  size(700, 700);
  rC = new int[20];
}

void draw(){
  background(255);
  int index = int(random(rC.length));
  rC[index]++;
  stroke(0);
  fill(180);
  
  int w = width/rC.length;
  for(int x=0; x < rC.length; x++){
    // height being calculated from top
    rect(x*w, height-rC[x], w-1, rC[x]);
  }
}
