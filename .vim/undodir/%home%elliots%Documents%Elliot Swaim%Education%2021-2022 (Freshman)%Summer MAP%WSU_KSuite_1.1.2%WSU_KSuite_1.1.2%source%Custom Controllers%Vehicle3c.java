Vim�UnDo� <�1�=�g�ɖ��d�)����?h�˖�   5           return 90.0 / x;            >   2   >   >   1    b�h�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             b�z�     �         ,              �         +    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�{-     �                        double distance1 =5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        b�{1     �      $   ,    �         ,    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        b�{2     �         4    5�_�                            ����                                                                                                                                                                                                                                                                                                                                      $          V       b�{H     �   #   %          ;                              getLightBrightness(6)) / 4.0;�   "   $          5                              getLightBrightness(5) +�   !   #          5                              getLightBrightness(4) +�       "          5        double brightness2 = (getLightBrightness(3) +�      !          ;                              getLightBrightness(2)) / 4.0;�                 5                              getLightBrightness(1) +�                5                              getLightBrightness(0) +�                5        double brightness1 = (getLightBrightness(7) +5�_�                            ����                                                                                                                                                                                                                                                                                                                                      $          V       b�{\     �   #   %          9                              getLightdistance(6)) / 4.0;�   "   $          3                              getLightdistance(5) +�   !   #          3                              getLightdistance(4) +�       "          1        double distance2 = (getLightdistance(3) +�      !          9                              getLightdistance(2)) / 4.0;�                 3                              getLightdistance(1) +�                3                              getLightdistance(0) +�                1        double distance1 = (getLightdistance(7) +5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                      $          V       b�{`     �   !   #   5      .                              getDistance(4) +5�_�      	              #       ����                                                                                                                                                                                                                                                                                                                                      $          V       b�{b     �   "   $          .                              getDistance(5) +5�_�      
           	   $       ����                                                                                                                                                                                                                                                                                                                                      $          V       b�{d     �   #   %          4                              getDistance(6)) / 4.0;5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                 V       b�{f     �      !          .                              getDistance(0) +   .                              getDistance(1) +   4                              getDistance(2)) / 4.0;5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                 V       b�{i     �      !   5                       getDistance(0) +                    getDistance(1) +   &                getDistance(2)) / 4.0;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       b�{k     �          5      $                    getDistance(0) +   $                    getDistance(1) +5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       b�{o     �      !   5      *                    getDistance(2)) / 4.0;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       b�{q    �      !   5      (                        getDistance(0) +   (                        getDistance(1) +   .                        getDistance(2)) / 4.0;5�_�                    '   8    ����                                                                                                                                                                                                                                                                                                                                                 V       b�{|     �   &   (   5      :        double motor1Speed = motorActivation(brightness1);5�_�                    (   8    ����                                                                                                                                                                                                                                                                                                                                                 V       b�{�    �   '   )   5      :        double motor2Speed = motorActivation(brightness2);5�_�                    '   C    ����                                                                                                                                                                                                                                                                                                                                                 V       b�{�     �   &   (   5      F        double motor1Speed = motorActivation(brightness1 + distance1);5�_�                    (   C    ����                                                                                                                                                                                                                                                                                                                                                 V       b�{�    �   '   )   5      F        double motor2Speed = motorActivation(brightness2 + distance2);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       b�{�     �         5      	public Vehicle3a () 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       b�{�    �         5      1public class Vehicle3a extends VehicleController{5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       b�{�    �   #   %          2                            getDistance(6)) / 4.0;�   "   $          ,                            getDistance(5) +�   !   #          ,                            getDistance(4) +�       "          ,        double distance2 = (getDistance(3) +�      !          2                            getDistance(2)) / 4.0;�                 ,                            getDistance(1) +�                ,                            getDistance(0) +�                ,        double distance1 = (getDistance(7) +5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�W     �         5              return 12 / x;5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�W     �         5              return 2 / x;5�_�                    '   8    ����                                                                                                                                                                                                                                                                                                                                                             b�^     �   &   (   5      F        double motor1Speed = motorActivation(brightness1 + distance2);5�_�                    (   8    ����                                                                                                                                                                                                                                                                                                                                                             b�b   	 �   '   )   5      F        double motor2Speed = motorActivation(brightness2 + distance1);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�g�     �         5              return 9 / x;5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                             b�g�     �         5              return 90.0 / x;5�_�       "           !   '   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�g�     �   &   (   5      M        double motor1Speed = motorActivation(brightness1 / 10.0 + distance2);5�_�   !   #           "   '   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�g�     �   &   (   5      L        double motor1Speed = motorActivation(brightness1 / 0.0 + distance2);5�_�   "   $           #   (   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�g�     �   '   )   5      M        double motor2Speed = motorActivation(brightness2 / 10.0 + distance1);5�_�   #   %           $   (   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�g�   
 �   '   )   5      L        double motor2Speed = motorActivation(brightness2 / 0.0 + distance1);5�_�   $   &           %   '   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�g�     �   &   (   5      L        double motor1Speed = motorActivation(brightness1 / 6.0 + distance2);5�_�   %   '           &   (   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�g�    �   '   )   5      L        double motor2Speed = motorActivation(brightness2 / 6.0 + distance1);5�_�   &   (           '   (   <    ����                                                                                                                                                                                                                                                                                                                                                             b�h     �   '   )   5      M        double motor2Speed = motorActivation(brightness2 / 12.0 + distance1);5�_�   '   )           (   '   <    ����                                                                                                                                                                                                                                                                                                                                                             b�h    �   &   (   5      M        double motor1Speed = motorActivation(brightness1 / 12.0 + distance2);5�_�   (   *           )   '   <    ����                                                                                                                                                                                                                                                                                                                                                             b�h     �   &   (   5      M        double motor1Speed = motorActivation(brightness1 / 19.0 + distance2);5�_�   )   +           *   (   <    ����                                                                                                                                                                                                                                                                                                                                                             b�h    �   '   )   5      M        double motor2Speed = motorActivation(brightness2 / 19.0 + distance1);5�_�   *   ,           +   '   K    ����                                                                                                                                                                                                                                                                                                                                                             b�h$     �   &   (   5      M        double motor1Speed = motorActivation(brightness1 / 10.0 + distance2);5�_�   +   -           ,   (   K    ����                                                                                                                                                                                                                                                                                                                                                             b�h(    �   '   )   5      M        double motor2Speed = motorActivation(brightness2 / 10.0 + distance1);5�_�   ,   .           -   (   N    ����                                                                                                                                                                                                                                                                                                                                                             b�h;     �   '   )   5      S        double motor2Speed = motorActivation(brightness2 / 10.0 + distance1 / 2.0);5�_�   -   /           .   '   N    ����                                                                                                                                                                                                                                                                                                                                                             b�h=    �   &   (   5      S        double motor1Speed = motorActivation(brightness1 / 10.0 + distance2 / 2.0);5�_�   .   0           /   '   N    ����                                                                                                                                                                                                                                                                                                                                                             b�h^     �   &   (   5      T        double motor1Speed = motorActivation(brightness1 / 10.0 + distance2 / 10.0);5�_�   /   1           0   '   K    ����                                                                                                                                                                                                                                                                                                                                                             b�ha     �   &   (   5      S        double motor1Speed = motorActivation(brightness1 / 10.0 + distance2 / 0.0);5�_�   0   2           1   (   K    ����                                                                                                                                                                                                                                                                                                                                                             b�hc    �   '   )   5      T        double motor2Speed = motorActivation(brightness2 / 10.0 + distance1 / 10.0);5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �         5              return 90.0 / x;5�_�   2   4           3   '   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   &   (   5      L        double motor1Speed = motorActivation(brightness1/ 10.0 + distance2);5�_�   3   5           4   '   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   &   (   5      J        double motor1Speed = motorActivation(brightness110.0 + distance2);5�_�   4   6           5   '   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   &   (   5      H        double motor1Speed = motorActivation(brightness1.0 + distance2);5�_�   5   7           6   '   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   &   (   5      G        double motor1Speed = motorActivation(brightness10 + distance2);5�_�   6   8           7   '   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   &   (   5      F        double motor1Speed = motorActivation(brightness1 + distance2);5�_�   7   9           8   (   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   '   )   5      L        double motor2Speed = motorActivation(brightness2/ 10.0 + distance1);5�_�   8   :           9   (   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   '   )   5      J        double motor2Speed = motorActivation(brightness210.0 + distance1);5�_�   9   ;           :   (   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   '   )   5      H        double motor2Speed = motorActivation(brightness2.0 + distance1);5�_�   :   <           ;   (   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�     �   '   )   5      G        double motor2Speed = motorActivation(brightness20 + distance1);5�_�   ;   =           <   (   8    ����                                                                                                                                                                                                                                                                                                                                                             b�h�    �   '   )   5      F        double motor2Speed = motorActivation(brightness2 + distance1);5�_�   <   >           =          ����                                                                                                                                                                                                                                                                                                                                                             b�h�    �         5              return 100.0 / x;5�_�   =               >          ����                                                                                                                                                                                                                                                                                                                                                             b�i    �         5              return 200.0 / x;5�_�                   (   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�     �   '   )   5      L        double motor2Speed = motorActivation(brightness2 / 0.0 + distance1);5�_�                    (   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�     �   '   )   5      L        double motor2Speed = motorActivation(brightness2 / 4.0 + distance1);5�_�                    '   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�     �   &   (   5      L        double motor1Speed = motorActivation(brightness1 / 0.0 + distance2);5�_�                     '   ;    ����                                                                                                                                                                                                                                                                                                                                                             b�    �   &   (   5      L        double motor1Speed = motorActivation(brightness1 / 4.0 + distance2);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       b�{n     �      "   5      .                        getDistance(2)) / 4.0;   0            double distance2 = (getDistance(3) +5��