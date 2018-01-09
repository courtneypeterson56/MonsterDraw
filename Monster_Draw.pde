/*
Title: Monster Draw
 Imagined, Designed, and Programmed by: Courtney Peterson
 Date: May 23, 2016
 
 Description: 
 
 This code in Processing creates a designer for different types of monsters! 
 The design will then be exported into Silhouette where it will be traced and cut 
 out into a vinyl sticker. In order to create this designer, I used four different 
 general body parts to choose: body shape, eyes, mouth and head. Under these I 
 created more options including the amount of eyes wanted, whether you want horns 
 or antenna, a smile and/or teeth, and the choice between two types of body shapes 
 and its color. I used buttons and a drop-down bar to help the user to generate the 
 design. I also created a "clear" function and button that clears the display screen, 
 and a "save image" function when any key is pressed. I'm not quite sure where my idea 
 for monsters derived from, but I thought they would be very cute stickers. 
 
 Sources of ideas and inspiration (title, author, URL):
 *various "cute monster clip art" photos on google images that gave me the inspiration for the monster body shapes 
 
 Includes code from (title, author, URL):
 * Bezier Curve Code Generator, Natalie Freed, https://gist.github.com/nataliefreed/acd1260d0a899174094c
 * Exporting Design Code, Natalie Freed, https://docs.google.com/document/d/1QWzfxIEBNf9iNXtfiIIXU_4ekalOnk4X_czRK6S5D3M/edit
 
 */

import controlP5.*;
ControlP5 cp5;

Accordion accordion;


color c;

PImage glossy;

boolean monsterBody1 = false;
boolean monsterBody2 = false;
boolean monsterSmile = false;
boolean eyeOne  = false;
boolean eyeTwo  = false;
boolean eyeThree  = false;
boolean eyeFour  = false;
boolean monsterHorns  =   false;
boolean monsterAntenna = false;
boolean monsterTeeth = false;


