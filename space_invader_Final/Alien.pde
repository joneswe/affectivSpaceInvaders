//---- Alien Class ----------
class Alien {
  float x, y; 
  
  Alien(float x, float y) {
    this.x = x; 
    this.y = y;
  }

  void show(int level) {
    noStroke();
    fill(#68BF4B);
    ellipse(x, y, 10/Difficulty.getInstance().getAlienScale(level), 10/Difficulty.getInstance().getAlienScale(level));
  }

  void move(int level) {
    y += Difficulty.getInstance().getSpeedY(level);
  }
}