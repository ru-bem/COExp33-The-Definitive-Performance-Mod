@echo off

echo : Clair Obscur: Expedition 33 :
echo [97m:: No Intro Patch  by Caites ::[m
echo:&echo:

if exist "%localappdata%\Sandfall\Saved\" (goto patch) else (goto notfound)

:patch
echo Applying Patch...
for %%G in (ushaderprecache upipelinecache) do (del /f /q "%localappdata%\Sandfall\Saved\*.%%G" >nul 2>&1)
for %%G in ("%LocalAppData%\Sandfall\Saved\Sandfall_PCD3D_SM6.upipelinecache") do (type NUL > %%G & ATTRIB +R %%G)
echo [32mPatch Applied^![m
echo:&echo:

echo [97mNow you can run the game normally through the store or wherever you installed it.[m
echo:
echo Closing this window in 10 seconds...
timeout /t 10 >nul
exit

:notfound
echo [31mThe required folder[m "%localappdata%\Sandfall\Saved\" [31mwas not found.[m
echo Verify if the game is installed and try again.
echo:
echo Closing this window in 10 seconds...
timeout /t 10 >nul