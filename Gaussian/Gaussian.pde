
import java.util.Random;

Random gen;
float stddev;
float meanHeight;
float meanWidth;

void setup(){
  size(800, 700);
  background(0);
  gen = new Random();
  stddev = 100;
  meanHeight = height/2;
  meanWidth = width/2;
}

void draw(){
  float gaussianX = (float) gen.nextGaussian();
  float gaussianY = (float) gen.nextGaussian();
  float gaussianRed = (float) gen.nextGaussian() * 55.0 + 126.0;
  float gaussianGreen = (float) gen.nextGaussian() * 55.0 + 126.0;
  float gaussianBlue = (float) gen.nextGaussian() * 55.0 + 126.0;
  gaussianX *= stddev;
  gaussianX += meanWidth;
  gaussianY *= stddev;
  gaussianY += meanHeight;
  //println(gaussianRed, gaussianGreen, gaussianBlue);
  noStroke();
  fill((int)gaussianRed, (int)gaussianGreen, (int)gaussianBlue);
  circle(gaussianX, gaussianY, 10);
}
