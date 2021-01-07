PImage end1, end2, end3, glass;
float rotx, roty;
int y;
boolean increasing;

void setup() {
  size(450, 450, P3D);
  end1 = loadImage("side1.png"); //3 unique sides(instead of 6)
  end2 = loadImage("side2.png");
  end3 = loadImage("side3.png");
  glass = loadImage("glass.png");
  textureMode(NORMAL); //size
  y = 0;
  increasing = true;
}

void draw() {
  background(0);
  translate(width/2, height/2+y, 0); //the y makes it go up and down
 
  /** lines used to centre the cubes
  stroke(255); 
  strokeWeight(1);
  line(0, height/2, 0, width, height/2, 0); 
  line(width/2, 0, 0, width/2, height, 0); **/
  
  rotateX(rotx); 
  rotateY(roty);

  pushMatrix();
  rotateX(-frameCount/50.0);  //auto-rotates the cube
  rotateY(frameCount/50.0);
  texturedCube(-25, -25, -25, end1, end2, end3, 50); //is there a way to centre the cube automatically, like rectMode(CENTRE)? 
  popMatrix();

  pushMatrix();
  rotateX(frameCount/100.0);
  rotateY(-frameCount/75.0);
  rotateX(radians(45));
  rotateY(radians(45));
  texturedCube(-30, -30, -30, glass, 60); 
  popMatrix();

  pushMatrix();
  rotateX(frameCount/100.0);
  rotateY(frameCount/75.0);
  rotateX(radians(-45));
  rotateY(radians(45));
  texturedCube(-35, -35, -35, glass, 70);  //this is the outermost cube
  popMatrix();

  if (increasing) {
    y+=2;
  } else y-=2;

  if (abs(y) == 50) {
    increasing = !increasing; //super sharp turn, not sure how to make it more bouncy
  }
}

void texturedCube(float x, float y, float z, PImage texture, float size ) {
  pushMatrix();
  translate(x, y, z);
  scale(size); //size of img
  noStroke();

  beginShape(QUADS);
  texture(texture);

  //x, y, z, texture x, texture y
  vertex(0, 0, 0, 0, 0); //top
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  vertex(0, 1, 0, 0, 0); //bot
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  vertex(0, 0, 1, 0, 0); //F
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  vertex(0, 0, 0, 0, 0); //B
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  vertex(0, 0, 0, 0, 0); //L
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  vertex(1, 0, 0, 0, 0); //R
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();
}

void texturedCube(float x, float y, float z, PImage t1, PImage t2, PImage t3, float size ) {
  pushMatrix();
  translate(x, y, z);
  scale(size); //size of img
  noStroke();

  beginShape(QUADS);
  texture(t1);
  //x, y, z, texture x, texture y
  vertex(0, 0, 0, 0, 0); //top
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  vertex(0, 1, 0, 0, 0); //bot
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(t2);
  vertex(0, 0, 1, 0, 0); //F
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  vertex(0, 0, 0, 0, 0); //B
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(t3);
  vertex(0, 0, 0, 0, 0); //L
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  vertex(1, 0, 0, 0, 0); //R
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();

  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
