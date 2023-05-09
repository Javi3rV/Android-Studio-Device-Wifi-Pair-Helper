@echo off
echo.
echo. Let's try to connect your phone to android studio
pause
cd /D %LOCALAPPDATA%\Android\sdk\platform-tools
set /p ans=" Is your phone already paired with %computername%? (Y/N): "
if "%ans%"=="Y" goto paired
if "%ans%"=="y" goto paired
if "%ans%"=="N" goto pair
if "%ans%"=="n" goto pair
:pair
timeout /t 1 /nobreak >nul
echo.
echo. - In your phone, go to developer options and enable Wireless Debugging 
echo. - Go into wireless debugging screen, select pair using pairing code (NOT QR)
echo. - You will see an alert with "<ip>:<port>" values, and a pairing code
echo. - Then, press any key to continue
echo.
pause
set /p ip=" Enter your <ip> value> "
set /p port=" Enter your <port> value> "
echo. pairing...
adb pair %ip%:%port%
timeout /t 1 /nobreak >nul
echo.
echo. Now go to wireless debugging main screen, there is another "<ip>:<port>" 
echo. with same ip, but different port.
set /p secondPort=" Enter port value> "
adb connect %ip%:%secondPort%
pause
exit

:paired
set /p ip=" Enter your <ip> value> "
set /p port=" Enter your <port> value> "
echo. connecting...
adb pair %ip%:%port%
timeout /t 1 /nobreak >nul
echo.
pause
exit

timeout /t 1 /nobreak >nul
echo.
echo. Press any key to exit
pause