//=======================================================
void displayScene1() { ////start scene////
  noStroke();
  fill(0);
  rect(0, -height, width, height); //bg

  s1T+=0.001;
  noFill();
  stroke(100);
  for (int i=0; i<10; i++) { //bg circles
    ellipse(width/2, -height/1.8, 1200*sin(2*PI/10*i+s1T), 1200*sin(2*PI/10*i+s1T));
  }

  PFont cali, calisto;
  cali = createFont("Calibri Bold.ttf", 60);
  calisto = createFont("Cambria Italic.ttf", 26);
  textFont(cali);
  textAlign(CENTER);
  fill(255);
  text("You pick.", width/2, -height/1.5);
  text("She blooms.", width/2, -height/1.7);
  textFont(calisto);
  text("Click to Start", width/2, -height/2.5);
}
//-----------------------------------------------------
void displayScene2() { ////anchorLoc////
  noStroke();
  fill(255);
  rect(0, -height, width, height); //bg

  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  rect(0, -height, 400, 200); //top left rect
  rect(width-500, -200, 500, 200); //right bottom rect

  PFont cali;
  cali = createFont("Calibri Bold.ttf", 80);
  textFont(cali);
  fill(255);
  textAlign(LEFT);
  text("Left Top", 30, -height+80);
  textAlign(RIGHT);
  text("Right Bottom", width-30, -40);
}
//-----------------------------------------------------
void displayScene3() { ////petal num////
  fill(255);
  rect(0, -height, width, height); //bg

  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  textAlign(CENTER);
  text("55555", width/2, -height+height/4);
  text("7777777", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene4() { ////petal color////
  fill(#FF5436);
  rect(0, -height, width, height/2); //top half - red
  fill(#3684FF);
  rect(0, -height/2, width, height/2); //down half - blue

  fill(255);
  rect(0, -height+height/2, width, 10); //half split bar

  textAlign(CENTER);
  text("Hot", width/2, -height+height/4);
  text("Cool", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene5() { ////noise size////
  fill(255);
  rect(0, -height, width, height); //bg

  beginShape(); //neat circle
  for (int i=0; i<51; i++) {
    float x = width/2 + cos(2*PI/50*i)*150;    
    float y = -height/1.3 + sin(2*PI/50*i)*150;
    noFill();
    stroke(0);
    strokeWeight(1);
    vertex(x, y);
  }
  endShape();

  beginShape(); //chaos circle
  for (int i=0; i<50; i++) {
    float x = width/2 + cos(2*PI/50*i)*150 -20;    
    float y = -height/1.3 + sin(2*PI/50*i)*150 +height/1.9;
    noFill();
    stroke(0);
    strokeWeight(1);
    vertex(x+noise(100*i)*50, y-noise(50*i)*50);
  }
  endShape();

  fill(0);
  noStroke();
  rect(0, -height+height/2, width, 10); //half split bar

  textAlign(CENTER);
  text("Neat", width/2, -height+height/4);   
  text("Chaos", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene6() { ////petal rad////
  fill(255);
  rect(0, -height, width, height); //bg

  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar
  ellipse(width/2, -height+height/4.1, 100, 100); //small ball
  ellipse(width/2, -height/4, 350, 350); //big ball

  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Small", width/2, -height+height/4);   
  textSize(90);
  text("Big", width/2, -height/4.5);
}
//-----------------------------------------------------
void displayScene7() { ////grow speed////
  fill(255);
  rect(0, -height, width, height); //bg

  stroke(0);
  strokeWeight(1);
  float x = 0;
  float y = -height+60;
  float yy = y+height/2;
  s7T+=1;
  for (int i=0; i<11; i++) {
    line(x, y+i*30, x+s7T, y+i*30);     //slow lines
    line(x, yy+i*30, x+s7T*2, yy+i*30); //fast lines
  }

  noStroke();
  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  textAlign(CENTER);
  text("Slow", width/2, -height+height/4);   
  text("Fast", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene8() { ////rotate speed////
  noStroke();
  fill(255);
  rect(0, -height, width, height); //bg

  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  stroke(0);
  strokeWeight(1);
  //slow line
  pushMatrix();
  translate(width/2, -height+height/4-20);
  pushMatrix();
  s7T+=0.1;
  rotate(s7T/10);      
  line(-200, 0, 200, 0);
  popMatrix();
  //fast line
  translate(0, height/1.9);
  rotate(s7T);        
  line(-200, 0, 200, 0);
  popMatrix();

  textAlign(CENTER);
  text("Slow", width/2, -height+height/4);   
  text("Fast", width/2, -height/4.3);
}
//-----------------------------------------------------
void displayScene9() { ////mouse control////
  noStroke();
  fill(255);
  rect(0, -height, width, height/2); //bg
  fill(255, 50);
  rect(0, -height/2, width, height/2); //half opacity bg for "hands-on"

  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  textAlign(CENTER);
  text("Watch&Enjoy", width/2, -height+height/4);  

  float x = width/2;
  float y = -height+height/4*3;
  if (mouseY<height/2) {        //when mouse on the top half, "hands-on" stays default loc
    x = width/2;
    y = -height+height/4*3;
  }
  if (mouseY>height/2) {        //when mouse on the bottom half, "hands-on" follows mouse
    x=mouseX;
    y=mouseY-height;
  }
  text("Hands-on", x, y);
}
//-----------------------------------------------------
void displayScene10() { ////background choice////
  fill(255);
  rect(0, -height, width, height); //bg

  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  //order circles
  for (int i=0; i<width+20; i+=20) {      
    for (int j=-height; j<-height/2+20; j+=20) { 
      ellipse(i, j, 5, 5);
    }
  }
  //disorder circles
  randomSeed(0);
  for (int i=0; i<200; i++) {
    ellipse(random(0, width), random(-height/2, 0), 5, 5);
  }
  
  textAlign(CENTER);
  text("Order", width/2, -height+height/4);   
  text("Disorder", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene11() { ////textSize////
  fill(255);
  rect(0, -height, width, height); //bg
  
  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar
  
  textAlign(CENTER);
  textSize(100);
  text("70", width/2, -height+height/4);  
  textSize(40);
  text("20", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene12() { ////typeface////
  fill(255);
  rect(0, -height, width, height); //bg
  
  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar

  textAlign(CENTER);
  PFont avant;
  avant = createFont("ITC Avant Garde Gothic LT Extra Light.ttf", 80);
  textFont(avant);
  text("Avant", width/2, -height+height/4);
  PFont classic;
  classic = createFont("DietDidot Title Bold Italic.otf", 80);
  textFont(classic);
  text("Classic", width/2, -height+height/4*3);
}
//-----------------------------------------------------
void displayScene13() { ////text layout////
  fill(255);
  rect(0, -height, width, height); //bg
  
  fill(0);
  rect(0, -height+height/2, width, 10); //half split bar
  
  PFont cali;
  cali = createFont("Calibri Bold.ttf", 80);
  textFont(cali);
  textAlign(CENTER);
  text("Nerdy", width/2, -height+height/4);   
  randomSeed(0);
  text("A", random(50,width-50),-height/3);
  text("r", random(50,width-50),-height/4);
  text("t", random(50,width-50),-height/5);
  text("s", random(50,width-50),-height/6);
  text("y", random(50,width-50),-height/7);
}
//-----------------------------------------------------
void displayScene14() { ////generate scene////
  noStroke();
  fill(0);
  rect(0, -height, width, height); //bg
  
  PFont cali, calisto;
  cali = createFont("Calibri Bold.ttf", 60);
  calisto = createFont("Cambria Italic.ttf", 26);
  textFont(cali);
  textAlign(CENTER);
  fill(255);
  text("You pick.", width/2, -height/1.5);
  text("She blooms.", width/2, -height/1.7);
  textFont(calisto);
  text("Click to Generate", width/2, -height/2.5);
}
