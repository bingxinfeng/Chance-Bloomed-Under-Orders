void displayFrom_S1_to_S14(){
  if (s==1) {       ////start
    displayScene1();
  }
  if (s==2) {       ////anchorLoc
    displayScene2();
    switchCount=1;
  }
  if (s==3) {       ////petalnum
    displayScene3();
    switchCount=0;
  }
  if (s==4) {       ////petal color
    displayScene4();
    switchCount=1;
  }
  if (s==5) {       ////noiseSz
    displayScene5();
    switchCount=0;
  }
  if (s==6) {       ////petal rad
    displayScene6();
    switchCount=1;
  }
  if (s==7) {       ////grow speed
    displayScene7();
    switchCount=0;
  }
  if (s==8) {       ////rotate speed
    displayScene8();
    switchCount=1;
  }
  if (s==9) {       ////mouse control on/off
    displayScene9();
    switchCount=0;
  }
  if (s==10) {       ////backgroung choice
    displayScene10();
    switchCount=1;
  }
  if (s==11) {       ////testSz
    displayScene11();
    switchCount=0;
  }
  if (s==12) {       ////typeface
    displayScene12();
    switchCount=1;
  }
  if (s==13) {       ////text layout
    displayScene13();
    switchCount=0;
  }
  if (s==14) {       ////the generate page 
    displayScene14();
    switchCount=1;
  }
}
