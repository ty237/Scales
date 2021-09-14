int size = 500;

public void setup() {
  size(500, 500);
  frameRate(10);
}

public void draw() {
  noLoop();
  noStroke();
  background(0, 0, 198);
  int resetValueX = -100;
  int recLength = 60;
  int recHeight = 70;
  int currentX = resetValueX;
  int currentY = size-recHeight;
  boolean offset = true;
  while(currentY > -1*recHeight) {
    if (offset) currentX += (recLength/2);
    while(currentX < size) {
      scale(currentX, currentY, offset, recHeight, recLength);
      currentX += recLength;
    }
    offset = offset ? false : true;
    currentX = resetValueX;
    currentY -= recHeight;
  }
  System.out.println("Finally! Its over.");
  currentY = 0;
  resetValueX = resetValueX+recLength/2;
  //Making the triangles on top
  text(mouseX, 20, 480);
  text(mouseY,40, 480);
}

public void scale(int currentX, int currentY, boolean offset, int recHeight, int recLength) {
   int randomColor = (int)(Math.random()*151)+100;
   if (offset) fill(randomColor, 0, 0);
   if (!offset) fill(0, 0, randomColor);
   rect(currentX, currentY, recLength, recHeight);
   currentY += recHeight;
   triangle(currentX, currentY, currentX+recLength, currentY, currentX + (recLength/2), currentY+(recHeight/2));
}
