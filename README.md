# Auto Plant Waterer
 Create a system that automatically waters a plant depending on how dry the soil is too dry

The Grove Beginner Kit For Arduino was used for this project. Parts needed are: 
- CJQ4435 MOSFET Grove Board
- Grove Capacitive Moisture Sensor
- 2 Grove Cables
- 9 volt battery 
- 12 volt DC Water Pump
- Water Tube

Instructions:
1. First connect the Arduino board to the laptop/PC that has MATLAB on it and then open up the MATLAB script in this repository

2. Change the Com Port to the one that the Arduino board is connected to on the script

3. Make one of the grove cables a crossover cable and then plug one end into the moisture sensor and the other into the A0 pin on the Arduino grove board

4. Connect the other grove cable to the MOSFET board and the D2 pin on the Arduino grove board 

5. Connect the side of the MOSFET board which has a positive and negative on it to the 9 volt battery and connect the side that has GND and Out to the pump 

6. Attach the water tube to the tube connector spot on the pump

7. Put the pump into a place that contains water (a glass of water for example) and stick the moisture sensor into the plant

8. Run the script on MATLAB