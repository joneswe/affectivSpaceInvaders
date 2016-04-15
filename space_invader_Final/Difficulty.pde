class Difficulty {
  
  private Difficulty(){}
  
  public float getSpeedY(int level) {
    switch(level) {
      case 0:
        return 0.1f;
      case 1:
        return 0.2f;
      case 2:
        return 0.3f;
      case 3:
        return 0.4f;
        
      default:
        return 0.1f;
    }
  }
  
  public float getAlienScale(int level) {
    switch(level) {
      case 0:
        return 1.0f;
      case 1:
        return random(1.2f);
      case 2:
        return random(1.3f);
      case 3:
        return random(1.5f);
        
      default:
        return 1.0f;
    }
  }
}