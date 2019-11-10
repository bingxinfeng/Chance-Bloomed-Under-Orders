void mousePressed() {
  fill(255,255,0);
  ellipse(mouseX,mouseY,30,30);//showing your click
  
  //s1 to s2 ------------------------------
  if (s==1 && switchCount==0) {
    s=2;
    switchCount = 0; //when the program start sw start with 0
  }
  //s2 to s3 ------------------------------
  if (s==2 && mouseY<height/2 && switchCount==1 ) { //in actived s2 sw turnned to 1
    s=3;                                            //after call display next scene in draw, turn sw to the opposite num
    anchorsw=0;
    //switchCount = 1;
  }
  if (s==2 && mouseY>height/2 && switchCount==1) {
    s=3;
    anchorsw=1;
    //switchCount = 1;
  }
  //s3 to s4 ------------------------------
  if (s==3 && mouseY<height/2 && switchCount==0) {
    s=4;
    ptNumsw=0;
  }
  if (s==3 && mouseY>height/2 && switchCount==0) {
    s=4;
    ptNumsw=1;
  }
  //s4 to s5 ------------------------------
  if (s==4 && mouseY<height/2 && switchCount==1) {
    s=5;
    csw=0;
  }
  if (s==4 && mouseY>height/2 && switchCount==1) {
    s=5;
    csw=1;
  }
  //s5 to s6 ------------------------------
  if (s==5 && mouseY<height/2 && switchCount==0) {
    s=6;
    noiseSzsw=0;
  }
  if (s==5 && mouseY>height/2 && switchCount==0) {
    s=6;
    noiseSzsw=1;
  }
  //s6 to s7 ------------------------------
  if (s==6 && mouseY<height/2 && switchCount==1) {
    s=7;
    radsw=0;
  }
  if (s==6 && mouseY>height/2 && switchCount==1) {
    s=7;
    radsw=1;
  }
  //s7 to s8 ------------------------------
  if (s==7 && mouseY<height/2 && switchCount==0) {
    s=8;
    spsw=0;
  }
  if (s==7 && mouseY>height/2 && switchCount==0) {
    s=8;
    spsw=1;
  }
  //s8 to s9 ------------------------------
  if (s==8 && mouseY<height/2 && switchCount==1) {
    s=9;
    rtsw=0;
  }
  if (s==8 && mouseY>height/2 && switchCount==1) {
    s=9;
    rtsw=1;
  }
  //s9 to s10 ------------------------------
  if (s==9 && mouseY<height/2 && switchCount==0) {
    s=10;
    mousesw=0;
  }
  if (s==9 && mouseY>height/2 && switchCount==0) {
    s=10;
    mousesw=1;
  }
  //s10 to s11 ------------------------------
  if (s==10 && mouseY<height/2 && switchCount==1) {
    s=11;
    bgsw=0;
  }
  if (s==10 && mouseY>height/2 && switchCount==1) {
    s=11;
    bgsw=1;
  }
  //s11 to s12 ------------------------------
  if (s==11 && mouseY<height/2 && switchCount==0) {
    s=12;
    textSzsw=0;
  }
  if (s==11 && mouseY>height/2 && switchCount==0) {
    s=12;
    textSzsw=1;
  }
  //s12 to s13 ------------------------------
  if (s==12 && mouseY<height/2 && switchCount==1) {
    s=13;
    typefacesw=0;
  }
  if (s==12 && mouseY>height/2 && switchCount==1) {
    s=13;
    typefacesw=1;
  }
  //s13 to s14 ------------------------------
  if (s==13 && mouseY<height/2 && switchCount==0) {
    s=14;
    textLocsw=0;
  }
  if (s==13 && mouseY>height/2 && switchCount==0) {
    s=14;
    textLocsw=1;
  }
  //s14 to s15 ------------------------------
  if (s==14 && switchCount==1) {
    s=15;
  }
  if (s==14 && switchCount==1) {
    s=15;
  }
}
