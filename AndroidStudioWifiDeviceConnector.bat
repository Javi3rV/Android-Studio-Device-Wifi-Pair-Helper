@echo off
echo.
echo. Let's try to connect your phone to android studio
echo.
echo. Press any key to continue
pause >nul
cd /D %LOCALAPPDATA%\Android\sdk\platform-tools >nul
timeout /t 1 /nobreak >nul
cls
echo.
echo. - In your phone, go to developer options and enable Wireless Debugging 
echo. - Go into wireless debugging screen, select pair using pairing code (NOT QR)
echo. - You will see an alert with "<ip>:<port>" values, and a pairing code
echo. - Then, press any key to continue
echo.
pause >nul
set /p ip=" Enter your <ip> value -> "
set /p port=" Enter your <port> value -> "
echo. Trying to connect...
adb pair %ip%:%port%
timeout /t 1 /nobreak >nul
echo.
echo. Press any key to exit
pause >nul