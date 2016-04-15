//---- Alien Class ----------
class Alien {
  float x, y; 
  Alien(float x, float y) {
    this.x = x; 
    this.y = y;
  }

  void show() {
    noStroke();
    fill(#68BF4B);
    ellipse(x, y, 10, 10);
  }

  void move() {
    y+=deltay;
  }
}