void setup() {
  cp5 = new ControlP5(this);
  glossy = loadImage("glossy palette.png"); //the color pallete from the vinyl website


  PFont font;
  font = loadFont("Serif-48.vlw");
  textFont(font);

  size (1200, 800);

  addGroups(); //these are all the buttons and accordian
  addClearButton();  //this is the button for the "clear"

  c = color(#A23636); //this makes the initial color of the monster body
}


void mousePressed() { //this picks up the color of the screen when pressed and assigns it to the color of the monster body
  if (mouseX > 200 && mouseX < 600) {
    c = get(mouseX, mouseY);
  }
}

void draw() {
  background(255, 255, 255);
  drawDisplay();
  pushMatrix();
  scale(.4, .4);
  fill(0);
  text("When you are done with your monster, press any key to save the photo!", 900, 1960);
  text("Pick your monster body color:", 650, 200);
  popMatrix();

  pushMatrix();  //vinyl color image
  beginShape();
  scale (.25);
  image(glossy, 1000, 400);
  scale (1/.25);
  endShape();
  popMatrix();

  if (monsterBody2 == true) { //allows so the image stays on the display until pressed clear and one aspect or another (no two bodies)
    drawMonsterBody2();
  } else if (monsterBody1 == true) { 
    drawMonsterBody1();
  } 


  if (monsterSmile == true) {
    drawSmile();
  } 

  if (monsterTeeth == true) {
    drawTeeth();
  }



  if (eyeFour == true) {
    drawEye4();
  } else if (eyeThree == true) {
    drawEye3();
  } else if (eyeTwo == true) {
    drawEye2();
  } else if (eyeOne == true) {
    drawEye1();
  }

  if (monsterAntenna == true) {
    drawAntenna();
  } else if (monsterHorns == true) {
    drawHorns();
  }
}

void clearButton() {
  monsterBody1 = false;
  monsterBody2 = false;
  monsterSmile = false;
  eyeOne = false;
  eyeTwo = false;
  eyeThree = false;
  eyeFour = false;
  monsterHorns = false;
  monsterAntenna = false;
  monsterTeeth = false;
}


void drawDisplay() {
  stroke(0);
  strokeWeight(4);
  noFill();
  rect(650, 60, 500, 600); //display board

  fill(0);
  text("Display:", 650, 40);
}


void smileButton() {
  monsterSmile = true;
}

void teethButton() {
  monsterTeeth = true;
}

void monster1Button() {
  monsterBody1 = true;
}

void monster2Button() {
  monsterBody2 = true;
}
void eye1Button() {
  eyeOne = true;
}
void eye2Button() {
  eyeTwo = true;
}
void eye3Button() {
  eyeThree = true;
}
void eye4Button() {
  eyeFour = true;
}

void hornButton() {
  monsterHorns = true;
}

void antennaButton() {
  monsterAntenna = true;
}

void addGroups() { //accordian to hold buttons for body parts

  cp5 = new ControlP5(this);


  // GROUP 1  
  Group g1 = cp5.addGroup("myGroup1")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(150)
    .setLabel("Monster Body Shape")
    .setHeight(30)
    ;


  cp5.addButton("monster1Button") 
    .setLabel("Body 1")
    .setPosition(20, 20)
    .setSize(100, 30)
    .moveTo(g1)
    ;

  cp5.addButton("monster2Button") 
    .setLabel("Body 2")
    .setPosition(20, 60)
    .setSize(100, 30)
    .moveTo(g1)
    ;

  // GROUP 2     
  Group g2 = cp5.addGroup("myGroup2")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(200)
    .setLabel("Monster Eyes")
    .setHeight(30)
    ;

  cp5.addButton("eye1Button") 
    .setLabel("Eye 1")
    .setPosition(20, 30)
    .setSize(100, 30)
    .moveTo(g2)
    ;

  cp5.addButton("eye2Button") 
    .setLabel("Eye 2")
    .setPosition(20, 70)
    .setSize(100, 30)
    .moveTo(g2)
    ;

  cp5.addButton("eye3Button")
    .setLabel("Eye 3")
    .setPosition(20, 110)
    .setSize(100, 30)
    .moveTo(g2)
    ;

  cp5.addButton("eye4Button") 
    .setLabel("Eye 4")
    .setPosition(20, 150)
    .setSize(100, 30)
    .moveTo(g2)
    ;


  // GROUP 3     
  Group g3 = cp5.addGroup("myGroup3")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(100)
    .setLabel("Monster Mouth")
    .setHeight(30)
    ;

  cp5.addButton("teethButton")
    .setLabel("Teeth")
    .setPosition(20, 50)
    .setSize(100, 30)
    .moveTo(g3)
    ;

  cp5.addButton("smileButton")
    .setLabel("Smile")
    .setPosition(20, 10)
    .setSize(100, 30)
    .moveTo(g3)
    ;

  //Group 4
  Group g4 = cp5.addGroup("myGroup4")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(150)
    .setLabel("Monster Head")
    .setHeight(30)
    ;

  cp5.addButton("hornButton") 
    .setLabel("Horns")
    .setPosition(20, 40)
    .setSize(100, 30)
    .moveTo(g4)
    ;

  cp5.addButton("antennaButton") 
    .setLabel("Antenna")
    .setPosition(20, 80)
    .setSize(100, 30)
    .moveTo(g4)
    ;

  // add g1, g2, and g3 to the accordion.

  accordion = cp5.addAccordion("acc")
    .setPosition(40, 40)
    .setWidth(200)
    .setHeight (100)
    .addItem(g1)
    .addItem(g2)
    .addItem(g3)
    .addItem(g4)
    ;

  accordion.open(0, 1, 2, 3);

  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);
}


void addClearButton() { //button for clearing display (makes all body parts false)

  cp5.addButton("clearButton")
    .setBroadcast(false)
    .setLabel("Clear")
    .setValue(0)
    .setPosition(900, 700)
    .setSize(200, 40)
    .setBroadcast(true);
}


