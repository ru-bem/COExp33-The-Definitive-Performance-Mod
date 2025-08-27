::
:: This script is written in a very simple and easy to read way so that most people can understand exactly what each line does. Have fun!
::
:: This was made by me, ru-bem. Please make sure you have downloaded this from Nexus Mods or Github.
:: https://www.nexusmods.com/clairobscurexpedition33/mods/308
:: https://github.com/ru-bem/COExp33-The-Definitive-Performance-Mod
::


:: These lines tells the cmd to show you only the necessary, sets the mod version, window size, page code and the title.
@echo off
setlocal EnableDelayedExpansion
set modver=v1.5.4
set "menusize=mode con:cols=66 lines=33"
chcp 65001 >nul
title The Definitive Performance Mod - %modver% - github.com/ru-bem
::


:: Shows a loading message on screen. You'll only see this if you use a VERY, VERY, VERY slow pc.
echo: & echo ::: COExp33 - The Definitive Performance Mod :::
echo: & echo     Loading auto-install script...
echo: & echo     This shouldn't take more than 1 second...
::


:: These lines below sets the colors used for the interface. https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
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


:: These are the messages that can be shown depending on the user's choice.
set "blnk=                                                                  "
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
set "msgf=%fr%                    This isn't a valid choice                    "
set "upd0=%fg%                       Update DLSS and XESS                      "
set "upd1=%fr%       The script cannot access this folder. Run as admin.       "
set "upd2=%fr%                         Invalid Location                        "
set "upd3=%fg%    The script can access this folder %fr%but the game isn't here    "
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
if %extracted%==no (goto notextracted) else (goto menu)
::


:: If the user hasn't extracted the files then goto here.
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
::


