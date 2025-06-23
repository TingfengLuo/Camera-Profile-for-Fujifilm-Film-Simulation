# 🎞 Fujifilm Film Simulation LUT Pack  
*(Bridge / Camera Raw / Lightroom Classic)*

**Note: This only works for RAW and DNG files.**

Bring Fuji’s famous film looks to any RAW workflow—without owning a Fuji body.
This pack supplies **true 3-D LUTs** wrapped as Creative Profiles plus
one-click **Preset wrappers** for batch work in Adobe Bridge.

* **`*LUT.xmp`** files ending in `LUT.xmp` are **Develop-preset wrappers**.  
  They do nothing except switch to the matching Creative Profile—handy for
  directly applying profile in Bridge.

* **`*.xmp`** files without *LUT* in the name are the real **Creative Profiles**.  
  They embed a 32-point `.cube` LUT from [FujifilmCameraProfiles](https://github.com/abpy/FujifilmCameraProfiles), and have **no camera model restriction**.

* **`.dcp`** is a **model-specific Adobe Standard Linear** base profile.
  It loads first so the LUT sees perfectly neutral color to ensure accuracy. 



These profiles:
- Apply Fujifilm's LookTable and ToneCurve on top of your Sony RAWs
- Preserve Sony’s native sensor matrices for correct color science
- Show up in **Adobe Camera Raw / Lightroom Classic** as **Creative profiles**
- No EXIF spoofing, no sensor mismatch.  


## 🚀 Installation & Usage

### 1. Download or Clone
```bash
git clone https://github.com/TingfengLuo/Camera-Profile-for-Fujifilm-Film-Simulation.git
```
### 2. Copy .dcp files to the correct profile folder

| OS      | Destination Folder                                              |
| ------- | --------------------------------------------------------------- |
| Windows | `C:\Users\<your-login>\AppData\Roaming\Adobe\CameraRaw\CameraProfiles\`|
| macOS   | `~/Library/Application Support/Adobe/CameraRaw/CameraProfiles/` |

:warning: **.dcp files only, do NOT include the folder.**
### 3. Copy the model specific LUT folder to the correct profile folder

| OS      | Destination Folder                                              |
| ------- | --------------------------------------------------------------- |
| Windows | `C:\Users\<your-login>\AppData\Roaming\Adobe\CameraRaw\Settings`|
| macOS   | `~/Library/Application Support/Adobe/CameraRaw/Settings/` |

You can either copy the entire folder in or just by files. This won't have any impact for Adobe to read it.
### 3. Relaunch Bridge / Photoshop / Camera Raw / Lightroom Classic / Lightroom
Camera Raw only reads the profile folders at launch, so close every Adobe app that uses ACR, then open one again.

### 4. Apply the profiles when editing a RAW
```
1. Open a .ARW file.
2. Click the browse profile icon:
```
![image](images/browse.png)
```
4. Expand Profiles:
```
![image](images/profile.png)
```
5. Select any of the Fuji profiles to apply
```