void drawMonsterBody1() {
  pushMatrix();
  beginShape();
  fill(c);
  noStroke();
  strokeWeight(3);
  vertex(795, 471);//starting point
  bezierVertex(832, 353, 794, 298, 865, 235);  //top curve
  bezierVertex(947, 173, 1003, 253, 1019, 276);  
  bezierVertex(1047, 335, 1013, 471, 1090, 498);
  bezierVertex(1112, 510, 1101, 538, 1055, 517);
  bezierVertex(1053, 518, 1040, 500, 1048, 536);
  bezierVertex(1055, 549, 1032, 563, 992, 535);
  bezierVertex(963, 525, 949, 543, 940, 554);
  bezierVertex(913, 568, 907, 539, 869, 532);
  bezierVertex(835, 537, 823, 561, 801, 540);
  bezierVertex(801, 515, 821, 513, 774, 522);
  bezierVertex(741, 529, 743, 502, 777, 489);
  bezierVertex(783, 488, 794, 478, 795, 471);
  endShape();
  popMatrix();
}

void drawMonsterBody2() {
  pushMatrix();
  translate(0, 30);
  beginShape();
  fill(c);
  noStroke();
  vertex(758, 451);
  bezierVertex(731, 402, 788, 287, 817, 322);
  bezierVertex(815, 281, 833, 181, 913, 189);
  bezierVertex(913, 190, 906, 179, 913, 167);
  bezierVertex(919, 168, 930, 184, 928, 178);
  bezierVertex(939, 177, 945, 172, 947, 172);
  bezierVertex(950, 180, 945, 178, 943, 187);
  bezierVertex(955, 191, 1022, 195, 1035, 327);
  bezierVertex(1062, 273, 1139, 466, 1066, 464);
  bezierVertex(1000, 468, 1071, 391, 1033, 364);
  bezierVertex(1027, 415, 1014, 520, 989, 512);
  bezierVertex(909, 523, 976, 466, 917, 457);
  bezierVertex(862, 471, 899, 524, 837, 505);
  bezierVertex(809, 509, 820, 446, 814, 368);
  bezierVertex(773, 410, 841, 488, 758, 451);
  endShape();
  popMatrix();
}

void drawEye1() {
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 320, 90, 105);
  fill(0);
  ellipse(928, 321, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 310, 20, 20);
}

void drawEye2() {
  pushMatrix();
  scale(.6);
  translate(550, 180);
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 340, 90, 110);
  fill(0);
  ellipse(928, 341, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 330, 20, 20);

  scale(1);
  translate(130, 0);
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 340, 90, 110);
  fill(0);
  ellipse(928, 341, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 330, 20, 20);
  popMatrix();
}


void drawEye3() {
  pushMatrix();
  scale(.5);
  translate(823, 280);
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 370, 97, 110);
  fill(0);
  ellipse(928, 371, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 360, 20, 20);

  scale(1);
  translate(100, -50);
  fill(255, 255, 255);
  noStroke();  
  ellipse(928, 370, 97, 110);
  fill(0);
  ellipse(928, 371, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 360, 20, 20);

  scale(1);
  translate(100, 50);
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 370, 97, 110);
  fill(0);
  ellipse(928, 371, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 360, 20, 20);
  popMatrix();
}

void drawEye4() {
  pushMatrix();
  scale(.5);
  translate(823, 280);
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 330, 97, 110);
  fill(0);
  ellipse(928, 331, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 320, 20, 20);

  scale(1);
  translate(100, -50);
  fill(255, 255, 255);
  noStroke();  
  ellipse(928, 330, 97, 110);
  fill(0);
  ellipse(928, 331, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 320, 20, 20);

  scale(1);
  translate(100, 50);
  fill(255, 255, 255);
  noStroke();
  ellipse(928, 330, 97, 110);
  fill(0);
  ellipse(928, 331, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 320, 20, 20);

  scale(1);
  translate(-100, 70);
  fill(255, 255, 255);
  noStroke();  
  ellipse(928, 330, 97, 110);
  fill(0);
  ellipse(928, 331, 45, 45);  
  fill(255, 255, 255);
  ellipse(940, 320, 20, 20);

  popMatrix();
}