:: If the game isn't installed you'll see this.
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
echo:
echo     %fob1%%fo1%                           INIs                           %blb%%fw%
echo     %fo1%[0]%fw% Default%fo0%::::: %fo1%Original graphics            -%fw%   0%% Boost
echo     %fo1%[1]%fw% Lossless%fo0%:::: %fo1%Almost identical to Original -%fw%  70%% Boost
echo     %fo1%[2]%fw% Quality%fo0%::::: %fo1%High quality (Recommended)   -%fw%  80%% Boost
echo     %fo1%[3]%fw% Balanced%fo0%:::: %fo1%The perfect balance.         -%fw% 105%% Boost
echo     %fo1%[4]%fw% Performance%fo0%: %fo1%A miracle. Huge FPS boost^^!   -%fw% 127%% Boost
echo     %fo1%[5]%fw% Potato%fo0%:::::: %fo1%Low-end - Ugly but playable  -%fw% 201%% Boost
echo     %fo1%[6]%fw% Monstrosity%fo0%: %fo1%Hell. Don't do this...       -%fw% 261%% Boost
echo     %fo1%[7]%fw% Steam Deck Quality %fo0%:::::::: %fo1%[8]%fw% Steam Deck Performance
echo:
echo:
echo     %fob1%%fo1%                          EXTRAS                          %blb%%fw%
echo     %fo1%[A]%fw% Recommended Game Settings %fo0%::::: %fo1%[B]%fw% Update DLSS + XESS
echo     %fo1%[C]%fw% Clear + lock ex33 cache %fo0%:::::::::::: %fo1%[D]%fw% Restore cache
echo     %fo1%[E]%fw% Official mod page
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
if /i %choice%==b (set msg=%upd0% & goto updateupscaling)
if /i %choice%==c (call :clearcache & call :lockcache & set msg=%msgc% & goto menu)
if /i %choice%==d (call :clearcache & set msg=%msgu% & goto menu)
if /i %choice%==e (start https://www.nexusmods.com/clairobscurexpedition33/mods/308 & goto menu)
if /i %choice%==x (if exist "%temp%\DLSS_XESS" (rd /s /q "%temp%\DLSS_XESS" >nul 2>&1 & exit) else (exit))
::
:: If the user make an unavailable choice this message will be shown.
set msg=%msgf% & goto menu
::


::
:: This is how the script installs the mod.
:installini
:: robocopy will copy all the files inside the selected preset folder to the default Exp33 config location.
robocopy "%~dp0%inifolder%\\" "%cfglocal%\\" *.* >nul 2>&1
:: If everything works it will show you a message, if not, it will show you another message.
if not exist "%cfglocal%\Engine.ini" set msg=%msge%
:: After that it will set the files to read-only.
for %%G in (Engine.ini Scalability.ini) do (ATTRIB +R "%cfglocal%\%%G")
goto:eof
::


:: This will load the txt file with the recommended settings inside the program for you to read.
:settings
:: Sets the background color
echo %fob2%
cls
:: Window size
mode con:cols=66 lines=40
:: Load the txt file
type "%~dp0IMPORTANT - In-Game Settings.txt"
echo:
echo:
echo %blb%%fw%                     Press any key to go back                     
pause >nul
goto menu


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



::
::
:: Update DLSS and XESS Section
::
::
:: First you need to paste your game location
:updateupscaling
cls & call :header
echo:
echo %fg%                   Where is your game located?
echo %fg%           - PASTE YOUR GAME'S FOLDER LOCATION BELOW -
echo %fg%           (You can drag n' drop the game folder here)   
echo:
echo %fo1%                    OR type [1] to go back.           
::
::
:: If it's not running as admin, you'll see an option to elevate.
net session >nul 2>&1 || (echo %fo1%        OR type [2] to run this script with admin rights.)
echo:
echo:
set /p gamelocation=%blf%--%fw%[

:: Verify if the user is trying to troll by typing anything with a quotation mark in the middle.
cls & call :header & echo: & echo %fw%Verifying .
echo %gamelocation% | findstr .*".* && set msg=%upd2% & goto updateupscaling

:: Verify if the input is inside quotation marks. If not, put quotation marks and go on.
cls & call :header & echo: & echo %fw%Verifying . .
echo %gamelocation% | findstr \^".*\^" && goto updatev0 || set gamelocation="%gamelocation%" & goto updatev0
::
::
:: After you make a choice the code will start it's first verifications
:updatev0
:: If you type 1 it'll send you back to menu
if %gamelocation%=="1" set msg=%blnk% & goto menu
:: If you type 2 it'll elevate the script to admin
if %gamelocation%=="2" (if not "%1"=="am_admin" (chcp 437 >nul & powershell -command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'" & chcp 65001 >nul & exit /b) else (goto :updateupscaling))
:: If you type anything else ii'll verify if it's a folder address.
cls & call :header & echo: & echo %fw%Verifying . . .
echo %gamelocation% | findstr ".*:\.*"
:: If it's not, it'll show you an error message.
if %errorlevel% NEQ 0 (set msg=%upd2% & goto updateupscaling)
:: if yes, it'll try to create an empty file to test if the script has permission to write here.
pushd %gamelocation%
echo     Checking permissions...
echo     If "Access denied" you'll need to run the script as admin.
type NUL > tdpm.tdpm & if NOT exist tdpm.tdpm (set permission=0 & set msg=%upd1% & goto updateupscaling) else (del /f /s /q tdpm.tdpm >nul 2>&1 & set permission=1 & goto updatev1)
::
::
:: If the script has enough rights, then it'll verify if you pasted the root folder
:updatev1
cls
call :header
echo     Verifying....
if exist "%cd%\Sandfall" (set glocation=root & goto set_upscalers) else (goto updatev2)
::
::
:: If it's not the root folder, it'll verify if you pasted the .exe folder
:updatev2
cls
call :header
echo     Verifying....
if exist "*shipping.exe" (set glocation=exe & goto set_upscalers) else (goto cantupdate)
::
::
:set_upscalers
:: If you pasted root folder, the script will store the dlss and xess folders as variables and go to update confirmation.
if %glocation%==root (call :set_upscalers_folders & goto canupdate)
:: If you pasted .exe folder, the script will go up three times to the root folder, set the dlss and xess folders as variables and go to update confirmation.
if %glocation%==exe (cd .. & cd .. & cd .. & call :set_upscalers_folders & goto canupdate)
::
:set_upscalers_folders
set "dlssfolder=%cd%\Sandfall\Plugins\NVIDIA\DLSS\Binaries\ThirdParty\Win64\"
set "xessfolder=%cd%\Engine\Plugins\Marketplace\XeSS\Binaries\ThirdParty\Win64\"
if NOT exist "%dlssfolder%nvngx_dlss.dll" set msg=%upd2% & goto updateupscaling
if NOT exist "%xessfolder%libxess.dll" set msg=%upd2% & goto updateupscaling
goto:eof
::
::
:: After all the verifications you'll go to this small confirmation menu.
:canupdate
set msg=%upd0%
cls
call :header
echo:
echo %fg%    Verification done^^!
echo     Everything is ok and it's safe to continue^^!
echo:
echo     %fo1%[1]%fw% Update DlSS and XESS
echo     %fo1%[2]%fw% Go back to main menu
echo:
set /p updtchoice=%fo1%----[
if %updtchoice%==1 goto startupdate
if %updtchoice%==2 set msg=%blnk% & goto menu
set msg=%msgf% & goto canupdate
::
::
:: If something went wrong on verification stage you'll go back to the UpdateUpscaling menu.
:cantupdate
popd & if %permission%==1 (set msg=%upd3% & goto updateupscaling) else (set msg=%upd2% & goto updateupscaling)
::
::
:: If everything is ok this will begin the update process.
:startupdate
cls
call :header
::
::
:: If not present, creates a folder called "DLSS_XESS" on users temporary folder.
if NOT exist "%temp%\DLSS_XESS" (md "%temp%\DLSS_XESS")
echo:
::
::
:: Downloads DLSS 4 DLL from NVIDIA's DLSS github page
echo %fw%    Downloading DLSS 4 DLLs%fo1%[1/2]
curl -# -o "%temp%\DLSS_XESS\nvngx_dlss.dll" "https://raw.githubusercontent.com/NVIDIA/DLSS/refs/heads/main/lib/Windows_x86_64/rel/nvngx_dlss.dll"
echo %fw%[2A    Downloading DLSS 4 DLLs%fo1%[2/2]
curl -# -o "%temp%\DLSS_XESS\nvngx_dlssd.dll" "https://raw.githubusercontent.com/NVIDIA/DLSS/refs/heads/main/lib/Windows_x86_64/rel/nvngx_dlssd.dll"

echo:
::
::
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


:: This clears + unlock the Exp33 cache
:clearcache
for %%G in (ushaderprecache upipelinecache jnl) do (del /f /q "%LocalAppData%\Sandfall\Saved\*.%%G" >nul 2>&1)
goto:eof

:: This Locks the cache file
:lockcache
for %%G in ("%LocalAppData%\Sandfall\Saved\Sandfall_PCD3D_SM6.upipelinecache") do (type NUL > %%G & ATTRIB +R %%G >nul 2>&1)
goto:eof
