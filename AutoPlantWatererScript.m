% Shivam Patel
% Plant Watering Main Project

clear all; close all;

% Create an arduino Object that connects to the Arduino board
a = arduino('COM5','Nano3');

%Initalize variables
finish = false;
lowerLim = 0;
upperLim = 100;
% Initialize Variables for the different states of the sensor (dry,
% slightly wet, wet)
dry = 77;
slightlyWet = 46;
wet = 46;

graph(lowerLim, upperLim);

%Variable to store time 
startTime = datetime('now');

% while loop to plot values onto live graph 
while ~finish

 % Get voltage value of moisture sensor
 voltage = readVoltage(a,'A1');

 moistureReading = moisture(voltage);

 % Gets time at present moment by subtracting the current time by the time
 % the code started executing
 time = datetime('now') - startTime;

 % Add points  
 addpoints(animLine,datenum(time),moistureReading);

 % Refresh X-axis limit to keep up with the increasing time value
 ax.XLim = datenum([time-seconds(15) time]);
 %Maintains x axis limits
 datetick('x','keeplimits');
 %updates figure
 drawnow;

 % Set the finish boolean to the button state of the button on D6 (true or false) 
 finish = readDigitalPin(a,'D6');
 
 % Check if button is pressed (button state is 1 or true)
 if finish
     writeDigitalPin(a, 'D2', 0);
     % Breaks out of while loop
     break; 
 end
 

 % State machine algorithm for moisture sensor
 if (moistureReading > dry)
     disp('Soil Is Dry So It Is Time To Water!');
     writeDigitalPin(a,'D2',1);

 elseif (moistureReading > slightlyWet)
     disp('Soil Is Still Dry So Keep Watering!');
     writeDigitalPin(a,'D2',1); 

 elseif (moistureReading <= wet)

     disp('Soil Is Wet So Stop Watering!');
     writeDigitalPin(a,'D2',0);
 else
     disp('Error In Code!');
 end

end

% Function to check moisture sensor state
function state = moisture(voltage)
    %y = mx+b
    state = 100/31 * (voltage) - 192; 
end

% Creates a Function to graph the values
function [animLine,ax] = graph(lowerLim, upperLim)
    % Make a figure
    figure;
    % Create Live Data Plot and set x and y axis lables and title for graph
    animLine = animatedline;
    ax = gca;
    ax.YGrid = 'on';
    %Y axis limits are 0 to 100 since the voltage reading ranges from 0 to 100
    ax.YLim = [lowerLim upperLim];
    title('Voltage of Moisture Sensor against Time');
    xlabel('Time [HH:MM:SS]');
    ylabel('Voltage [Volt]');

end