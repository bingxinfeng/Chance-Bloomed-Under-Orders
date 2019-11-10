/*
 Author: Bingxin Feng
 Date: January 2019
 
 ///////////////////////////////////// Project Description ////////////////////////////////////////////

 This project is a dynamic poster generating system.
 The main visual of the poster - a flower, would be growing in many different ways depending on 
 the audience's preferred decision. The project aims to explore the beauty of generative arts, 
 as well as to reflect on the relationship between order and chaos, computing and nature, decision and intangibility.
 
 > Order vs Chaos
 > Computing vs Nature
 
 In the process of studying programming and coding, I found that there're so many logics, so many debugs.
 But in computational arts, the relation between the artist and the computer is not just human-control-computer 
 or computer-control-human. We don't control it, we let the chaos happen, we watch it, respond to it, and collaborate with it.
 
 Also, reflecting on Henry Adams' "Chaos was the law of nature; Order was the dream of man." 
 - when a computer is generating chaos, when we stop ordering the computer, 
 the boundaries between order and chaos, between computing and nature are getting ambiguous.
 I think we actually study code to understand nature better.
 
 > Decision VS Intangibility
 
 The audience made decisions in the preset menu, as 'they were aware of whay they picked',
 however, they didn't know how the outcome poster would look like until the image completed its generating.
 So it's an experience that you thought you controlled everything, but there would be always 
 something suprising you. So there is no 'completely control'.
 
 ///////////////////////////////////// Introduction ////////////////////////////////////////////
 1. Press mouse to choose what you preferred in the menu.
 2. Press any keys to save the frame image.
 
 
 ////////////////////////////////////////// Strategy /////////////////////////////////////////////////
 1. Create one flower petal. 
 ___locate dots in a circular outline (for loop, sin cos)
 ___connect all dots together with line (beginShape, vertex, endShape)
 ___make the circle shape more organic (noise)
 ___stop background updating and move the shape to leave track
 ___change size/shape/color while the circle moving, have more dynamic drawings 
 
 2. Create one flower from iterating several petals.(Translation and rotation)
 3. Add other elements in the image. Like background pattern, quote texts (like poster), and mouse interaction.
 4. Look into the codes, find out and list the parameters I can pick up and change with if statement + mouse pressed condition.
 ___flower location
 ___petal amount
 ___petal color
 ___quiet, neat petal shape VS Loud, chaotic petal shape
 ___petal size
 ___flower growing speed
 ___flower rotating speed
 ___with/without mouse interaction in the final image
 ___background pattern organized VS random
 ___text size
 ___text font(typeface)
 ___text layout(location)
 
 5. Test mousePressed button: 
 ___when the button is pressed, a certain parameter was stored, and go to the next button page.
 ___Have to use a switch counter to complete this continuous button system,
 ___Otherwise it goes from begining to the end directly like this: s1->(s2->s3->s4->)s5
 
 6. Issue: Because the background is not updating, everything moved will leave the trace, 
 ___when switch from the button scene to the main poster drawing scene, the button scene can't just move and disapear, it leaves marks
 ___so the button scene before the main scene must be the same background color as the main scene, so that we can't see the marks.
 
 7. Design the button visuals and other details.
 8. Organize the codes. (Some long functions are separately placed to the other tabs.)
 
 
 
 ////////////////////////////////////////// Reference /////////////////////////////////////////////////
 >>>BOOKS
 1. Processing, A Programming Handbook for Visual Designers and Artists___Casey Reas and Ben Fry
 2. The Nature of Code___Daniel Shiffman 
 
 >>>INTERACTION INTERFACE
 3. Graphic design festival Scotland 2017 identity design ___https://graphicdesignfestivalscotland.com/2017/poster-generator/
 
 >>>PROCESSING VISUALS
 4. Color Smoke by Konstantin Makhmutov___https://www.openprocessing.org/sketch/498435
 
 >>>QUOTE
 5. "Chaos was the law of nature; Order was the dream of man."___The Education of Henry Adams
 */


//==================================================================================================
//Class objects
Petal petal;
GridBackground gridBg;

float s, switchCount; //for scene switch 
float shiftAmt; //for main scene translation

//Variables for different parameters
float anchorX, anchorY, anchorsw; //s2
int numPetal, ptNumsw; //s3
color c0, c1; //s4
float colorT, csw; //s4
float noiseSz, noiseSzsw;//s5
float rad, radsw; //s6
float sp, spsw; //s7
float wholeRotateT, rtsw;//s8 
int mousesw; //s9   
int bgsw; //s10
int textSz, textSzsw; //s11
int typefacesw; //s12
PFont font;//s12
int textLocsw; //s13

//Time variables for scene display contents
float s1T=0;
float s7T=0;

//==================================================================================================
void setup() {
  background(0);
  size(720, 1000);
  frameRate(60);

  petal = new Petal(0, 0, 50);
  gridBg = new GridBackground();

  s=1; //start from scene1
  switchCount=0; //default counter is 0
}

