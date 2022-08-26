Vim�UnDo� ��z7�����)6�PM`X��W�[���pP����s   )                 J       J   J   J    b�i�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             b�@�     �         �       �         �    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�AM     �                import VehicleController;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�AQ     �                0import edu.wsu.KheperaSimulator.KSGripperStates;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�AR     �                 0import edu.wsu.KheperaSimulator.RobotController;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�AT     �          �      1import edu.wsu.KheperaSimulator.RobotCoordinates;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�AT    �          �      !import edu.wsu.KheperaSimulator.;5�_�                       '    ����                                                                                                                                                                                                                                                                                                                                                             b�A�     �         �      7public class VehicleController extends RobotController{5�_�      	                 '    ����                                                                                                                                                                                                                                                                                                                                                             b�A�     �         �      (public class VehicleController extends {5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                      
   7       V   7    b�A�     �                    private double bounceAngle;       private boolean bouncing;       private boolean nearWall;   @    private double[][] foodSources; // Array of {x, y, strength}5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �         �      9public class VehicleController extends VehicleController{5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �         �      'public class extends VehicleController{5�_�                           ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �         �      	public VehicleController() 5�_�                           ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �         �      	public () 5�_�                           ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �         �      	public Vehicle1() 5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �      	                  bouncing = false;5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �      	                  nearWall = false;5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                         7       V   7    b�A�     �      	          :        foodSources = new double[][]{ {300, 200, 50000} };5�_�                            ����                                                                                                                                                                                                                                                                                                                                      l           V       b�A�     �   
          b   #    int[] getLeftWheelPos(int dist)       {   '        double angle = getRobotAngle();       $        int x = getRobotXPosition();   $        int y = getRobotYPosition();              ;        // Rotate (0, -1) by the angle and add the position   8        int pos[] = {(int)( dist * Math.sin(angle)) + x,   :                     (int)(-dist * Math.cos(angle)) + y };           return pos;       }   $    int[] getRightWheelPos(int dist)       {   '        double angle = getRobotAngle();       $        int x = getRobotXPosition();   $        int y = getRobotYPosition();              <        // Rotate (0, 0.5) by the angle and add the position   8        int pos[] = {(int)(-dist * Math.sin(angle)) + x,   :                     (int)( dist * Math.cos(angle)) + y };           return pos;       }       ?    // Get the distance to the light source from a given sensor   ?    private double getLightDistance(int index) throws Exception       {           // Light Value is   U        // log_2(x/a) * 100 where x is the distance to the light, and a is a constant   .        double a = 1; // An arbitrary constant   ?        return (a * Math.pow(2, getLightValue(index) / 100.0));       }       ?    // Get the brightness of the light source at a given sensor   A    private double getLightBrightness(int index) throws Exception       {   4        double a = 1000; // Brightness at distance 1   8        return a / Math.pow(getLightDistance(index), 2);       }       -    // Get Strength of Smell from Food Source   2    // side: 0 for right sensor, 1 for left sensor   ,    // source: index of food source to smell   5    private double getFoodSmell(int side, int source)       {           int sensorPos[];           int eye_dist = 5;           if (side == 0) {   2            sensorPos = getLeftWheelPos(eye_dist);   	        }           else {   3            sensorPos = getRightWheelPos(eye_dist);   	        }   /        double foodPos[] = foodSources[source];       ?        double sqrDist = Math.pow(sensorPos[0]-foodPos[0], 2) +   >                         Math.pow(sensorPos[1]-foodPos[1], 2);       $        return foodPos[2] / sqrDist;       }           // Avoid Walls   #    private boolean bounceOffWall()       {   ,        double robotAngle = getRobotAngle();   3        double dAngle = (robotAngle - bounceAngle);   0        if (dAngle < 0 && -dAngle > bounceAngle)   "            dAngle += 2 * Math.PI;       $        if (dAngle < Math.PI - 0.01)   	        {   !            setMotorSpeeds(5,-5);               return false;   	        }           else return true;       }          "    private int getTotalDistance()       {           return Math.max(   $                getDistanceValue(0),                   Math.max(   (                    getDistanceValue(1),                       Math.max(   ,                        getDistanceValue(2),   !                        Math.max(   0                            getDistanceValue(3),   %                            Math.max(   4                                getDistanceValue(4),   )                                Math.max(   8                                    getDistanceValue(5),   -                                    Math.max(   <                                        getDistanceValue(6),   <                                        getDistanceValue(7))                   ))))));       }    5�_�                   4        ����                                                                                                                                                                                                                                                                                                                            4           G           V        b�A�    �   3   4          )    public void doWork() throws Exception   	{   )        double dist = getTotalDistance();       #        if (dist > 50 && !nearWall)   	        {   *            bounceAngle = getRobotAngle();               nearWall = true;   	        }               if (nearWall)   (            bouncing = !bounceOffWall();               if (!bouncing)               runVehicle();       2        if (!bouncing && getTotalDistance() <= 50)               nearWall = false;   	}    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �         7      =    private double motorActivation(double x) throws Exception5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�h�    �         7      5    double motorActivation(double x) throws Exception5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �         7      .    private void runVehicle() throws Exception5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�h�    �         7      &    void runVehicle() throws Exception5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                        double scale = 90;           double sigma = 4;           double mu = 7;   6        double denom = sigma * Math.sqrt(2 * Math.PI);   >        double exp = -1.0/2.0 * Math.pow((x - mu) / sigma, 2);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                        //return x;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                6        return scale * Math.pow(Math.E, exp) / denom; 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �         1              �         0    5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                *        brightness1 += getFoodSmell(0, 0);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                *        brightness2 += getFoodSmell(1, 0);5�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                 5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                        brightness1 /= 3;5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                        brightness2 /= 3;5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �                 5�_�   #   %           $      8    ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      :        double motor1Speed = motorActivation(brightness1);5�_�   $   &           %          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i
     �         +      5        double brightness1 = (getLightBrightness(7) +5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i
     �         +      )        double = (getLightBrightness(7) +5�_�   &   (           '           ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      5        double brightness2 = (getLightBrightness(3) +5�_�   '   )           (           ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      (getLightBrightness(3) +5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +          (getLightBrightness(3) +5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +               (getLightBrightness(3) +5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      $            (getLightBrightness(3) +5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      (                (getLightBrightness(3) +5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      ,                    (getLightBrightness(3) +5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      0                        (getLightBrightness(3) +5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      4                            (getLightBrightness(3) +5�_�   /   1           0      3    ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      ;                              getLightBrightness(2)) / 4.0;5�_�   0   2           1      3    ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �         +      3                              getLightBrightness(2)5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i     �                5                              getLightBrightness(0) +5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i      �         +      '                getLightBrightness(0) +5�_�   3   5           4          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i      �         +      +                    getLightBrightness(0) +5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i      �         +      /                        getLightBrightness(0) +5�_�   5   7           6          ����                                                                                                                                                                                                                                                                                                                                                  V        b�i#     �                5                              getLightBrightness(1) +5�_�   6   8           7           ����                                                                                                                                                                                                                                                                                                                                                V       b�i&     �                5                              getLightBrightness(2) +   5                              getLightBrightness(3) +   5                              getLightBrightness(4) +   5                              getLightBrightness(5) +   ;                              getLightBrightness(6)) / 4.0;5�_�   7   9           8      6    ����                                                                                                                                                                                                                                                                                                                                                V       b�i*     �         +      :                             getLightBrightness(6)) / 4.0;5�_�   8   :           9          ����                                                                                                                                                                                                                                                                                                                                                V       b�i/     �         +      :        double motor1Speed = motorActivation(brightness1);5�_�   9   ;           :          ����                                                                                                                                                                                                                                                                                                                                                V       b�i0     �                :        double motor2Speed = motorActivation(brightness2);5�_�   :   <           ;      6    ����                                                                                                                                                                                                                                                                                                                                                V       b�i3     �         *      9        double motorSpeed = motorActivation(brightness1);5�_�   ;   =           <   !       ����                                                                                                                                                                                                                                                                                                                                                V       b�i6     �       !          Y        motor2Speed = motor2Speed < -9.0 ? -9.0 : motor2Speed > 9.0 ? 9.0 : motor2Speed; 5�_�   <   >           =           ����                                                                                                                                                                                                                                                                                                                                                V       b�i8     �      !   )      Y        motor1Speed = motor1Speed < -9.0 ? -9.0 : motor2Speed > 9.0 ? 9.0 : motor1Speed; 5�_�   =   ?           >           ����                                                                                                                                                                                                                                                                                                                                                V       b�i:     �      !   )      X        motorSpeed = motor1Speed < -9.0 ? -9.0 : motor2Speed > 9.0 ? 9.0 : motor1Speed; 5�_�   >   @           ?       5    ����                                                                                                                                                                                                                                                                                                                                                V       b�i<     �      !   )      W        motorSpeed = motorSpeed < -9.0 ? -9.0 : motor2Speed > 9.0 ? 9.0 : motor1Speed; 5�_�   ?   A           @       N    ����                                                                                                                                                                                                                                                                                                                                                V       b�i@     �      !   )      V        motorSpeed = motorSpeed < -9.0 ? -9.0 : motorSpeed > 9.0 ? 9.0 : motor1Speed; 5�_�   @   B           A   #   2    ����                                                                                                                                                                                                                                                                                                                                                V       b�iE     �   "   $   )      ;        setMotorSpeeds((int)motor2Speed, (int)motor1Speed);5�_�   A   C           B   #   2    ����                                                                                                                                                                                                                                                                                                                                                V       b�iG     �   "   $   )      :        setMotorSpeeds((int)motor2Speed, (int)moto1Speed);5�_�   B   D           C   #   2    ����                                                                                                                                                                                                                                                                                                                                                V       b�iG     �   "   $   )      9        setMotorSpeeds((int)motor2Speed, (int)motoSpeed);5�_�   C   E           D   #   2    ����                                                                                                                                                                                                                                                                                                                                                V       b�iI     �   "   $   )      9        setMotorSpeeds((int)motor2Speed, (int)motoipeed);5�_�   D   F           E   #   2    ����                                                                                                                                                                                                                                                                                                                                                V       b�iJ     �   "   $   )      9        setMotorSpeeds((int)motor2Speed, (int)motohpeed);5�_�   E   G           F   #   !    ����                                                                                                                                                                                                                                                                                                                                                V       b�iS    �   "   $   )      :        setMotorSpeeds((int)motor2Speed, (int)motorSpeed);5�_�   F   H           G      !    ����                                                                                                                                                                                                                                                                                                                                                V       b�i�     �         *              �         )    5�_�   G   I           H          ����                                                                                                                                                                                                                                                                                                                                                V       b�i�   	 �         *              brightness += 5�_�   H   J           I      $    ����                                                                                                                                                                                                                                                                                                                                                V       b�i�   
 �         *      &        brightness += getFoodSmell(0);5�_�   I               J          ����                                                                                                                                                                                                                                                                                                                                                V       b�i�    �                )        brightness += getFoodSmell(0, 0);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        b�h�     �              5�_�                    3        ����                                                                                                                                                                                                                                                                                                                                                 V       b�A�     �   2   5        5��