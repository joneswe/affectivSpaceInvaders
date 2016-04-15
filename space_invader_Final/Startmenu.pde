boolean startGame =false;

void startmenu() {
  pushStyle();
  fill(-1);
  noStroke();
  rectMode(CENTER);
  rect(width/2, height/2, 350, 150, 10, 10, 10, 10);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Space Invaders", width/2, height/2-40);
  textSize(15);
  fill(#FF4D4D);
  rect(width/2, height/2, 100, 30, 10, 10, 10, 10);
  fill(-1);
  textSize(12);
  text("BEGIN", width/2, height/2+5);
  fill(0);
  textSize(10);
  popStyle();
  if (mousePressed && dist(mouseX, mouseY, width/2, height/2)<50)
    startGame = true;
}