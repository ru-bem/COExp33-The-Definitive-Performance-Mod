::::::::
::
:: This script is written in a very simple and easy to read way so that most people can understand exactly what each line does. Have fun!
::
:: This was made by me, ru-bem. Please make sure you have downloaded this from Nexus Mods or Github.
:: https://www.nexusmods.com/clairobscurexpedition33/mods/308
:: https://github.com/ru-bem/COExp33-The-Definitive-Performance-Mod
::
:: If this mod was useful to you, please consider a donation.
:: Thank you so much!
::
::::::::



:: This is the beggining of the file.
:: Before the program shows you the menu, some verifications and configurations needs to be done.



:: These lines tells the cmd to show you only the necessary, sets the mod version, window size, page code and the title.
@echo off
setlocal EnableDelayedExpansion
set modver=v1.6.1
set "menusize=mode con:cols=66 lines=33"
chcp 65001 >nul
title TDPM - %modver% - github.com/ru-bem
::



:: Shows a loading message on screen. You'll only see this if you use a VERY, VERY, VERY slow pc.
echo: & echo ::: COExp33 - The Definitive Performance Mod :::
echo: & echo     Loading auto-install script...
echo: & echo     This shouldn't take more than 1 second...
::



:: These lines below sets the colors used for the interface. https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
set blf=[30m
set blb=[40m
set fb=[94m
set fr=[31m
set fg=[32m
set fw=[97m
set fob1=[48;2;038;030;019m
set fob2=[48;2;026;020;013m
set fob3=[48;2;018;014;009m
set fo0=[38;2;038;030;019m
set fo1=[38;2;204;160;102m
set fo2=[38;2;255;200;128m
set fo3=[38;2;255;216;166m
set fo4=[38;2;255;233;204m
set fo5=[38;2;255;249;242m
::



:: These are the messages that can be shown depending on the user's choice.
set "msg="
set "blnk=                                                                 "
set "msga=%fw%               Type a number/letter and press enter              "
set "msg0=%fg%                     Using the Default preset                    "
set "msg1=%fg%                    Lossless preset: installed                   "
set "msg2=%fg%                    Quality preset:  installed                   "
set "msg3=%fg%                    Balanced preset: installed                   "
set "msg4=%fg%                  Performance preset:  installed                 "
set "msg5=%fg%                     Potato preset: installed                    "
set "msg6=%fg%             💀 May God have mercy upon your soul 💀            "
set "msg7=%fg%              Steam Deck Q: Installed %fo1%- on Windows 💀            "
set "msg8=%fg%              Steam Deck P: Installed %fo1%- on Windows 💀            "
set "msgc=%fg%                    Cache:  cleared and locked                   "
set "msgu=%fg%                          Cache restored                         "
set "msgd=%fg%                                🏆                               "
set "msge=%fr%        Something went wrong :^( - Install the mod manually.     "
set "msgf=%fr%                    This isn't a valid choice.                   "
set "msgn=%fr%          You need to install one of the INIs below first        "
set "msgs=%fw%                               Soon™                             "
set "msgi=%fg%                              Applied                            "
set "msgj=%fg%                              Removed                            "
set "upd0=%fg%                       Update DLSS and XESS                      "
set "upd1=%fr%       The script cannot access this folder. Run as admin.       "
set "upd2=%fr%                         Invalid Location                        "
set "upd3=%fg%    The script can access this folder %fr%but the game isn't here    "
::



:: This is a simple variable that will be used for "something" if the user choose to donate.
set donated=0
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
for %%G in (
1_Lossless
2_Quality
3_Balanced
4_Performance
5_Potato
6_Monstrosity
7_Steamdeck_q
8_Steamdeck_p
) do (if not exist "%~dp0%%G" (set extracted=no))
if %extracted%==no (goto notextracted) else (set msg=%msga% & goto menu)
::



:: If the user hasn't extracted the files the program will show you this:
:notextracted
set msg=%blnk%
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
:__
::



:: If the game isn't installed the program will show you this:
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
:__
::



:: Now you've reached the fancy menu with colors and everything.
:menu

set "backto=menu"
:: Before it shows you the interface it'll verify if any Engine.ini exists.
set "tdpm_preset=no"
if exist "%cfglocal%\Engine.ini" (
	:: If Engine.ini exists it'll check if it's a file made by me by searching for my name.
	find /n "ru-bem" %cfglocal%\Engine.ini >nul 2>&1
	:: if it's not made by me it'll save this information.
	if %errorlevel%==1 (
		set "tdpm_preset=no"
	) else (
	:: if it's made by me then it'll identify which INI are you using and save that information.
		for /f "tokens=3" %%G in ('find /n "INI:" "%cfglocal%\Engine.ini"') do (
			set "tdpm_preset=%%G"
		)
	)
)

:: After all that it'll check if the INI is made for Steam Decks and identify if it's the Quality of the Performance one.
if %tdpm_preset%==Steam (for /f "tokens=5" %%G in ('find /n "INI:" "%cfglocal%\Engine.ini"') do (set tdpm_preset=S%%G))

:: This will set the the correct size for the program window if you opened it as admin.
%menusize%
cls

:: This places the normal header on top of the menu or the special one if the user chooses to donate.
if %donated%==0 (call :header) else (call :headerTY)

:: This will show you the "INIs" tab:
echo %fob1%%fo1%                               INIs                               %fob3%%fw%

:: This whole section is for the INIs. If one of them is already installed then it'll make the name shine.
:: Those %fo1%, %fw% and so on are the colors. They were set above in the code for easier use.
if not exist "%cfglocal%\Engine.ini" (set preset= %fo1%D%fo2%e%fo3%f%fo4%a%fo5%u%fo4%l%fo3%t) else (set preset= Default)
echo   %fo1%0}%fw%%preset%%fo0% :::: %fo1%The game as intended by the devs %fo0% : 00%fw%0%% Boost  

if %tdpm_preset%==Lossless (set preset= %fo1%L%fo2%o%fo3%s%fo4%s%fo5%l%fo4%e%fo3%s%fo2%s) else (set preset= Lossless)
echo   %fo1%1}%fw%%preset%%fo0% : : %fo1%As close as possible to the default %fo0%0%fw%70%% Boost  

if %tdpm_preset%==Quality (set preset= %fo1%Q%fo2%u%fo3%a%fo4%l%fo5%i%fo4%t%fo3%y) else (set preset= Quality)
echo   %fo1%2}%fw%%preset%%fo0% :::: %fo1%High quality lumen and shadows %fo0%:::: 0%fw%80%% Boost  

if %tdpm_preset%==Balanced (set preset= %fo1%B%fo2%a%fo3%l%fo4%a%fo5%n%fo4%c%fo3%e%fo2%d) else (set preset= Balanced)
echo   %fo1%3}%fw%%preset%%fo0% : : %fo1%Lower quality lumen and shadows %fo0%: : %fw%105%% Boost  

if %tdpm_preset%==Performance (set preset= %fo1%P%fo2%e%fo3%r%fo4%f%fo5%o%fo4%r%fo3%m%fo2%a%fo1%n%fo2%c%fo3%e) else (set preset= Performance)
echo   %fo1%4}%fw%%preset%%fo0%: %fo1%Miracle - No Lumen - HUGE FPS boost %fw%127%% Boost  

if %tdpm_preset%==Potato (set preset= %fo1%P%fo2%o%fo3%t%fo4%a%fo5%t%fo4%o) else (set preset= Potato)
echo   %fo1%5}%fw%%preset%%fo0% ::::: %fo1%Meant for potato PCs - Playable %fo0%: : %fw%201%% Boost 

if %tdpm_preset%==Monstrosity (set preset= %fr%Monstrosity) else (set preset= Monstrosity)
echo   %fo1%6}%fw%%preset%%fo0%: %fo1%Hell. (Try not to laugh) %fo0%:::::::::: %fw%261%% Boost  

if %tdpm_preset%==SQuality (set preset_sq= %fo1%S%fo2%t%fo3%e%fo4%a%fo5%m%fo4% D%fo3%e%fo2%c%fo1%k) else (set preset_sq= Steam Deck)
if %tdpm_preset%==SPerformance (set preset_sp= %fo1%S%fo2%t%fo3%e%fo4%a%fo5%m%fo4% D%fo3%e%fo2%c%fo1%k) else (set preset_sp= Steam Deck)
echo   %fo1%7}%fw%%preset_sq% (Quality) %fo0%:::::::::: %fo1%8}%fw%%preset_sp% (Performance)  
echo %fob3%                                                                  

:: This will show you the "UTILITIES" tab:
echo %fob1%%fo1%                            UTILITIES:                            %fob3%%fw%
echo   %fo1%9}%fw% Recommended Settings %fo0%: %fo1%A}%fw% Update DLSS + XESS %fo0%: %fo1%B}%fw% INI Fixes  
echo   %fo1%C}%fw% Custom Vars (Fun) %fo0%:::: %fo1%D}%fw% %fo1%D%fo2% O%fo3% N%fo4% A%fo5% T%fo4% E%fo0%  Thank you so much^^!    
echo %fob3%                                                                  

:: And this will show you the "TECHNICAL" tab:
echo %fob1%%fo1%                            TECHNICAL:                            %fob3%%fw%
echo   %fo1%E}%fw% Clear + lock Exp33 Cache %fo0%:::: %fo1%F}%fw% Restore cache %fo0%:::: %fo1%X}%fw% Exit  
echo %fob3%                                                                  %blb%

