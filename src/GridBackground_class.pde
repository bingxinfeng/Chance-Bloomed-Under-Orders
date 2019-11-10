

class GridBackground {
  //VARIABLES ----------------------------------------------
  int numXtile, numYtile;
  float spacingX, spacingY, startX, startY, xpos, ypos;
  float cclRad;
  int t2;

  //SETUP -------------------------------------------------
  GridBackground() {
    numXtile = 20;
    numYtile = 30;

    spacingX = (width + spacingX)/numXtile;
    spacingY = (height + spacingY)/numYtile;
    startX = 0;
    startY = 0;

    cclRad = 3;
  }

  //dots in grid location ----------------------------------
  void display() {
    t2+=1;
    for (int i=0; i<numXtile+1; i++) {
      for (int j=0; j<numYtile+1; j++) {
        xpos = startX + i * spacingX;
        ypos = startY + j * spacingY;
        randomSeed(i*j*t2);
        fill(random(100));
        noStroke();
        ellipse(xpos, ypos, cclRad, cclRad);
        pushMatrix();
        translate(spacingX/2, spacingY/2);
        ellipse(xpos, ypos, cclRad/2, cclRad/2);
        popMatrix();
      }
    }
  }

  //dots in random locations --------------------------------
  void display2() {
    t2+=1;
    randomSeed(0);
    for (int i=0; i<150; i++) {
      xpos = random(0, width);
      ypos = random(0, height);
      randomSeed(t2*i);
      fill(random(255));
      noStroke();
      randomSeed(1000*i);
      cclRad = random(0, 6);
      ellipse(xpos, ypos, cclRad, cclRad);
    }
  }
  //---------------------------------------------------------
}
