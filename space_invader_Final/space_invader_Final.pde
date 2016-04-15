ArrayList<Alien> AlienList = new ArrayList();
ArrayList<Bullet> bulletList = new ArrayList();
ArrayList<Particle> blastList = new ArrayList();

ArrayList<Alien> deadAliens = new ArrayList<Alien>();
ArrayList<Bullet> deadBullets = new ArrayList<Bullet>();

float y, sx; 

float deltay=0.1; //speed of the invaders

int level=0;

boolean gamelost = false, gamewin = false;

boolean BERNDS_COOL_ROCKETBOOST = true;

/* Schwirigkietsstufen 0 - 7
*  Speed
*  andere Bewegungen der Aliens
*  mehr Aliens spawnen
*  zellteilung
*  kleinere Aliens
*  tarnmodus
*  Ablenkender Hintergrund
**/



void setup() {
  size(300, 500);
  AddAlien();
  y=height-50;
  sx = width/2;
  //---------------------------------------
}

void draw() {
  background(#102439); 
  if (startGame) {
    //------------------
    for (Alien a : AlienList)
      a.show();
    for (Bullet b : bulletList) {
      b.move();
      b.show();
    }
    //-------------------------
    //------------------------------
    for (int i=AlienList.size ()-1; i>=0; i--) {
      Alien A = AlienList.get(i);
      if (!gamelost)A.move();
      for (int j=bulletList.size ()-1; j>=0; j--) {
        Bullet B  =  bulletList.get(j);
        if ((sq(B.x-A.x)+sq(B.y-A.y))<sq(10)) { // check distance
          AlienList.remove(i);
          bulletList.remove(j); 
          for (int k=0; k<30; k++) {
            Particle P = new Particle(A.x+random(-30, 30), A.y+random(-30, 30), #68BF4B);
            blastList.add(P);
          }
        } else if (B.y<=1) bulletList.remove(j);
      }
      if (!deadBullets.isEmpty()) { 
        bulletList.removeAll(deadBullets);
        deadBullets.clear();
      }
      if (A.y>y+10) {
        gamelost = true;
      }
      if (!deadAliens.isEmpty()) {
        AlienList.removeAll(deadAliens);
        deadAliens.clear();
      }
      if (AlienList.size()<=0) {
        gamewin = true;
      }
    }
  } else startmenu();
  //--------------------------------------
  control();
  pushMatrix();
  translate(sx, y);
  ship();
  popMatrix();
  //--------------------------------------
  if (gamewin) {
    rectMode(CENTER);
    noStroke();
    fill(-1);
    rect(width/2, height/2, 200, 150, 5, 5, 5, 5);
    textAlign(CENTER);
    textSize(30);
    fill(#F50041);
    text("You Won !", width/2, height/2);
    fill(-1);
    rect(width/2, height/2 + 55, 200, 25);
    fill(0);
    textSize(15);
    text("Game will restart in " + int((500-timer)/60), width/2, height/2 + 60);
    timer++;
    if (timer>500) { // timer
      gameReset();
      timer=0;
      gamewin=false;
      level++;
      deltay+=5/100.0;
    }
  }
  if (gamelost) {
    rectMode(CENTER);
    noStroke();
    fill(-1);
    rect(width/2, height/2, 200, 150, 5, 5, 5, 5);
    textAlign(CENTER);
    textSize(30);
    fill(#F50041);
    text("Game Over", width/2, height/2);
    fill(-1);
    rect(width/2, height/2 + 55, 200, 25);
    fill(0);
    textSize(15);
    text("You Lost", width/2, height/2 + 35);
    textSize(15);
    text("Game will restart in " + int((500-timer)/60), width/2, height/2 + 60);
    timer++;
    if (timer>500) { // timer 
      gameReset();
      timer=0;
      gamelost=false;
    }
  }
}





void ship() {
  if(BERNDS_COOL_ROCKETBOOST){
  fill(#4DFFFD,120);
  ellipse(0,20,12,sin(2*PI/20.*frameCount)*10+10);
  fill(#4DFFFD,120);
  ellipse(0,20,5,sin(2*PI/10.*frameCount+2)*10+10);
  fill(#4DFFFD,120);
  }
  
  ellipse(0,14,12,12);
  fill(#ffedbc);
  noStroke();
  beginShape();
  vertex(0, 0);
  vertex(10, 20);
  vertex(0, 15);
  vertex(-10, 20);
  vertex(0, 0);
  endShape();
}



//------------  Add Aliens on the Screen ------ 

void AddAlien() {
  for (int i=0; i<10; i++) {
    for (int j=0; j<5; j++) {
      Alien F =  new Alien(i*width/10+20, j*40+10);
      AlienList.add(F);
    }
  }
}


int timer=0;
void gameReset() {
  bulletList.clear();
  AlienList.clear();
  AddAlien();
}

//--------------Key Control -----------------

boolean keyright = false;
boolean keyleft = false;
boolean hit = false;

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true;
  }
  if (key == ' ') hit= true;
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false;
  }
  if (key == ' ') hit= false;
}


void control() {
  if (keyleft) {
    if (sx<=0)sx=0;
    else sx-=1.5;
  }
  if (keyright) {
    if (sx>=width)sx=width;
    else sx+=1.5;
  }
  if (hit) {
    Bullet B = new Bullet(sx, y-30);
    bulletList.add(B); 
    hit=false;
  }

  for (int i=0; i<blastList.size (); i++) {
    Particle P = blastList.get(i);
    P.display();
    P.move();
    if (P.r<0)blastList.remove(i);
  }
}