void drawTeeth() {

  fill(255, 255, 255);
  stroke(255, 255, 255);
  beginShape();
  vertex(890, 389);
  vertex(911, 395);
  vertex(898, 411);
  vertex(911, 395);
  vertex(898, 411);
  vertex(890, 389);
  endShape();

  pushMatrix();
  translate(1849, 1);
  scale(-1, 1);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  beginShape();
  vertex(890, 389);
  vertex(911, 395);
  vertex(898, 411);
  vertex(911, 395);
  vertex(898, 411);
  vertex(890, 389);
  endShape();
  popMatrix();
}

void drawSmile() {
  noStroke();
  fill(#8B1F1F);
  beginShape();
  vertex(870, 380);
  bezierVertex(897, 395, 953, 400, 980, 380);
  bezierVertex(977, 447, 878, 448, 870, 380);
  endShape();
}

void drawHorns() {

  noStroke();
  fill(0);
  beginShape(); //left horn
  vertex(857, 242);
  bezierVertex(811, 233, 842, 175, 851, 175);
  bezierVertex(845, 182, 852, 221, 876, 227);
  endShape();

  pushMatrix();
  fill(0);
  translate(1849, 1);
  scale(-1, 1);
  beginShape(); //left horn
  vertex(857, 242);
  bezierVertex(811, 233, 842, 175, 851, 175);
  bezierVertex(845, 182, 852, 221, 876, 227);
  endShape();
  popMatrix();
}

void drawAntenna() {
  noStroke();
  pushMatrix();
  translate(0, 5);
  fill(0);
  beginShape();
  vertex(857, 238);
  bezierVertex(840, 212, 859, 187, 851, 172);
  bezierVertex(814, 155, 871, 136, 858, 169);
  bezierVertex(858, 185, 851, 214, 865, 233);
  endShape();
  popMatrix();

  pushMatrix();
  fill(0);
  translate(1849, 5);
  scale(-1, 1);
  beginShape();
  vertex(857, 238);
  bezierVertex(840, 212, 859, 187, 851, 172);
  bezierVertex(814, 155, 871, 136, 858, 169);
  bezierVertex(858, 185, 851, 214, 865, 233);
  endShape();
  popMatrix();
}


void keyPressed() { // saves image to the processing file and makes the script stop running
  saveFrame("myimage.png");
}

// don't need the following...


void addButtons () {
  cp5.addButton("drawMonsterBody1")
    .setBroadcast(false)
    .setLabel("Monster 1")
    .setValue(0)
    .setPosition(20, 100)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawEye1")
    .setBroadcast(false)
    .setLabel("Eye 1")
    .setValue(0)
    .setPosition(20, 160)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawEye2")
    .setBroadcast(false)
    .setLabel("Eye 2")
    .setValue(0)
    .setPosition(20, 200)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawEye3")
    .setBroadcast(false)
    .setLabel("Eye 3")
    .setValue(0)
    .setPosition(20, 240)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawEye4")
    .setBroadcast(false)
    .setLabel("Eye 4")
    .setValue(0)
    .setPosition(20, 280)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawSmile")
    .setBroadcast(false)
    .setLabel("Smile")
    .setValue(0)
    .setPosition(20, 340)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("save")
    .setBroadcast(false)
    .setLabel("Save")
    .setValue(0)
    .setPosition(20, 600)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawHorns")
    .setBroadcast(false)
    .setLabel("Horns")
    .setValue(0)
    .setPosition(20, 600)
    .setSize(100, 30)
    .setBroadcast(true);

  cp5.addButton("drawTeeth")
    .setBroadcast(false)
    .setLabel("Teeth")
    .setValue(0)
    .setPosition(20, 600)
    .setSize(100, 30)
    .setBroadcast(true);
}