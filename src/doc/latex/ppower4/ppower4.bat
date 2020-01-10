@ECHO OFF
REM PPower4 batch file
REM 
REM You must define path for pp4p.jar and name of the java or jre command
REM Here the settings for the Sun Java Runtime Environment on my machine
REM NOTE: This requires Java 1.2.x!
REM 
set basedir="C:\Program Files\JavaSoft\jre\1.2\lib"
set javacommand="C:\Program Files\JavaSoft\jre\1.2\bin\jre"
REM 
%javacommand% -jar %basedir%\pp4p.jar %1 %2 %3 %4 %5
