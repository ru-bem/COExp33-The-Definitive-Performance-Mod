# COExp33 - The Definitive Performance Mod
##### Up to 127% Boost on FPS! (Using the performance preset + optimized settings﻿)
---
##### ⬇️ Only download this mod from [Nexus Mods](https://www.nexusmods.com/clairobscurexpedition33/mods/308) or from [Github](https://github.com/ru-bem/COExp33-The-Definitive-Performance-Mod/releases/latest). Please report if you see this being distributed anywhere else. <br><br> Also remember: This mod is and will be free forever.<br> If this made your game better and you'd like to say thanks, a donation helps a lot more than you can imagine!

[![](https://raw.githubusercontent.com/ru-bem/COExp33-The-Definitive-Performance-Mod/refs/heads/main/assets/kofi.png)](https://ko-fi.com/rubem) [![](https://raw.githubusercontent.com/ru-bem/COExp33-The-Definitive-Performance-Mod/refs/heads/main/assets/livepix.png)](https://livepix.gg/rubem)

--- 
### **AMD GPU owners:**<br>
This mod will fix most of the visual issues but may not provide a huge performance boost for you. It's not my fault. UE5.4 variables don't seem to scale well on some of your GPUs. But try it out!

### **NVIDIA and INTEL GPU owners:**<br>
Have fun!

---
<br>

# 📈 Presets
 <br>
 
- **🟢 Original:** +0% <br>
The game as intended by the developers. Play this way if you have enough performance!

- **🟰 Lossless:** +70% <br>
The closest possible to the original. This is almost free performance.

- ⚪ Quality: +80% <br>
Very high quality. Only small visual changes were made for more performance.

- ⚖️ Balanced: +105% <br>
Same as quality but with little less quality lumen and shadows (basically).

- ⏩ Performance: +127% <br>
A miracle. Expedition 33 fully playable without lumen. Huge performance increase.

- 🥔 Potato: +201% <br>
For low end PCs. Total focus on performance. Very ugly but playable.
Ajust the line r.Color.Mid=0.4 to control the brightness. The higher the value, the brighter the game will be.

- 💀 Monstrosity: +261% <br>
Hell. Broken visuals and unplayable devilishness. This costs your soul and shouldn't be used at all.

- 🎮 Steam Deck Quality <br>
Optimized for Steam Deck (30fps)
Use with XESS + Low Preset

- 🎮 Steam Deck Performance <br>
Optimized for Steam Deck (45fps)
Use with XESS + Low Preset
⚠️ Expect some visual issues on specific areas of the game using this preset.

Performance gains may vary depending on your hardware. This was tested on: **R5 3600 + RTX 2060 + 16gb RAM + DLSS 4**

<br>

# ⚙️ Installation

There are two methods to install the mod. I recommend you to use the automatic method, which is by far the easiest.
For both methods start by extracting the contents of the zip file.
<br>

### **Automatic mode:**
- After extracting the folder, run the "Auto Install" file.
- Type the number correponding to the preset you want to install, press [Enter] and have fun!

It's a fully commented batch script, so you can open it in a text editor and see exactly what each line of code does.
<br>

### **Manual mode:**
- Choose any preset and open it's folder. "2_Quality" for example.
- Copy all the files inside this preset folder.
- Press WIN+R, type %LocalAppData%\Sandfall\Saved\Config and press enter.
- Look for one of these two folders: "Windows" or "WinGDK" and open it.
- Now paste the files you copied here.
- You now should have 3 files inside this folder: Engine.ini, Scalability.ini and GameUserSettings.ini
- Run the game, go to Graphics options, use the optimized settings (more details below) and have fun!

For Steam deck the folder is: /home/.steam/steam/steamapps/compatdata/1903340/pfx/drive_c/users/steamuser/AppData/Local/Sandfall/Saved/Config/Windows/

<br>

# 🖥️ Simplified Optimized Settings

🟡 This mod scales well with in-game presets (Low, Medium, High and Epic).<br>
Feel free to try other combinations if you have a faster or slower setup.<br>
You can lower Shadows, Gi and Folliage for even better performance.<br>

🤩 High end GPUs (RTX 4070+): **High preset + Lossless ini**<br>
😎 Mid end GPUs (RTX 3060~): **High preset + Quality ini**<br>
😄 Mid-low end GPUs (RTX 2060~): **High preset + Quality ini**<br>
😊 Low end GPUs (RTX 3050~): **Medium preset + Balanced ini**<br>
😐 Very old GPUs (GTX 1050~): **Medium preset + Performance ini**<br>
💀 (GT 1030~): **Low preset + Potato ini**<br>

Scaling Type priority order: DLSS > XESS > TSR

<br>

# ⬆️ Update DLSS and XESS

Benefits:<br>
Much better looking upscaling  +  Slightly better performance  +  Less vram usage  +  Less ghosting

### Easiest method:
Auto Install comes with an option to automatically update DLSS and XESS.
- Open the script, Type [B] and press enter.
- Copy and Paste your game's folder location here then press enter.
- If the folder is valid you'll be prompted to confirm that you want to update. Type [1], press enter and wait until the end of the process.

### Manual method
DLSS 4:
- Download the latest version of the DLSS DLL from here:
https://raw.githubusercontent.com/NVIDIA/DLSS/refs/heads/main/lib/Windows_x86_64/rel/nvngx_dlss.dll﻿
- Copy and paste this file into: [gamefolder]\Sandfall\Plugins\NVIDIA\DLSS\Binaries\ThirdParty\Win64

XESS:
- Download the latest version of XESS using this link: https://github.com/intel/xess/releases/download/v2.0.1/XeSS_SDK_2.0.1.zip﻿
- Open the .zip, go to bin folder and extract the 4 .dll files (libxell, libxess, libxess_dx11 and libxess_fg) into:
[gamefolder]/Engine/Plugins/Marketplace/XeSS/Binaries/ThirdParty/Win64/

<br>

# 🖌️ Customizations
Here are some lines that you can add or change to your liking. This will be updated with new variables over time.
Copy and paste the custom line(s) at the very bottom inside any Engine.ini provided by this mod.

### Useful variables

Increase Saturation:<br>
```r.Color.Grading=0``` <br>
Default is =1


Reduce fog:<br>
```r.VolumetricFog.VoxelizationShowOnlyPassIndex=1```<br>
Default is =-1  |  Higher = Less fog


Increase View Distance:<br>
```r.ViewDistanceScale=2```<br>
Impacts performance  |  Requires a game or save reload  |  Lower = more performance + more pop-ins


### Fun variables

⚠️ Epilepsy Warning:<br>
```r.AntiAliasingMethod=0```<br>
```r.Color.Mid=0.2```<br>
```r.Color.Grading=0```<br>
```r.EyeAdaptation.LensAttenuation=0```<br>
```r.Lumen.Reflections.SpecularScale=150```<br>
```r.Lumen.ScreenProbeGather.Temporal=0```<br>
```r.SkylightIntensityMultiplier=0```<br>

Inverted World (Pretty cool):<br>
```r.Lumen.Reflections.SpecularScale=50```<br>
```r.SkylightIntensityMultiplier=1000```<br>
```r.Color.Mid=0.3```<br>

Low Poly World:<br>
```r.Nanite.MaxPixelsPerEdge=1e8```<br>
```r.SkeletalMeshLODBias=10```<br>
```r.MipMapLodBias=10```<br>

Can it run EXP33? - Huge FPS drop:<br>
```r.Nanite.MaxPixelsPerEdge=0```<br>
<br>

---
Thank you for being awesome!<br>
Your feedback is appreciated!

[![](https://raw.githubusercontent.com/ru-bem/COExp33-The-Definitive-Performance-Mod/refs/heads/main/assets/kofi.png)](https://ko-fi.com/rubem) [![](https://raw.githubusercontent.com/ru-bem/COExp33-The-Definitive-Performance-Mod/refs/heads/main/assets/livepix.png)](https://livepix.gg/rubem) <br>
Have fun!

---
##### Helpers:
###### Yuhgmapacho, Gadren, anothernexusmods, jebzc01, type7transporter
