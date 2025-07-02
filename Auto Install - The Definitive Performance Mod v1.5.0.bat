::
:: This script is written in a very simple and easy to read way so that most people can understand exactly what each line does. Have fun!
::
:: This was made by me, ru-bem. Please make sure you have downloaded this from Nexus Mods or Github.
:: https://www.nexusmods.com/clairobscurexpedition33/mods/308
:: https://github.com/ru-bem/COExp33-The-Definitive-Performance-Mod
::


:: This lines tells the cmd to show you only the necessary, sets the mod version, window size, page code and the title.
@echo off
setlocal EnableDelayedExpansion
set modver=v1.5.0
set "menusize=mode con:cols=66 lines=33"
chcp 65001 >nul
title The Definitive Performance Mod - %modver% - github.com/ru-bem
::


:: Shows a loading message on screen. You'll only see this if you use a very, very, very slow pc.
echo: & echo ::: COExp33 - The Definitive Performance Mod :::
echo: & echo     Loading auto-install script...
echo: & echo     This shouldn't take more than 1 second...
::


:: These lines below sets the colors used for the interface.
set blf=[30m
set blb=[40m
set fr=[31m
set fg=[32m
set fw=[97m
set fob1=[48;2;038;030;019m
set fob2=[48;2;026;020;013m
set fob3=[48;2;018;014;009m
set fo0=[38;2;038;030;013m
set fo1=[38;2;204;160;102m
set fo2=[38;2;255;200;128m
set fo3=[38;2;255;216;166m
set fo4=[38;2;255;233;204m
set fo5=[38;2;255;249;242m
::


:: One of these messages will be shown depending on the user's choice.
set  "msg=%fw%               Type a number/letter and press enter              "
set "msg0=%fg%                     Using the Default preset                    "
set "msg1=%fg%                    Lossless preset: installed                   "
set "msg2=%fg%                    Quality preset:  installed                   "
set "msg3=%fg%                    Balanced preset: installed                   "
set "msg4=%fg%                  Performance preset:  installed                 "
set "msg5=%fg%                     Potato preset: installed                    "
set "msg6=%fg%             💀 May God have mercy upon your soul 💀             "
set "msg7=%fg%              Steam Deck Q: Installed %fo1%- on Windows 💀            "
set "msg8=%fg%              Steam Deck P: Installed %fo1%- on Windows 💀            "
set "msgc=%fg%                    Cache:  cleared and locked                   "
set "msgu=%fg%                          Cache restored                         "
set "msge=%fr%        Something went wrong :^( - Install the mod manually.      "
::


:: This sets the default config folder for Exp33.
set "e33win=%Localappdata%\Sandfall\Saved\Config\Windows"
set "e33xbox=%Localappdata%\Sandfall\Saved\Config\WinGDK"
::
:: Check if the game is installed and it's version.
if exist %e33win% set cfglocal=!e33win!
if exist %e33xbox% set cfglocal=!e33xbox!
if not defined cfglocal goto notinstalled
::


:: This checks if the user have extracted all the files.
set extracted=yes
for %%G in (1_Lossless 2_Quality 3_Balanced 4_Performance 5_Potato 6_Monstrosity 7_Steamdeck_q 8_Steamdeck_p) do (if not exist "%~dp0%%G" (set extracted=no))
if %extracted%==no (goto notextracted) else (goto menu)
::


:: If the user hasn't extracted the files then goto here.
:notextracted
cls
call :header
echo:
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


:: If the game isn't installed then goto here.
:notinstalled
cls
call :header
echo:
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
%menusize%
cls

:: This places the header on top of the menu. You can find this header below on the code.
call :header

:: Those %% below are for applying the colors.
echo     %fob1%%fo1%    PRESETS    %blb%%fw%
echo     %fo1%[0]%fw% Default%fo0%::::: %fo1%Original graphics            -%fw%   0%% Boost
echo     %fo1%[1]%fw% Lossless%fo0%:::: %fo1%Almost identical to Original -%fw%  70%% Boost
echo     %fo1%[2]%fw% Quality%fo0%::::: %fo1%High quality (Recommended)   -%fw%  80%% Boost
echo     %fo1%[3]%fw% Balanced%fo0%:::: %fo1%The perfect balance.         -%fw% 105%% Boost
echo     %fo1%[4]%fw% Performance%fo0%: %fo1%A miracle. Huge FPS boost^^!   -%fw% 127%% Boost
echo     %fo1%[5]%fw% Potato%fo0%:::::: %fo1%Low-end - Ugly but playable  -%fw% 201%% Boost
echo     %fo1%[6]%fw% Monstrosity%fo0%: %fo1%Hell. Don't do this...       -%fw% 261%% Boost
echo     %fo1%[7]%fw% Steam Deck Quality %fo0%:::::::: %fo1%[8]%fw% Steam Deck Performance
echo:
echo     %fob1%%fo1%    Info + Extras    %blb%%fw%
echo     %fo1%[A]%fw% Optimized In-game Settings
echo     %fo1%[B]%fw% Clear + lock Exp33 cache file.
echo     %fo1%[C]%fw% Restore cache file to default.
echo     %fo1%[D]%fw% More details
echo:
echo     %fo1%[X]%fw% Exit
echo:
::

:: This allows you to make a choice by pressing a key then pressing enter.
set /p choice=%fo1%----[
::

:: Choice 0 will just delete any Engine.ini and Scalability.ini present on default Exp 33 config location.
if %choice%==0 (for %%G in (Engine.ini Scalability.ini) do (del /s /f /q "%cfglocal%\%%G" >nul 2>&1)) & set "msg=%msg0%" & goto menu
::

:: Choices 1-6:
:: Sets the name of the folder > Sets the message that will be shown if the process is successful > Call installini which will copy the files to the right location. > Return to menu
if %choice%==1 (set    "inifolder=1_Lossless" & set msg=%msg1% & call :installini & goto menu)
if %choice%==2 (set     "inifolder=2_Quality" & set msg=%msg2% & call :installini & goto menu)
if %choice%==3 (set    "inifolder=3_Balanced" & set msg=%msg3% & call :installini & goto menu)
if %choice%==4 (set "inifolder=4_Performance" & set msg=%msg4% & call :installini & call :clearcache & call :lockcache & goto menu)
if %choice%==5 (set      "inifolder=5_Potato" & set msg=%msg5% & call :installini & call :clearcache & call :lockcache & goto menu)
if %choice%==6 (set "inifolder=6_Monstrosity" & set msg=%msg6% & call :installini & call :clearcache & call :lockcache & goto menu)
if %choice%==7 (set "inifolder=7_Steamdeck_q" & set msg=%msg7% & call :installini & call :clearcache & call :lockcache & goto menu)
if %choice%==8 (set "inifolder=8_Steamdeck_p" & set msg=%msg8% & call :installini & call :clearcache & call :lockcache & goto menu)
::
:: Easy-to-read
if /i %choice%==a (goto settings)
if /i %choice%==b (call :clearcache & call :lockcache & set msg=%msgc% & goto menu)
if /i %choice%==c (call :clearcache & set msg=%msgu% & goto menu)
if /i %choice%==d (start https://www.nexusmods.com/clairobscurexpedition33/mods/308 & goto menu)
if /i %choice%==x (exit)
::
:: If the user make unavailable choice this message will be shown.
set "msg=%fr%                    This isn't a valid choice.                    " & goto menu
::


:: This is how the script installs the mod.
:: robocopy will copy all the files inside the selected preset folder to the default Exp33 config location.
:: If everything works it will show you a message, if not, it will show you another message.
:: After that it will call an function to set the files to read-only.
:installini
robocopy "%~dp0%inifolder%\\" "%cfglocal%\\" *.* >nul 2>&1
if not exist "%cfglocal%\Engine.ini" set msg=%msge%
for %%G in (Engine.ini Scalability.ini) do (ATTRIB +R "%cfglocal%\%%G")
goto:eof
::


:: This will load the txt file with the needed In-Game Settings inside the program so you can see what you need to change.
:settings
echo %fob2%
cls
mode con:cols=66 lines=40
type "%~dp0IMPORTANT - In-Game Settings.txt"
echo:
echo:
echo %blb%%fw%                     Press any key to go back                     
pause >nul
goto menu

:: This clears + unlock the Exp33 cache
:clearcache
for %%G in (ushaderprecache upipelinecache jnl) do (del /f /q "%LocalAppData%\Sandfall\Saved\*.%%G" >nul 2>&1)
goto:eof

:: This Locks the cache file
:lockcache
for %%G in ("%LocalAppData%\Sandfall\Saved\Sandfall_PCD3D_SM6.upipelinecache") do (type NUL > %%G & ATTRIB +R %%G >nul 2>&1)
goto:eof


:: This is the main header. Those "%something%" are the colors.
:header
echo %fob3%                                                                  
echo %fob2%%fo3%                          CLAIR OBSCUR                            
echo %fob1%%fo1%                                                                  
echo         █▀▀ ▀▄▀ %fo2%█▀█ %fo3%█▀▀ %fo4%█▀▄ %fo5%▀█▀ %fo4%▀█▀ %fo3%▀█▀ %fo2%▄▀█ %fo1%█▄ █   %fo5%▀██ %fo5%▀██        %fo1%
echo         ██▄ █ █ %fo2%█▀▀ %fo3%██▄ %fo4%█▄▀ %fo5%▄█▄ %fo4% █  %fo3%▄█▄ %fo2%█▄▀ %fo1%█ ▀█   %fo5%▄▄█ %fo5%▄▄█        %fw%
echo %fob1%%fo1%                                                                  
echo %fob2%                  %fo3%The Definitive Performance Mod                  
echo %fob3%                                                                  
echo [1A%fob3%%msg%%blb%
echo:
goto:eof
