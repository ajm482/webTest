class Bzzt {

  float theta, r, x, y, xLoc, yLoc, angle, rotRate, pos, dist, growth, growthRate, size, maxSize;
  boolean out;

  color startColor, currentColor, endColor;
  float rColorDiff, gColorDiff, bColorDiff;
  float rRate, gRate, bRate;
  int colorSign, colorSteps, colorCounter;
  boolean colorSwitch;

  boolean stopped, made;

  Bzzt() {

    theta = 0;
    r = 1;
    x = 0;
    y = 0;
    xLoc = width/2;
    yLoc = height/2;
    angle = 0;
    rotRate = 0.01;
    out = true;
    growth = 0;
    growthRate = random(.1, .5);
    size = r;
    maxSize = random(50, width/2);

    //startColor = color(255, 136, 0);
    startColor = color(random(255), random(255), random(255));
    endColor = color(0, 179, 254);
    colorSteps = 100;
    rColorDiff = red(startColor) - red(endColor);
    gColorDiff = green(startColor) - green(endColor);
    bColorDiff = blue(startColor) - blue(endColor);
    rRate = rColorDiff/colorSteps;
    gRate = gColorDiff/colorSteps;
    bRate = bColorDiff/colorSteps;

    currentColor = startColor;
    colorSign = 1;
    colorSwitch = true;

    stopped = false;
    made = false;
  }

  boolean isStopped() {
    return stopped;
  }

  void make() {
    translate(xLoc, yLoc);

    /* Color */
    if (colorCounter >= colorSteps) {
      colorSwitch = false;
    } else if (colorCounter <= 0) {
      colorSwitch = true;
    }

    if (colorSwitch) {
      colorSign = 1;
      colorCounter++;
    } else {
      colorSign = -1;
      colorCounter--;
    }

    float newR = red(currentColor) + (rRate * colorSign);
    float newG = green(currentColor) + (gRate * colorSign);
    float newB = blue(currentColor) + (bRate * colorSign);

    currentColor = color(newR, newG, newB);
    fill(currentColor);

    /* Position and rotation */
    rotate(angle);
    angle += rotRate;

    /* Travel direction */
    //if (dist >= height/2 - size/2) {
    if (dist >= maxSize) {
      out = false;
    }

    /* Stopping condition */
    if (dist <= 0 && out == false) {
      stopped = true;
    }

    if (out) {
      pos += 1;
      growth = growthRate;
    } else {
      pos -= 1;
      growth = -growthRate;
    }

    // Calculate new radius and size
    dist = r + pos;
    size = size + growth;

    for (int i = 1; i < 361; i += 30) { 
      // Conversion from polar to cartisian coordinates
      theta = radians(i);
      x = dist * cos(theta);
      y = dist * sin(theta);

      ellipse(x, y, size, size);
    }
  }
}