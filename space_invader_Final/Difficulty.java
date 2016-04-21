import java.math.*;

public class Difficulty {
      
  private Difficulty(){}
  
  public static float getSpeedY(int level) {
    switch(level) {
      case 0:
        return 0.1f;
      case 1:
        return 0.15f;
      case 2:
        return 0.2f;
      case 3:
        return 0.25f;
      case 4:
        return 0.27f;
      case 5:
        return 0.28f;
      case 6:
        return 0.3f;
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
        max = 1.2f;
        break;
      case 2:
        max = 1.3f;
        break;
      case 3:
        max = 1.5f;
        break;
      case 4:
        max = 1.7f;
        break;
      case 5:
        max = 1.8f;
        break;
      case 6:
        max = 2.0f;
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
        return 7;
      case 3:
        return 8;
      case 4:
        return 9;
      case 5:
        return 10;
      case 6:
        return 11;
      default:
        return 5;
    }
  }
}