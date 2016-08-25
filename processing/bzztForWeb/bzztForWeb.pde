Bzzt b;
int clean, cleanCounter;

void setup() {
  size( $(window).width(), $(window).height() );
  background(0, 179, 254);
  noStroke();

  b = new Bzzt();

  clean = 255;
  cleanCounter = 0;
}

void draw() {
  if (b.isStopped()) {
    if (cleanCounter < clean) {
      // Using rect instead of background to fade out
      fill(0, 179, 254, cleanCounter);
      rect(0, 0, width, height);
      cleanCounter++;
    } else {
      b = new Bzzt();
      cleanCounter = 0;
    }
  } else {
    b.make();
  }
}