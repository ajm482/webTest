void setup() {
  size(640, 640);
  noStroke();
}
 
void draw() {
  background(40);
  translate(width/2, height/2);
  // Inside tails
  for (int i = 0; i < 360; i+=36) {
    for (int q = 0; q < 120; q+=10) {
      float x = sin(radians(i))*100+sin(radians(i-q+frameCount*2.5))*50;
      float y = cos(radians(i))*100+cos(radians(i-q+frameCount*2.5))*50;
      float s = map(q, 0, 120, 10, 0);
      fill(map(q, 0, 140, 255, 0), 0, 255);
      ellipse(x, y, s, s);
    }
     
    // Outside tails
    for (int q = 0; q < 140; q+=10) {
      float x = sin(radians(i))*120+sin(radians(i+q-frameCount*2))*75;
      float y = cos(radians(i))*120+cos(radians(i+q-frameCount*2))*75;
      float s = map(q, 0, 140, 15, 0);
      fill(map(q, 0, 140, 255, 0), 0, 255);
      ellipse(x, y, s, s);
    }
  }
}