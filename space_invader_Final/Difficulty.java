import java.math.*;

public class Difficulty {
      
  private Difficulty(){}
  
  public static float getSpeedY(int level) {
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
      default:
        return 1.0f;
    }
    
    return ((float) Math.random()) * (max - 1.0f) + 1.0f;
  }
}