:: This allows you to make a choice by pressing a key then pressing enter.
set /p choice=%fo0%-%fo1%:

:: If you choose 0 the program will delete any Engine.ini and Scalability.ini present on default Exp 33 config location.
if %choice%==0 (for %%G in (Engine.ini Scalability.ini) do (del /s /f /q "%cfglocal%\%%G" >nul 2>&1)) & set "msg=%msg0%" & goto menu

:: Choices 1-8 - More info bellow
if %choice%==1 (call :menu_c1 & goto menu)
if %choice%==2 (call :menu_c2 & goto menu)
if %choice%==3 (call :menu_c3 & goto menu)
if %choice%==4 (call :menu_c4 & goto menu)
if %choice%==5 (call :menu_c5 & goto menu)
if %choice%==6 (call :menu_c6 & goto menu)
if %choice%==7 (call :menu_c7 & goto menu)
if %choice%==8 (call :menu_c8 & goto menu)

:: Easy-to-read
if %choice%==9 (goto rec_settings)
if /i %choice%==a (set msg=%upd0% & goto upscaler_updater)
if /i %choice%==b (if %tdpm_preset%==no (set msg=%msgn% & goto menu) else (set "fix_ini=add" & set msg=%blnk% & goto ini_fixes))
if /i %choice%==c (if %tdpm_preset%==no (set msg=%msgn% & goto menu) else (set "ini_custom=add" & set msg=%blnk% & goto ini_custom))
if /i %choice%==d (set msg=%msgd% & set donated=1 & start https://www.nexusmods.com/clairobscurexpedition33/mods/308 & goto menu)
if /i %choice%==e (call :clearcache & call :lockcache & set msg=%msgc% & goto menu)
if /i %choice%==f (call :clearcache & set msg=%msgu% & goto menu)
if /i %choice%==x (if exist "%temp%\DLSS_XESS" (rd /s /q "%temp%\DLSS_XESS" >nul 2>&1 & exit) else (exit))

:: If the user make an unavailable choice this message will be shown.
set msg=%msgf% & goto menu
:__
::


:: Choices 1-8:
:: > Says: Installing...
:: > Sets the name of the folder based on the preset you've choose
:: > Sets the message that will be shown if the process is successful
:: > Call "installini" which will copy the files to the right location.
:: > Return to menu
:: > If you choose performance, potato of monstrosity it'll also delete any file with these extensions:
:: .ushaderprecache .upipelinecache and .jnl from the folder %LocalAppData%\Sandfall\Saved\
:menu_c1
echo   [1AInstalling...
set "inifolder=1_Lossless"
set msg=%msg1%
call :installini
goto:eof

:menu_c2
echo   [1AInstalling...
set     "inifolder=2_Quality"
set msg=%msg2%
call :installini
goto:eof

:menu_c3
echo   [1AInstalling...
set    "inifolder=3_Balanced"
set msg=%msg3%
call :installini
goto:eof

:menu_c4
echo   [1AInstalling...
set "inifolder=4_Performance"
set msg=%msg4%
call :installini
call :clearcache
call :lockcache
goto:eof

:menu_c5
echo   [1AInstalling...
set      "inifolder=5_Potato"
set msg=%msg5%
call :installini
call :clearcache
call :lockcache
goto:eof

:menu_c6
echo   [1AInstalling...
set "inifolder=6_Monstrosity"
set msg=%msg6%
call :installini
call :clearcache
call :lockcache
goto:eof

:menu_c7
echo   [1AInstalling...
set "inifolder=7_Steamdeck_q"
set msg=%msg7%
call :installini
call :clearcache
call :lockcache
goto:eof

:menu_c8
echo   [1AInstalling...
set "inifolder=8_Steamdeck_p"
set msg=%msg8%
call :installini
call :clearcache
call :lockcache
goto:eof
:__


:: Here is the "Installini" mentioned above. This is how the script installs the INIs.
:installini

:: robocopy will copy all the files inside the selected preset folder to the default Exp33 config location.
robocopy "%~dp0%inifolder%\\" "%cfglocal%\\" *.* >nul 2>&1

:: If everything works it will show you a success message, if something goes wrong it will show you and error message.
if not exist "%cfglocal%\Engine.ini" set msg=%msge%

:: After that it will set the files to read-only using ATTRIB.
for %%G in (Engine.ini Scalability.ini) do (ATTRIB +R "%cfglocal%\%%G")
goto:eof
:__
::



:: Here is the recommended settings section
:rec_settings

:: This sets the background color and clears the screen:
echo %fob3%
cls

:: This sets the window size:
mode con:cols=66 lines=40

:: This will load the txt file with the recommended settings inside the program for you to read.:
type "%~dp0IMPORTANT - In-Game Settings.txt"
echo:
echo:
echo %blb%%fw%                     Press any key to go back                     

:: This makes the cmd wait for you to press any key to go back:
pause >nul
goto menu
:__



:: This is the main header.
:header
title TDPM - %modver% - github.com/ru-bem
echo %fob3%                                                                  
echo %fob2%%fo3%                           CLAIR OBSCUR                           
echo %fob1%%fo1%                                                                  
echo         █▀▀ ▀▄▀ %fo2%█▀█ %fo3%█▀▀ %fo4%█▀▄ %fo5%▀█▀ %fo4%▀█▀ %fo3%▀█▀ %fo2%▄▀█ %fo1%█▄ █   %fo5%▀██ %fo5%▀██        %fo1%
echo         ██▄ █ █ %fo2%█▀▀ %fo3%██▄ %fo4%█▄▀ %fo5%▄█▄ %fo4% █  %fo3%▄█▄ %fo2%█▄▀ %fo1%█ ▀█   %fo5%▄▄█ %fo5%▄▄█        %fw%
echo %fob1%%fo1%                                                                  
echo %fob2%                  %fo3%The Definitive Performance Mod                  
echo %fob3%                                                                  
echo %fob3%%msg%%blb%
echo %fob3%                                                                  %blb%
goto:eof

:: This is the special header for those who choose to donate.
:headerTY
title Thank you^^!  COEXP33 %modver%
echo %fob3%                                                                  
echo %fob2%%fo3%                Y O U   A R E   T H E   G O A T  ^^!                
echo %fob1%%fo1%                                                                  
echo                ▀█▀ %fo2%█▄█ %fo3%▄▀█ %fo4%█▄ █ %fo5%█▄▀   %fo4%█▄█ %fo3%▄▀█ %fo2%█ █ %fo1%█               %fo1%
echo                 █  %fo2%█ █ %fo3%█▀█ %fo4%█ ▀█ %fo5%█ █   %fo4% █  %fo3%█▄▀ %fo2%█▄█ %fo1%▄               %fw%
echo %fob1%%fo1%                                                                  
echo %fob2%                %fo1%T %fo2%H %fo3%A %fo4%N %fo5%K   %fo4%Y %fo3%O %fo2%U   %fo1%S %fo2%O   %fo3%M %fo4%U %fo5%C %fo4%H %fo3%^^!               
echo %fob3%                                                                  
echo %fob3%%msg%%blb%
echo %fob3%                                                                  %blb%
goto:eof
:__



:: This is the Upscaler Updater section.
:upscaler_updater
:: First it'll reset some variables, just in case.
set game_autolocated=0
set steam_installed=0

:: Then will clear the screen and put the header based on if the user has donated or no.
cls & if %donated%==0 (call :header) else (call :headerTY)
echo:
echo %fob1%                                                                  %blb%
echo %fob1%%fo1%  Trying to find the game's folder automatically...               %blb%
echo %fob1%                                                                  %blb%
echo:

:: Now it'll try to find the game's folder.
:uu_steam
echo %fw%  Is Steam installed?

:: First it'll verify is Steam is installed and aswer the question above.
if exist "%ProgramFiles(x86)%\Steam\steam.exe" set steam_installed=1
if %steam_installed%==1 (
	echo [1A%fw%  Is Steam installed? %fg%Yes!%fw%
	) else (
	echo [1A%fw%  Is Steam installed? %fr%No!%fw%
	goto uu_manual
	)

:: If Steam is installed it'll look in the registry for the folder where EXP33 was installed.
echo   Is the game installed?
for /f "skip=2 tokens=2,*" %%G in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1903340" /v InstallLocation') do (set gamelocation_steam="%%H")

:: Then it'll will verify if the correct folder was stored as a variable and aswer the question above.
set gamelocation=%gamelocation_steam%
echo %gamelocation% | findstr /i "expedition" >nul 2>&1
if %errorlevel%==0 (
	set game_autolocated=1 & echo [1A  Is the game installed? %fg%Yes! & echo   %gamelocation%%fw%&echo: & goto uu_v0
	) else (
	set game_autolocated=0 & echo [1A  Is the game installed? %fr%No!%fw%
)

:: If the game's folder wasn't found you'll get here.
:uu_manual
if %game_autolocated%==0 (cls & if %donated%==0 (call :header) else (call :headerTY))
echo:
echo %fw%  The game's folder wasn't found automatically.
echo %fg%  - PASTE YOUR GAME'S FOLDER LOCATION BELOW -
echo %fg%  (You can drag n' drop the game folder here)
echo:
)
echo   %fo1%0}%fw% Go back.

:: If it's not running as admin, you'll see an option to elevate.
net session >nul 2>&1 || (echo   %fo1%1}%fw% Run this script with admin rights.)
echo:
echo:
if %game_autolocated%==1 set gamelocation=%gamelocation_steam% & goto uu_verify_folder
set /p gamelocation=%blf%--%fo1%{

:: Verifies if the user is trying to "troll" by typing anything with a quotation mark in the middle like: quot"ation
:uu_verify_folder
cls & if %donated%==0 (call :header) else (call :headerTY)
echo: & echo   %fw%Verifying input.
echo %gamelocation% | findstr .*".* && set msg=%upd2% & goto upscaler_updater

:: Verifies if the input is inside quotation marks. If not, put quotation marks and go on.
cls & if %donated%==0 (call :header) else (call :headerTY) & echo: & echo %fw%Verifying input. .
echo %gamelocation% | findstr \^".*\^" && goto uu_v0 || set gamelocation="%gamelocation%" & goto uu_v0

:: After you make a choice the code will start it's first verifications
:uu_v0

:: 0 to go back to the main menu
if %gamelocation%=="0" set msg=%blnk% & goto menu

:: 1 to run the script as admin
if %gamelocation%=="1" (if not "%1"=="am_admin" (chcp 437 >nul & powershell -command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'" & chcp 65001 >nul & exit /b) else (goto :upscaler_updater))

:: If you type anything else ii'll verify if it's a folder address.
if %game_autolocated%==0 (cls & if %donated%==0 (call :header) else (call :headerTY))
echo %gamelocation% | findstr ".*:\.*"

:: If it's not a folder address, it'll show you an error message and go back to the upscaler_updater menu.
if %errorlevel% NEQ 0 (set msg=%upd2% & goto upscaler_updater)

:: if what you type is a folder address, it'll try to create an empty file to test if the script has permission to write here.
pushd %gamelocation%
echo   Checking permissions...
echo   If "Access denied" you'll need to run the script as admin.
type NUL > tdpm.tdpm & if NOT exist tdpm.tdpm (set permission=0 & set msg=%upd1% & goto upscaler_updater) else (del /f /s /q tdpm.tdpm >nul 2>&1 & set permission=1 & goto uu_v1)

:: If the script has enough rights, it'll verify if you pasted the root folder.
:uu_v1
if %game_autolocated%==0 (cls & if %donated%==0 (call :header) else (call :headerTY))
echo   Verifying....
if exist "%cd%\Sandfall" (set glocation=root & goto uu_root_or_exe) else (goto uu_v2)

:: If it's not the root folder, it'll verify if you pasted the folder containing the .exe of the game.
:uu_v2
if %game_autolocated%==0 (cls & if %donated%==0 (call :header) else (call :headerTY))
echo   Verifying....
if exist "*shipping.exe" (set glocation=exe & goto uu_root_or_exe) else (goto uu_cant_update)

:uu_root_or_exe
:: If you pasted root folder, the script will store the dlss and xess folders as variables and go to update confirmation.
if %glocation%==root (call :uu_set_folders & goto uu_can_update)
:: If you pasted .exe folder, the script will go up three times to the root folder, set the dlss and xess folders as variables and go to update confirmation.
if %glocation%==exe (cd .. & cd .. & cd .. & call :uu_set_folders & goto uu_can_update)

:uu_set_folders
set "dlssfolder=%cd%\Sandfall\Plugins\NVIDIA\DLSS\Binaries\ThirdParty\Win64\"
set "xessfolder=%cd%\Engine\Plugins\Marketplace\XeSS\Binaries\ThirdParty\Win64\"
if NOT exist "%dlssfolder%nvngx_dlss.dll" set msg=%upd2% & goto upscaler_updater
if NOT exist "%xessfolder%libxess.dll" set msg=%upd2% & goto upscaler_updater
goto:eof

:: After all the verifications you'll see to this small confirmation menu.
:uu_can_update
set msg=%upd0%
cls & if %donated%==0 (call :header) else (call :headerTY)
echo:
echo   %fg%Verification done^^! The game is located at:
echo   %fg%%gamelocation%
echo:
echo   It's safe to continue^^!
echo:
echo   %fo1%1}%fw% Update DlSS and XESS
echo   %fo1%2}%fw% This is the wrong folder^^!
echo   %fo1%3}%fw% Go back to main menu
echo:
set /p updtchoice=%fo1%--:
if %updtchoice%==1 goto uu_start
if %updtchoice%==2 (set game_autolocated=0 & goto uu_manual)
if %updtchoice%==3 set msg=%blnk% & goto menu
set msg=%msgf% & goto uu_can_update

:: If something went wrong on verification stage you'll go back to the upscaler_updater menu.
:uu_cant_update
popd & if %permission%==1 (set msg=%upd3% & goto upscaler_updater) else (set msg=%upd2% & goto upscaler_updater)

:: If everything is ok this will begin the update process.
:uu_start
cls & if %donated%==0 (call :header) else (call :headerTY)

:: If not present, creates a folder called "DLSS_XESS" on users temporary folder.
if NOT exist "%temp%\DLSS_XESS" (md "%temp%\DLSS_XESS")
echo:

:: Downloads DLSS 4 DLL from NVIDIA's DLSS github page
echo %fw%    Downloading DLSS 4 DLLs%fo1%[1/2]
curl -# -o "%temp%\DLSS_XESS\nvngx_dlss.dll" "https://raw.githubusercontent.com/NVIDIA/DLSS/refs/heads/main/lib/Windows_x86_64/rel/nvngx_dlss.dll"
echo %fw%[2A    Downloading DLSS 4 DLLs%fo1%[2/2]
curl -# -o "%temp%\DLSS_XESS\nvngx_dlssd.dll" "https://raw.githubusercontent.com/NVIDIA/DLSS/refs/heads/main/lib/Windows_x86_64/rel/nvngx_dlssd.dll"
echo:

:: Downloads XESS DLL from INTEL's XESS github page
echo %fw%    Downloading XESS DLLs%fo1%[1/4]
curl -# -o "%temp%\DLSS_XESS\libxess_dx11.dll" "https://raw.githubusercontent.com/intel/xess/refs/heads/main/bin/libxess_dx11.dll"
echo %fw%[2A    Downloading XESS DLLs%fo1%[2/4]
curl -# -o "%temp%\DLSS_XESS\libxell.dll" "https://raw.githubusercontent.com/intel/xess/refs/heads/main/bin/libxell.dll"
echo %fw%[2A    Downloading XESS DLLs%fo1%[3/4]
curl -# -o "%temp%\DLSS_XESS\libxess_fg.dll" "https://raw.githubusercontent.com/intel/xess/refs/heads/main/bin/libxess_fg.dll"
echo %fw%[2A    Downloading XESS DLLs%fo1%[4/4]
curl -# -o "%temp%\DLSS_XESS\libxess.dll" "https://raw.githubusercontent.com/intel/xess/refs/heads/main/bin/libxess.dll"
echo:

echo %fw%    Updating EXP33 DLSS...
:: Verify if there's already an old backup for any of the dlls and deletes it if so.
if exist "%dlssfolder%*.old" (del "%dlssfolder%*.old" >nul 2>&1)
:: Make a new backup of the DLL installed by adding .old on the end of the file.
ren "%dlssfolder%*" "*?.old" >nul 2>&1
:: Copy the DLSS DLL to the correct folder.
robocopy "%temp%\\DLSS_XESS\\" "%dlssfolder%\" nvngx_dlss.dll >nul 2>&1
robocopy "%temp%\\DLSS_XESS\\" "%dlssfolder%\" nvngx_dlssd.dll >nul 2>&1

echo     Updating EXP33 XESS...
:: Verify if there's already an old backup for any of the dlls and deletes it if so.
if exist "%xessfolder%*.old" (del "%xessfolder%*.old" >nul 2>&1)
:: Make a new backup of the DLL installed by adding .old on the end of the file.
ren "%xessfolder%*" "*?.old" >nul 2>&1
:: Copy the XESS DLL to the correct folder.
robocopy "%temp%\\DLSS_XESS\\" "%xessfolder%\" libxe* >nul 2>&1
echo:

echo %fg%    Done^^!
echo %fo1%    Press any key to go back to menu
pause >nul
goto menu
:__



:: This creates an empty cache file and locks it.
:: Technical stuff but to summarize: this fixes a lot of small problems that could happen on some presets.
:lockcache
for %%G in ("%LocalAppData%\Sandfall\Saved\Sandfall_PCD3D_SM6.upipelinecache") do (type NUL > %%G & ATTRIB +R %%G >nul 2>&1)
goto:eof

:: This unlock and allows the cache file to be recreated again.
:clearcache
for %%G in (ushaderprecache upipelinecache jnl) do (del /f /q "%LocalAppData%\Sandfall\Saved\*.%%G" >nul 2>&1)
goto:eof
:__



:: Welcome to the INI_Fixes section, at this point you understand something about how the code works.
:ini_fixes
set "ini_target_line=;; FIXES ;;"

cls & if %donated%==0 (call :header) else (call :headerTY)
if %fix_ini%==add (
	set "fix_operation=:add_variable"
	echo %fob1%             %fo1%A%fo2%P%fo3%P%fo4%L%fo5%Y%fo0%             %blb%: :%fob2%             REMOVE             %blb%
	echo   %fw%Apply the fix into the installed INI: %fo1%%tdpm_preset%%fw%
	echo:
	) else (
	set "fix_operation=:del_variable"
	echo %fob2%%fo0%             APPLY             %blb%: :%fob1%%fo1%             %fo1%R%fo2%E%fo3%M%fo4%O%fo5%V%fo4%E             %blb%
	echo   %fw%Remove the fix from the installed INI: %fo1%%tdpm_preset%%fw%
	)
echo:
echo:
echo   Available alternative fixes (for now):
echo   %fg%%fix_use%1}%fo1% "The TAB menu with the characters is lagging..."
echo:
echo:
echo:
echo   %fw%Z} Switch between "Apply" and "Remove"
echo   %fw%0} Go Back %blb%
echo:
set /p whatfix=%fo0%-%fo1%:

if %whatfix%==0 set msg=%msga% & goto menu
if %whatfix%==1 goto ini_fixes_1
if /i %whatfix%==z (if %fix_ini%==add (set fix_ini=del & goto ini_fixes) else (set fix_ini=add & goto ini_fixes))
set msg=%msgf% & goto ini_fixes


:ini_fixes_1
for %%G in (
"r.Shadow.Virtual.ResolutionLodBiasLocal=2"
) do (set ini_variable=%%~G & call %fix_operation%)
goto ini_fixes
:__


:: This is what the program uses to add new lines to the Engine.ini
:add_variable
set msg=%msgi%
pushd %cfglocal%

ATTRIB -R Engine.ini >nul 2>&1

(for /f "tokens=1* delims=:" %%G in ('findstr /n "^" "Engine.ini"') do (
    echo:%%H
    if "%%H"=="!ini_target_line!" echo:!ini_variable!
  )
) > "Engine.ini.tmp"
move /y "Engine.ini.tmp" "Engine.ini" >nul 2>&1
ATTRIB +R Engine.ini >nul 2>&1

popd
goto:eof


:: This is what the program uses to remove lines from the Engine.ini
:del_variable
set msg=%msgj%
pushd %cfglocal%

ATTRIB -R Engine.ini >nul 2>&1

(for /f "tokens=1* delims=:" %%G in ('findstr /n "^" "Engine.ini"') do (
    if not "%%H"=="!ini_variable!" echo:%%H
  )
) > "Engine.ini.tmp"
move /y "Engine.ini.tmp" "Engine.ini" >nul
ATTRIB +R Engine.ini >nul 2>&1

popd
goto:eof
:__



:: And this is the custom INI section. Have fun!
:ini_custom
set "custom_operation=:add_variable"
set "ini_target_line=;; CUSTOM VARIABLES ;;"

cls & if %donated%==0 (call :header) else (call :headerTY)
echo %fob1%%fo1%                Custom variables can only be added                
echo %fob1%%fo1%    To remove them re-install the INI file or edit it manually    
echo %fob1% %blnk%
echo %fob2%      %fb%Useful %fw%- %fg%Pure fun%fw% - %fo1%Some performance loss%fw% - %fr%GPU Killer      %blb%
echo %fob3% %blnk%
echo:
echo   %fb%1}%fw% Increase the saturation of the game.
echo   %fb%2}%fw% Remove volumetric fog.
echo   %fo1%3}%fw% Increase the view distance.
echo   %fg%4}%fw% EPILEPSY WARNING
echo   %fg%5}%fw% Inverted World (Pretty cool tbh)
echo   %fg%6}%fw% Low Poly World
echo   %fr%7}%fw% Can you can EXP33 now? 💀
echo:
find /n "CustomVarAdded=1" %cfglocal%\Engine.ini >nul 2>&1
if %errorlevel%==0 (echo %fw%  R} Reset the %fo1%%tdpm_preset%%fw% INI to it's default values)
echo   %fw%0} Go Back %blb%
echo:
set /p whatcustom=%fo0%-%fo1%:

if %whatcustom%==0 set msg=%msga% & goto menu
if %whatcustom%==1 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_1
if %whatcustom%==2 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_2
if %whatcustom%==3 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_3
if %whatcustom%==4 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_4
if %whatcustom%==5 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_5
if %whatcustom%==6 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_6
if %whatcustom%==7 echo [1A  Applying...& call :ini_custom_r & goto ini_custom_7
if /i %whatcustom%==r (goto ini_custom_r)
set msg=%msgf% & goto ini_custom

:ini_custom_r
set "backto=ini_custom"
if %tdpm_preset%==Lossless     (call :menu_c1)
if %tdpm_preset%==Quality      (call :menu_c2)
if %tdpm_preset%==Balanced     (call :menu_c3)
if %tdpm_preset%==Performance  (call :menu_c4)
if %tdpm_preset%==Potato       (call :menu_c5)
if %tdpm_preset%==Monstrosity  (call :menu_c6)
if %tdpm_preset%==SQuality     (call :menu_c7)
if %tdpm_preset%==SPerformance (call :menu_c8)
goto:eof

:ini_custom_1
for %%G in (
"r.CustomVarAdded=1"
"r.Color.Grading=0"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom

:ini_custom_2
for %%G in (
"r.CustomVarAdded=1"
"r.VolumetricFog=0"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom

:ini_custom_3
for %%G in (
"r.CustomVarAdded=1"
"r.ViewDistanceScale=2"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom

:ini_custom_4
for %%G in (
"r.CustomVarAdded=1"
"r.AntiAliasingMethod=0"
"r.Color.Mid=0.2"
"r.Color.Grading=0"
"r.EyeAdaptation.LensAttenuation=0"
"r.Lumen.Reflections.SpecularScale=150"
"r.Lumen.ScreenProbeGather.Temporal=0"
"r.SkylightIntensityMultiplier=0"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom

:ini_custom_5
for %%G in (
"r.CustomVarAdded=1"
"r.Lumen.Reflections.SpecularScale=50"
"r.SkylightIntensityMultiplier=1000"
"r.Color.Mid=0.3"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom

:ini_custom_6
for %%G in (
"r.CustomVarAdded=1"
"r.Nanite.MaxPixelsPerEdge=1e8"
"r.SkeletalMeshLODBias=10"
"r.MipMapLodBias=10"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom

:ini_custom_7
for %%G in (
"r.CustomVarAdded=1"
"r.Nanite.MaxPixelsPerEdge=0"
) do (set ini_variable=%%~G & call %custom_operation%)
goto ini_custom
:__


::  This is the end of the code. :D  ::