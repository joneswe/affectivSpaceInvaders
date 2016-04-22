import java.math.*;

public class Difficulty {
      
  private Difficulty(){}
  
  public static float getSpeedY(int level) {
    switch(level) {
      case 0:
        return 0.1f;
      case 1:
        return 0.12f;
      case 2:
        return 0.15f;
      case 3:
        return 0.18f;
      case 4:
        return 0.2f;
      case 5:
        return 0.22f;
      case 6:
        return 0.25f;
      default:
        return 0.1f;
    }
  }
  
  public static float getAlienScale(int level) {
    float max;
    switch(level) {
      case 0:
        return 1.0f;
      case 1:
        max = 1.3f;
        break;
      case 2:
        max = 1.5f;
        break;
      case 3:
        max = 1.7f;
        break;
      case 4:
        max = 1.9f;
        break;
      case 5:
        max = 2.1f;
        break;
      case 6:
        max = 2.5f;
        break;
      default:
        return 1.0f;
    }
    return ((float) Math.random()) * (max - 1.0f) + 1.0f;
  }
  
  
  public static int getAlienRowCount(int level) {
    switch(level) {
      case 0:
        return 5;
      case 1:
        return 6;
      case 2:
        return 6;
      case 3:
        return 6;
      case 4:
        return 7;
      case 5:
        return 8;
      case 6:
        return 9;
      default:
        return 5;
    }
  }
  
  public static int getBackgroundColor(int level) {
    return 1057849;
  }
}