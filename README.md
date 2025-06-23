# 🎞🎨 Fujifilm Film Simulation LUT Pack  
*(Bridge / Camera Raw / Lightroom Classic)*

**Note: This only works for RAW (and sometimes DNG) files.**

Bring Fuji’s famous film looks to any RAW workflow—without owning a Fuji body.  
This pack supplies **true 3-D LUTs** wrapped as Creative Profiles plus
one-click **preset wrappers** for batch work in Adobe Bridge.

If you are seeking simulation through `.dcp` file only (perceptually no difference besides some minor histogram changes when I compared), see my other repo [Fujifilm-Camera-Profile-for-Sony-a7c2](https://github.com/TingfengLuo/Fujifilm-Camera-Profile-for-Sony-a7c2) (I won't update that repo with other models since it's too much trouble). You can also follow the procedure described in [FujifilmCameraProfiles](https://github.com/abpy/FujifilmCameraProfiles) to manually curate your own `.dcp` file tailored for your camera model.

## 📦 What's Included

| Film Simulation       | Color / Tone Character                                                                                        | Where It Shines                                                                       |
| --------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **Provia** | Balanced contrast and saturation, neutral skin tones, slightly cool neutrals.                                  | Everyday shooting; product shots; a safe “baseline” look.                             |
| **Velvia**    | High saturation (especially greens & blues), deep contrast, cool shadows.                                      | Landscapes, travel, any scene that benefits from punchy colour.                       |
| **Astia**      | Gentle contrast curve, muted saturation, pastel highlights, warm skin bias.                                    | Portraits, fashion, weddings—when you want flattering skin without flat shadows.      |
| **Classic Chrome**    | Low saturation, raised shadows, cyan-leaning blues, slight warm tint in mids—mimics vintage Kodachrome mags.   | Street, documentary, reportage with a “subtle retro” vibe.                            |
| **Classic Neg**       | Medium-high contrast, muted colours, green-cyan shadows, warm highlights—emulates Fujicolor Superia film.      | Urban scenes, gritty portraits, overcast daylight; looks great with grain.            |
| **Eterna**   | Very low saturation, soft highlight roll-off, protected shadows—built to grade like motion-picture print film. | Video, cinematic stills, high-dynamic-range scenes you’ll colour-grade later.         |
| **Pro Neg Std**       | Flat contrast, natural saturation, slight magenta bias, smooth tonal transitions.                              | Controlled-light studio portraits; colour-critical catalogue work.                    |
| **Pro Neg Hi**        | Same colour palette as Pro Neg Std but with boosted contrast and a touch more saturation.                      | Available-light portraits, events, interiors where you want a crisp yet natural look. |

## ✨ Features
These profiles:
- No EXIF spoofing, your RAWs remain intact
- Add Fuji’s film-simulation LUT on top of your Sony file after a neutral Adobe Standard Linear.dcp, so you get the Fuji vibe without losing sensor accuracy.
- Keep your original color matrices and lens profiles intact — no tint shifts, no broken optics data.

## 📁 File Description
* **`*LUT.xmp`** files ending in `LUT.xmp` are **Develop-preset wrappers**.  
  They do nothing except switch to the matching Creative Profile—handy for
  directly applying profile in Bridge.

* **`*.xmp`** files without *LUT* in the name are the real **Creative Profiles**.  
  They embed a 32-point `.cube` LUT from [FujifilmCameraProfiles](https://github.com/abpy/FujifilmCameraProfiles), and have **no camera model restriction**.

* **`.dcp`** is a **model-specific Adobe Standard Linear** base profile.
  It loads first so the LUT sees perfectly neutral color to ensure accuracy. 

## 🛠️ Installation & Usage

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

You can either copy the entire folder in or just by files. This won't have any impact for Adobe to process.
### 4. Relaunch Bridge / Photoshop / Camera Raw / Lightroom Classic / Lightroom
Camera Raw only reads the profile folders at launch, so close every Adobe app that uses ACR, then open one again.  
Now you can apply the profile when editing a RAW!


## 📷✅ Supported Models
| Brand | Model |
|-------|--------------|
| Sony  | a7c2 |


Will add more in the future, if I have time~