//==================================================================================================
void draw() {
  pushMatrix();
  translate(0, height-shiftAmt); //shift it for the button page to scroll up
  displayFrom_S1_to_S14(); //compressed s1~s14 display call into a function



  if (s==15) {        ////when it turns to the main scene

    displayScene14(); //cover the last scene, and shift it (will only succese when main scene actived) 

    shiftAmt+=10;
    if (shiftAmt>height) {
      shiftAmt=height;

      //draw the BG here
      if (bgsw==0) gridBg.display();
      if (bgsw==1) gridBg.display2();
    }

    if (shiftAmt==height) {      ////when the canvas get to the right position

      //petal color preset
      petalColorSetting();

      //create the flower from petals:
      pushMatrix();
      //anchorLoc setting
      if (anchorsw==0) { //left top
        anchorX=width/4; 
        anchorY=height/4;
      } 
      if (anchorsw==1) { //right down
        anchorX=width/4*3; 
        anchorY=height/4*3;
      } 
      if (mousesw==1) { //open mouse control
        anchorX=mouseX; 
        anchorY=mouseY;
      }
      translate(anchorX, anchorY); 

      pushMatrix();
      //rotateSp setting
      if (rtsw==0) wholeRotateT+=0.0005; //slow
      if (rtsw==1) wholeRotateT+=0.005; //fast
      rotate(wholeRotateT);

      //petalNem setting
      if (ptNumsw==0) numPetal=5;
      if (ptNumsw==1) numPetal=10;
      for (int i=0; i<numPetal; i++) {
        float angleStep = 2*PI/numPetal;
        pushMatrix();
        rotate(angleStep*i+wholeRotateT);

        //growing sp setting
        if (spsw==0)sp=0.1; //slow
        if (spsw==1)sp=0.2; //fast, 0.5 too fast
        petal.update(sp);

        //petalColor setting
        if (csw==0)petal.style(c0); 
        if (csw==1)petal.style(c1);

        //petalRad setting
        if (radsw==0)rad = 10; //small
        if (radsw==1)rad = 70; //big

        //noiseSz setting
        if (noiseSzsw==0) noiseSz=20; 
        if (noiseSzsw==1) noiseSz=60;

        petal.growPetalUnit(rad, noiseSz);

        popMatrix();
      }//rotate to draw several petals as a flower

      popMatrix();
      popMatrix();
    }//shitfman=height
    switchCount=0;
  }//s15
  popMatrix();//shiftAmt

  //draw the poster title here
  drawPosterText();
}

//==================================================================================================
// press any key to export the image
void keyPressed() {
  save("img_"+frameRate+".png");
}
//==================================================================================================
void petalColorSetting() {
  colorT+=0.01;
  float r = 255*sin(2*PI+colorT);
  float g = 255*sin(2*PI+PI/2+colorT);
  float b = 255*sin(2*PI+PI/4+colorT);
  c0 = color(255, g+50, b+50, 50);
  c1 = color(r-50, g+50, 255, 50);
}
//==================================================================================================
void drawPosterText() {
  if (s==15 && shiftAmt==height ) { //in the main scene

    if (textSzsw==0) textSz=70; //big text size
    if (textSzsw==1) textSz=20; //small text size

    if (typefacesw==0) font = createFont("ITC Avant Garde Gothic LT Extra Light.ttf", textSz); //avant font
    if (typefacesw==1) font = createFont("DietDidot Title Bold Italic.otf", textSz); //classic font

    textFont(font);
    fill(255, 5);
    if (textLocsw==0) { //text block located on the left top
      textAlign(LEFT);
      String s = "Chaos was the law of nature.";
      text(s, 25, 25, width/1.5, height);
      String ss = "Order was the dream of man.";
      if (typefacesw==0 && textSzsw==0) text(ss, 25, height/2.7, width/2, height);
      if (typefacesw==1 && textSzsw==0) text(ss, 25, height/4.2, width/2, height);
      if (textSzsw==1) text(ss, 25, 50, width/2, height);
    }

    if (textLocsw==1) { //words scattering everywhere
      randomSeed(1000);
      textAlign(CENTER);
      //int xRange =200;
      float yUnit=height/12;
      text("Chaos", random(50, width-200), random(yUnit), 200, 100);
      text("was", random(50, width-200), random(yUnit, yUnit*2), 150, 100);
      text("the", random(50, width-200), random(yUnit*2, yUnit*3), 150, 100);
      text("law", random(50, width-200), random(yUnit*3, yUnit*4), 150, 100);
      text("of", random(50, width-200), random(yUnit*4, yUnit*5), 100, 100);
      text("nature.", random(50, width-200), random(yUnit*5, height/2), 250, 100);
      randomSeed(375);
      int adjustY = 100;
      text("Order", random(50, width-200), random(height/2, yUnit*7-adjustY), 200, 100);
      text("was", random(50, width-200), random(yUnit*7, yUnit*8-adjustY), 150, 100);
      text("the", random(50, width-200), random(yUnit*8, yUnit*9-adjustY), 150, 100);
      text("dream", random(50, width-200), random(yUnit*9, yUnit*10-adjustY), 300, 100);
      text("of", random(50, width-200), random(yUnit*10, yUnit*11-adjustY), 100, 100);
      text("man.", random(50, width-200), random(yUnit*11, height)-50, 250, 100);
    }
  }
}
