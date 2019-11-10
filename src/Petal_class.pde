class Petal {
  //VARIABLES ----------------------------------------------
  ///for one whole petal unit///
  float anchorX, anchorY, rad, noiseSz; 

  ///for the particles (vectors)///
  int numOfDots; //the more dots, the edge smoother
  float x, y, offsetx, offsety;

  float sp; //movement increment
  float t;

  color c;

  //SETUP -------------------------------------------------
  Petal(float _anchorX, float _anchorY, int _numOfDots) {
    anchorX=_anchorX;
    anchorY=_anchorY;
    numOfDots = _numOfDots;
    t=0;
  }
  //UPDATE -------------------------------------------------
  void update(float _sp) {
    t+=0.001;
    sp=_sp;
    anchorX = anchorX + sp;
    anchorY = anchorY + sp;
  }
  //STYLE --------------------------------------------------
  void style(color _c) {
    noFill();
    c = _c;
    stroke(c);
    strokeWeight(0.5);
  }
  //DRAW a Floating Organic Circle --------------------------
  void drawFloatingCcl(float _rad, float _noiseSz) {
    rad=_rad;
    noiseSz=_noiseSz;
   
    beginShape();
    for (int i=0; i<numOfDots; i++) {
      offsetx=noise(i+t)*noiseSz; 
      offsety=noise(i+50+t)*noiseSz;
      x=cos(radians(360/numOfDots+0.5)*i)*rad*0.75 + offsetx;
      y=sin(radians(360/numOfDots+0.5)*i)*rad + offsety;
      vertex(x, y);
    }
    endShape();
    println(y);
  }
  //Growing the organic circle ------------------------------
  void growPetalUnit(float _rad, float _noiseSz) {
    rad=_rad;
    noiseSz=_noiseSz;
    
    pushMatrix();
    translate(anchorX, anchorY);
    scale(t, t);
    rotate(t);
    drawFloatingCcl(rad, noiseSz);
    popMatrix();
  }
  //---------------------------------------------------------
}
