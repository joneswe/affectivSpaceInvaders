//---- Alien Class ----------
class Alien {
  float x, y;
  float scale;
  
  Alien(float x, float y, int level) {
    this.x = x; 
    this.y = y;
    this.scale = Difficulty.getAlienScale(level);
  }

  void show() {
    noStroke();
    fill(#68BF4B);
    ellipse(x, y, 10/scale, 10/scale);
  }

  void move(int level) {
    y += Difficulty.getSpeedY(level);
  }
}