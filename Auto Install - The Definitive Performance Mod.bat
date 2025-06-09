::::
::
:: This little program is written in a very simple and easy to read way so that most people can understand exactly what each line does. Have fun!
::
:: This was made by me, ru-bem. Please make sure you have downloaded this from Nexus Mods or Github.
:: https://www.nexusmods.com/clairobscurexpedition33/mods/308
:: https://github.com/ru-bem/COExp33-The-Definitive-Performance-Mod
::
::::


:: This lines tells the cmd to show you only the necessary, sets the mod version, window size, page code and the title.
@echo off
setlocal EnableDelayedExpansion
set modver=v1.2.0
mode con:cols=66 lines=33
chcp 65001 >nul
title COExp 33: The Definitive Performance Mod - %modver%
::


:: These lines below sets the colors used for the interface.
set blf=[30m
set blb=[40m
set fr=[31m
set fg=[32m
set fw=[97m
set eg=[90m
set fob=[48;2;038;030;019m
set fob2=[48;2;026;020;013m
set fob3=[48;2;018;014;009m
set fo0=[38;2;038;030;013m
set fo1=[38;2;204;160;102m
set fo2=[38;2;255;200;128m
set fo3=[38;2;255;216;166m
set fo4=[38;2;255;233;204m
set fo5=[38;2;255;249;242m
::


:: Folder names to make it easy when some update is needed.
set lossless=1_Lossless
set quality=2_Quality
set balanced=3_Balanced
set performance=4_Performance
set potato=5_Potato
set monstrosity=6_Monstrosity


:: Shows a loading message on screen. You'll only see this if you use a very, very, very slow pc.
echo: & echo ::: COExp33 - The Definitive Performance Mod :::
echo: & echo     Loading...
::


:: This sets the default config folder for Exp33.
set "e33win=%Localappdata%\Sandfall\Saved\Config\Windows"
set "e33xbox=%Localappdata%\Sandfall\Saved\Config\WinGDK"
::


:: Check if the game and it's version is installed and the version.
if exist %e33win% set cfglocal=!e33win!
if exist %e33xbox% set cfglocal=!e33xbox!
if not defined cfglocal goto notinstalled
::


:: Default messages
set errormessage=Something went wrong. Try installing it manually.

:: Check if the user have extracted all the files.
set extracted=yes
if not exist "%~dp0%lossless%"    (set extracted=no)
if not exist "%~dp0%quality%"     (set extracted=no)
if not exist "%~dp0%balanced%"     (set extracted=no)
if not exist "%~dp0%performance%" (set extracted=no)
if not exist "%~dp0%potato%"      (set extracted=no)
if not exist "%~dp0%monstrosity%" (set extracted=no)
if %extracted%==no (goto notextracted) else (goto menu)
::


:: If the user hasn't extracted the files then goto here.
:notextracted
cls
call :header
echo %fo1%   Hey, you're almost there but %fr%some files are missing.%fo1%
echo    All the mod files should exist inside the same folder.
echo:
echo:
echo    %fg%SOLUTION:
echo    Extract all the files to the same folder and this again ;^)
echo:
echo:
echo    %fw%Press any key to exit.
pause >nul
exit
::


:: This will open if the game is not installed.
:notinstalled
cls
call :header
echo   %fr%The game is not installed.%fw%
echo   If it's installed, run the game once and try again.
echo:
echo:
echo   %fo1%Thank you for downloading the mod^! %fw%
echo:
echo:
echo   Press any key to close the mod menu...
pause >nul & exit



:: Here's the fancy menu with colors and everything.
:menu
cls
call :header
echo     %fo1%Type a number and press %fw%[ENTER]
echo:
echo:
echo     %fo1%[0]%fw% Default%fo0%::::: %fo1%Vanilla Engine.ini settings  -%fw%   0%% Boost
echo     %fo1%[1]%fw% Lossless%fo0%:::: %fo1%Almost identical to Vanilla  -%fw%  55%% Boost
echo     %fo1%[2]%fw% Quality%fo0%::::: %fo1%Pretty good visual quality   -%fw%  75%% Boost
echo     %fo1%[3]%fw% Balanced%fo0%:::: %fo1%Balanced quality and Perf    -%fw%  92%% Boost
echo     %fo1%[4]%fw% Performance%fo0%: %fo1%Trade visual for performance -%fw% 110%% Boost
echo     %fo1%[5]%fw% Potato%fo0%:::::: %fo1%For low end PCs              -%fw% 201%% Boost
echo     %fo1%[6]%fw% Monstrosity%fo0%: %fo1%For real, just don't do this -%fw% 259%% Boost
echo:
echo:
echo     %fo1%[7] IMPORTANT: USE THIS OPTIMIZED IN-GAME SETTINGS
echo:
echo:
echo     %fo1%[8]%fw% More details
echo     %fo1%[9]%fw% Exit
echo:
::

:: This allows you to make a choice.
set /p choice=%blf%----%fo1%[
::


:: Choice 1 will just delete any Engine.ini present on default Exp 33 config location.
if %choice%==0 (
	if exist "%cfglocal%\Engine.ini" (
		for %%G in (Engine.ini Scalability.ini) do (del /s /f /q "%cfglocal%\%%G")
		msg * "Default preset applied^!"
		goto menu
	) else (
		msg * "You are already using the default settings." & goto menu))
::


:: Choices 2-6 line by line:
:: robocopy will, you know, copy Engine.ini from the selected preset folder to the default Exp33 config location.
:: If everything works it will show you a message, if not, it will show you another message.
:: After that ATTRIB will set the file to read-only.
:: Return to menu.
if %choice%==1 (
	robocopy "%~dp0%lossless%\\" "%cfglocal%\\" *.* >nul 2>&1
	if %errorlevel%==0 (msg * "Lossless preset was installed^!" ) else (msg * "%errormessage%")
	call :SetReadOnly
	goto menu)

if %choice%==2 (
	robocopy "%~dp0%quality%\\" "%cfglocal%\\" *.* >nul 2>&1
	if %errorlevel%==0 (msg * "Quality preset was installed^!" ) else (msg * "%errormessage%")
	call :SetReadOnly
	goto menu)

if %choice%==3 (
	robocopy "%~dp0%balanced%\\" "%cfglocal%\\" *.* >nul 2>&1
	if %errorlevel%==0 (msg * "Balanced preset was installed^!" ) else (msg * "%errormessage%")
	call :SetReadOnly
	goto menu)

if %choice%==4 (
	robocopy "%~dp0%performance%\\" "%cfglocal%\\" *.* >nul 2>&1
	if %errorlevel%==0 (msg * "Performance preset was installed^!" ) else (msg * "%errormessage%")
	call :SetReadOnly
	goto menu)

if %choice%==5 (
	robocopy "%~dp0%potato%\\" "%cfglocal%\\" *.* >nul 2>&1
	if %errorlevel%==0 (msg * "Potato preset was installed^!" ) else (msg * "%errormessage%")
	call :SetReadOnly
	goto menu)
	

:: Easy-to-read
if %choice%==6 (goto monstrosity)
if %choice%==7 (goto settings)
if %choice%==8 (start https://www.nexusmods.com/clairobscurexpedition33/mods/308 & goto menu)
if %choice%==9 (exit)


:: In case the user try to make a unavailable choice.
msg * "This isn't a valid choice." & goto menu


:: The function that sets the files to read-only - It's used at the end of each choice block.
:SetReadOnly
for %%G in (Engine.ini Scalability.ini) do (ATTRIB +R "%cfglocal%\%%G")
goto menu


:: This is the mostrosity preset section 💀. Will do the same as choices 2-6
:monstrosity
cls
call :header
echo    %fo1%You know, sometimes it's better not to see some things.
echo    %fr%Do you want to go on and see this MONSTROSITY anyway^?%fw%
echo:
echo    [1] - Yes    ^|    [2] - No
echo:
set /p choicem=%blf%---%fo1%[
if %choicem%==1 (
	robocopy "%~dp0%monstrosity%\\" "%cfglocal%\\" *.* >nul 2>&1
	if %errorlevel%==0 (msg * "May God have mercy upon your soul.") else (msg * "%errormessage%")
	call :SetReadOnly
	goto menu
) else (msg * "Thank you for not doing that :D" & goto menu)


:: This will load the txt file with the needed In-Game Settings inside the program so you can see what you need to change.
:settings
echo %fob2%
cls
mode con:cols=66 lines=36
type "%~dp0IMPORTANT - In-Game Settings.txt"
echo:
echo:
echo %blb%%fw%                     Press any key to go back                     [20C
pause >nul
mode con:cols=66 lines=33
goto menu


:: This is the main header. Those "%something%" are the colors.
:header
echo %fob3%                                                                  
echo %fob2%%fo3%                          CLAIR OBSCUR                            
echo %fob%%fo1%                                                                  
echo         █▀▀ ▀▄▀ %fo2%█▀█ %fo3%█▀▀ %fo4%█▀▄ %fo5%▀█▀ %fo4%▀█▀ %fo3%▀█▀ %fo2%▄▀█ %fo1%█▄ █   %fo5%▀██ %fo5%▀██        %fo1%
echo         ██▄ █ █ %fo2%█▀▀ %fo3%██▄ %fo4%█▄▀ %fo5%▄█▄ %fo4% █  %fo3%▄█▄ %fo2%█▄▀ %fo1%█ ▀█   %fo5%▄▄█ %fo5%▄▄█        %fw%
echo %fob%%fo1%                                                                  
echo %fob2%                  %fo3%The Definitive Performance Mod                  
echo %fob3%%fo0%                          made by ru-bem                          %blb%
echo:
echo:
goto:eof
