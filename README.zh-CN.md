# 🎞️ 富士胶片模拟创意配置文件

*(Bridge / Camera Raw / Lightroom Classic)*

[English](README.md) | 简体中文

**注意：仅适用于 RAW 文件，部分 DNG 文件也可能适用。**

不用富士相机，也能在 RAW 后期中用上富士经典的胶片色彩。

这套创意配置文件（Creative Profiles）**不限制相机型号**，支持的**相机、手机和无人机**都能使用同一套胶片风格，还附带预设，方便批量套用。使用时，只需搭配与设备型号对应的 Adobe Standard Linear 基础配置文件，无需修改 RAW 文件中的相机型号信息。

[安装方法](#安装方法) · [工作原理](#工作原理) · [支持的型号](#支持的型号)

## 🎬 效果对比

<table>
  <tr>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Original.jpg" alt="原图" width="100%"><br/>
      <sub><b>原图</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Classic%20Neg.jpg" alt="Classic Neg 效果" width="100%"><br/>
      <sub><b>Classic Neg</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Classic%20Chrome.jpg" alt="Classic Chrome 效果" width="100%"><br/>
      <sub><b>Classic Chrome</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Astia.jpg" alt="Astia 效果" width="100%"><br/>
      <sub><b>Astia</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Provia.jpg" alt="Provia 效果" width="100%"><br/>
      <sub><b>Provia</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Velvia.jpg" alt="Velvia 效果" width="100%"><br/>
      <sub><b>Velvia</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Eterna.jpg" alt="Eterna 效果" width="100%"><br/>
      <sub><b>Eterna</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Pro%20Neg%20Std.jpg" alt="Pro Neg Std 效果" width="100%"><br/>
      <sub><b>Pro Neg Std</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Pro%20Neg%20Hi.jpg" alt="Pro Neg Hi 效果" width="100%"><br/>
      <sub><b>Pro Neg Hi</b></sub>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Reala%20Ace.jpg" alt="Reala Ace 效果" width="100%"><br/>
      <sub><b>Reala Ace</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Bleach%20Bypass.jpg" alt="Bleach Bypass 效果" width="100%"><br/>
      <sub><b>Bleach Bypass</b></sub>
    </td>
    <td align="center" valign="top" width="33%">
      <img src="demo%20images/Nostalgic%20Neg.jpg" alt="Nostalgic Neg 效果" width="100%"><br/>
      <sub><b>Nostalgic Neg</b></sub>
    </td>
  </tr>
</table>

## 胶片模拟风格

| 风格 | 色彩特点 | 适合题材 |
| --- | --- | --- |
| **Provia** | 色彩自然，对比适中 | 日常摄影 |
| **Velvia** | 色彩鲜艳，对比强烈 | 风光、旅行 |
| **Astia** | 色彩温和，对比柔和 | 人像摄影 |
| **Classic Chrome** | 低饱和度，色彩克制 | 街拍、纪实 |
| **Classic Neg** | 对比强烈，色调富有冷暖变化 | 城市街拍、阴天拍摄 |
| **Eterna** | 低饱和度，对比柔和 | 追求电影氛围的拍摄 |
| **Pro Neg Std** | 色彩自然，低对比 | 棚拍人像 |
| **Pro Neg Hi** | 人像色彩自然，对比更鲜明 | 活动记录、环境人像 |
| **Nostalgic Neg** | 高光偏暖，整体色调柔和 | 日出日落、生活记录 |
| **Reala Ace** | 色彩自然，影调层次丰富 | 日常拍摄、混合光源场景 |
| **Bleach Bypass** | 低饱和度，高对比 | 氛围强烈的城市题材 |

## 工作原理

这套配置文件保留了 **Adobe 针对各款相机的色彩校准数据**，包括颜色矩阵、色相偏移、饱和度和亮度的缩放系数、查找表的编码方式，以及配置文件中的曝光偏移量。DCP 转换的思路是移除用于附加风格的 Adobe LookTable，并将原有的色调曲线改为直线，在保留相机色彩校正的同时，为胶片 LUT 提供不叠加原有对比曲线和风格的基础。创意配置文件在此基础上调用 **Adobe Standard Linear**，再应用所选胶片风格内嵌的 3D LUT。`.dcp` 基础配置文件需要与设备型号对应，创意配置文件则可以跨型号通用。整个转换过程只处理配置文件，不会改动 RAW 数据、白平衡、相机型号或镜头等元数据，也不需要修改 EXIF 来伪装相机型号。

| 文件 | 用途 |
| --- | --- |
| `Adobe Standard Linear Profile/*.dcp` | 与相机型号匹配的基础配置文件 |
| `Fujifilm Simulation LUT/*.xmp` | 包含胶片 LUT 的创意配置文件，LUT 来自 [FujifilmCameraProfiles](https://github.com/abpy/FujifilmCameraProfiles) |
| `Fujifilm Simulation LUT/*wrapper.xmp` | 一键调用对应创意配置文件的预设 |

## 安装方法

### 1. 下载文件

打开[项目页面](https://github.com/TingfengLuo/Camera-Profile-for-Fujifilm-Film-Simulation)，点击 **Code → Download ZIP** 下载压缩包并解压。也可以用以下命令下载：

```bash
git clone https://github.com/TingfengLuo/Camera-Profile-for-Fujifilm-Film-Simulation.git
```

### 2. 安装相机基础配置文件

根据你的操作系统，将 [Adobe Standard Linear Profile](Adobe%20Standard%20Linear%20Profile/) 文件夹中的 `.dcp` 文件复制到以下位置：

| 系统 | 基础配置文件存放位置 |
| --- | --- |
| Windows | `C:\Users\<your-login>\AppData\Roaming\Adobe\CameraRaw\CameraProfiles\` |
| macOS | `/Users/<your-login>/Library/Application Support/Adobe/CameraRaw/CameraProfiles/` |

路径中的 `<your-login>` 是你的电脑账户名。例如，账户名为 `leumas` 时，Windows 下的完整路径就是 `C:\Users\leumas\AppData\Roaming\Adobe\CameraRaw\CameraProfiles\`。

⚠️ **这里只复制 .dcp 文件，不要复制整个文件夹。**

### 3. 安装胶片模拟配置文件

将整个 [Fujifilm Simulation LUT](Fujifilm%20Simulation%20LUT/) 文件夹（包含全部 22 个 `.xmp` 文件）复制到：

| 系统 | 创意配置文件与预设存放位置 |
| --- | --- |
| Windows | `C:\Users\<your-login>\AppData\Roaming\Adobe\CameraRaw\Settings\` |
| macOS | `/Users/<your-login>/Library/Application Support/Adobe/CameraRaw/Settings/` |

这一步可以复制整个文件夹，也可以只复制里面的文件，不影响使用。

### 4. 重启软件，开始使用

关闭并重新打开 Adobe 软件，再打开一张受支持的 RAW 照片。你可以在配置文件浏览器（Profile Browser）中找到并选择喜欢的胶片风格，也可以直接使用 **Fujifilm Film Simulation** 预设组中的对应预设。文件名带有 `wrapper` 的预设用于调用同名的创意配置文件，方便在 Bridge 中批量套用。

<details>
<summary><strong>安装后找不到配置文件？</strong></summary>

- 确认打开的是 RAW 文件，并且已经安装了该设备对应的 `.dcp` 文件。
- 检查文件是否放对位置：`.dcp` 放在 `CameraProfiles`，`.xmp` 放在 `Settings`。
- 不要只安装 `wrapper` 预设；它需要搭配对应的创意配置文件才能使用。
- 复制完成后，关闭并重新打开软件。

</details>

## 支持的型号

仓库目前提供 **1,464 个 `.dcp` 文件**，涵盖 Camera Raw 18.4 及之前版本支持的型号。部分文件名采用设备内部的型号标识，因此可能与 Adobe 列表中的名称不完全一致。

先展开对应品牌，再按 **Ctrl+F**（Windows）或 **Command+F**（macOS）搜索型号。列表保留了不同地区的型号名称及不同摄像头模组的标注。

<details>
<summary><strong>Apple</strong> &middot; 113 条</summary>

- iPhone 17e Front Camera
- iPhone 17e Rear Camera
- iPhone 17 Front Camera
- iPhone 17 Ultrawide Camera
- iPhone 17 Wide Camera
- iPhone 17 Pro Front Camera
- iPhone 17 Pro Telephoto Camera
- iPhone 17 Pro Ultrawide Camera
- iPhone 17 Pro Wide Camera
- iPhone 17 Pro Max Front Camera
- iPhone 17 Pro Max Telephoto Camera
- iPhone 17 Pro Max Ultrawide Camera
- iPhone 17 Pro Max Wide Camera
- iPhone Air Front Camera
- iPhone Air Wide Camera
- iPhone 16e Front Camera
- iPhone 16e Wide Camera
- iPhone 16 Front Camera
- iPhone 16 Ultrawide Camera
- iPhone 16 Wide Camera
- iPhone 16 Plus Front Camera
- iPhone 16 Plus Ultrawide Camera
- iPhone 16 Plus Wide Camera
- iPhone 16 Pro Front Camera
- iPhone 16 Pro Telephoto Camera
- iPhone 16 Pro Ultrawide Camera
- iPhone 16 Pro Wide Camera
- iPhone 16 Pro Max Front Camera
- iPhone 16 Pro Max Telephoto Camera
- iPhone 16 Pro Max Ultrawide Camera
- iPhone 16 Pro Max WIde Camera
- iPhone 15 Plus Ultrawide Camera
- iPhone 15 Pro Telephoto Camera
- iPhone 15 Pro Front Camera
- iPhone 15 Pro Wide Camera
- iPhone 15 Pro Ultrawide Camera
- iPhone 15 Pro Max Front Camera
- iPhone 15 Pro Max Telephoto Camera
- iPhone 15 Pro Max Ultrawide Camera
- iPhone 15 Pro Max Wide Camera
- iPhone 14 Front Camera
- iPhone 14 Ultrawide Camera
- iPhone 14 Wide Camera
- iPhone 14 Plus Front Camera
- iPhone 14 Plus Ultrawide Camera
- iPhone 14 Plus Wide Camera
- iPhone 14 Pro Front Camera
- iPhone 14 Pro Telephoto Camera
- iPhone 14 Pro Ultrawide Camera
- iPhone 14 Pro Wide Camera
- iPhone 14 Pro Max Front Camera
- iPhone 14 Pro Max Telephoto Camera
- iPhone 14 Pro Max Ultrawide Camera
- iPhone 14 Pro Max Wide Camera
- iPhone 13 Front Camera
- iPhone 13 Rear Ultrawide Camera
- iPhone 13 Rear Wide Camera
- iPhone 13 mini Front Camera
- iPhone 13 mini Rear Ultrawide Camera
- iPhone 13 mini Rear Wide Camera
- iPhone 13 Pro Front Camera
- iPhone 13 Pro Rear Telephoto Camera
- iPhone 13 Pro Rear Ultrawide Camera
- iPhone 13 Pro Rear Wide Camera
- iPhone 13 Pro Max Front Camera
- iPhone 13 Pro Max Rear Telephoto Camera
- iPhone 13 Pro Max Rear Ultrawide Camera
- iPhone 13 Pro Max Rear Wide Camera
- iPhone 12 Rear Wide Camera
- iPhone 12 Mini Rear Wide Camera
- iPhone 12 Ultrawide camera
- iPhone 12 Mini Ultrawide camera
- iPhone 12 Pro Front Camera
- iPhone 12 Pro Rear Wide Camera
- iPhone 12 Pro Rear Telephoto Camera
- iPhone 12 Pro Rear Ultra Wide Camera
- iPhone 12 Pro Max Front Camera
- iPhone 12 Pro Max Rear Wide Camera
- iPhone 12 Pro Max Rear Telephoto Camera
- iPhone 12 Pro Max Rear Ultra Wide Camera
- iPhone 11
- iPhone 11 Pro
- iPhone 11 Pro Max
- iPad Pro 9.7" (Wifi and Cellular)
- iPad Pro 11-inch (2nd generation)
- iPad Pro 11-inch (3rd generation)
- iPad Pro 11-inch (4th generation) Wide Camera
- iPad Pro 11-inch (2018 model)
- iPad Pro 11-inch M4 (2024 version) Wide Camera
- iPad Air 11-inch M2 (2024 version) Wide Camera
- iPad Pro 12.9-inch (4th generation)
- iPad Pro 12.9-inch (5th generation)
- iPad Pro 12.9-inch (6th generation) Wide Camera
- iPad Pro 12.9-inch (2018 model)
- iPad Pro 13-inch M4 (2024 version) Wide Camera
- iPad mini (6th Generation) Rear Camera
- iPhone 6s
- iPhone 6s Plus
- iPhone 7
- iPhone 7 Plus
- iPhone 8
- iPhone 8 Plus
- iPhone SE (2020 version)
- iPhone SE
- iPhone X
- iPhone XR
- iPhone XS
- iPhone XS Max
- iPad Air (5th generation) Rear Camera
- iPhone SE (3rd generation) Front Camera
- iPhone SE (3rd generation) Rear Camera
- iPad (10th Generation) Wide Camera
- iPad mini (A17 Pro) Rear Camera

</details>

<details>
<summary><strong>Canon</strong> &middot; 133 条</summary>

- EOS-1D
- EOS-1D C
- EOS-1D Mark II
- EOS-1D Mark II N
- EOS-1D Mark III
- EOS-1D Mark IV
- EOS-1Ds
- EOS-1Ds Mark II
- EOS-1Ds Mark III
- EOS-1D X
- EOS-1D X Mark II
- EOS-1D X Mark III
- EOS 5D
- EOS 5D Mark II
- EOS-5D Mark III
- EOS-5D Mark IV
- EOS 5DS
- EOS 5DS R
- EOS 6D
- EOS 6D Mark II
- EOS 7D
- EOS 7D Mark II
- EOS 10D
- EOS 20D
- EOS 20Da
- EOS 30D
- EOS 40D
- EOS 50D
- EOS 60D
- EOS 60Da
- EOS 70D
- EOS 77D (EOS 9000D)
- EOS 80D
- EOS 90D
- EOS 200D (EOS Kiss X9, EOS Rebel SL2)
- EOS 250D (EOS Rebel SL3, EOS 200D II, EOS Kiss X10)
- EOS D30
- EOS D60
- EOS 300D (EOS Digital Rebel, EOS Kiss Digital)
- EOS 100D (EOS Digital Rebel SL1, EOS Kiss X7)
- EOS 500D (EOS Digital Rebel T1i, EOS Kiss X3 Digital)
- EOS 550D (EOS Digital Rebel T2i, EOS Kiss X4 Digital)
- EOS 1100D (EOS Digital Rebel T3, EOS Kiss X50 Digital)
- EOS 600D (EOS Digital Rebel T3i, EOS Kiss X5 Digital)
- EOS 650D (EOS Digital Rebel T4i, EOS Kiss X4i)
- EOS 700D (EOS Digital Rebel T5i, EOS Kiss X7i)
- EOS 1200D (EOS Digital Rebel T5, EOS Kiss X70)
- EOS 1300D (EOS Digital Rebel T6, EOS Kiss X80)
- EOS 1500D (EOS Rebel T7, EOS Kiss X90, EOS 2000D)
- EOS 3000D (EOS Rebel T100, EOS 4000D)
- EOS 750D (EOS Digital Rebel T6i, EOS Kiss X8i)
- EOS 760D (EOS Digital Rebel T6s, EOS Kiss 8000D)
- EOS 800D (EOS Digital Rebel T7i, EOS Kiss X9i)
- EOS 850D (EOS Kiss X10i, EOS Rebel T8i)
- EOS 1000D (EOS Digital Rebel XS, EOS Kiss F)
- EOS 450D (EOS Digital Rebel XSi, EOS Kiss Digital X2)
- EOS 350D (EOS Digital Rebel XT, EOS Kiss Digital N)
- EOS 400D (EOS Digital Rebel XTi, EOS Kiss Digital X)
- EOS C50
- EOS M
- EOS M2
- EOS M200
- EOS M3
- EOS M5
- EOS M50 Mark II
- EOS M6
- EOS M6 Mark II
- EOS M10
- EOS M50 (EOS Kiss M)
- EOS M100
- EOS R
- EOS R1
- EOS R3
- EOS R5
- EOS R5 C
- EOS R5 Mark II
- EOS R6
- EOS R6 V
- EOS R6 Mark II
- EOS R6 Mark III
- EOS R7
- EOS R10
- EOS Ra
- EOS RP
- EOS R8
- EOS R50
- EOS R50 V
- EOS R100
- PowerShot 600
- PowerShot A5
- PowerShot A50
- PowerShot G1
- PowerShot G1 X
- PowerShot G1 X Mark II
- PowerShot G1 X Mark III
- PowerShot G2
- PowerShot G3
- PowerShot G3 X
- PowerShot G5
- PowerShot G5 X
- PowerShot G5 X Mark II
- PowerShot G6
- PowerShot G7 X
- PowerShot G7 X Mark II
- PowerShot G7 X Mark III
- PowerShot G9
- PowerShot G9X
- PowerShot G9 X Mark II
- PowerShot G10
- PowerShot G11
- PowerShot G12
- PowerShot G15
- PowerShot G16
- PowerShot Pro 1
- PowerShot Pro70
- PowerShot Pro90 IS
- PowerShot S30
- PowerShot S40
- PowerShot S45
- PowerShot S50
- PowerShot S60
- PowerShot S90
- PowerShot S95
- PowerShot S70
- PowerShot S100
- PowerShot S100V
- PowerShot S110
- PowerShot S120
- PowerShot SX1 IS
- PowerShot SX50
- PowerShot SX60 HS
- PowerShot SX70 HS
- PowerShot V1

</details>

<details>
<summary><strong>Casio</strong> &middot; 26 条</summary>

- EXILIM EX-10
- EXILIM EX-100
- EXILIM EX-100F
- EXILIM EX-100PRO
- EXILIM EX-FC300S
- EXILIM EX-FH100
- EXILIM EX-ZR700
- EXILIM EX-ZR710
- EXILIM EX-ZR750
- EXILIM EX-ZR800
- EXILIM EX-ZR850
- EXILIM EX-ZR1000
- EXILIM EX-ZR1100
- EXILIM EX-ZR1200
- EXILIM EX-ZR1300
- EXILIM EX-ZR1500
- EXILIM EX-ZR3000
- EXILIM EX-ZR3100
- EXILIM EX-ZR3200
- EXILIM EX-ZR3500
- EXILIM EX-ZR3600
- EXILIM EX-ZR3700
- EXILIM EX-ZR4000
- EXILIM EX-ZR4100
- EXILIM EX-ZR5000
- EXILIM EX-ZR5100

</details>

<details>
<summary><strong>Contax</strong> &middot; 1 条</summary>

- N Digital

</details>

<details>
<summary><strong>DJI</strong> &middot; 21 条</summary>

- DJI Mavic 2 Pro (Hasselblad L1D-20c)
- DJI AIR 2S
- DJI Mini 2
- DJI Air 3 Wide Camera
- DJI Air 3 Telephoto Camera
- DJI Mini 3 Pro
- DJI Mini 4 Pro
- DJI Mavic 3 Classic (Hasselblad L2D-20c)
- DJI Mavic 3 Cine Super Telephoto Camera
- DJI Mavic 3 Cine (Hasselblad L2D-20c)
- DJI Mavic 3 Pro Super Telephoto Camera
- DJI Mavic 3 Pro Telephoto Camera
- DJI Mavic 3 Pro (Hasselblad L2D-20c)
- DJI Mavic 3 (Hasselblad L2D-20c)
- DJI Osmo Pocket 3 D
- DJI Air 3S Telephoto Camera
- DJI Air 3S Wide Camera
- DJI Osmo Action 5 Pro
- DJI Mavic 4 Pro (DJI FC9284)
- DJI Mavic 4 Pro (DJI FC9287)
- DJI Mavic 4 Pro (Hasselblad L3D-100c)

</details>

<details>
<summary><strong>DxO</strong> &middot; 1 条</summary>

- DxO ONE

</details>

<details>
<summary><strong>Epson</strong> &middot; 3 条</summary>

- R-D1
- R-D1s
- R-D1x

</details>

<details>
<summary><strong>Fujifilm</strong> &middot; 101 条</summary>

- GFX 50R
- GFX 50S
- GFX 50S II
- GFX 100
- GFX 100 II
- GFX 100 II IR
- GFX 100 IR
- GFX 100S
- GFX 100S II
- GFX 100S II – 4 Camera Matching Profiles
- GFX 100RF (Final Support)
- FinePix E900
- FinePix F505 EXR
- FinePix F550 EXR
- FinePix F600 EXR
- FinePix F605 EXR
- FinePix F700
- FinePix F770 EXR
- FinePix F775 EXR
- FinePix F800 EXR
- FinePix F900 EXR
- FinePix HS10
- FinePix HS20 EXR
- FinePix HS22 EXR
- FinePix HS30 EXR
- FinePix HS33 EXR
- FinePix HS35 EXR
- FinePix HS50 EXR
- FinePix IS-1
- FinePix IS Pro
- FinePix S1
- FinePix S100fs
- FinePix S2 Pro
- FinePix S20 Pro
- FinePix S200 EXR
- FinePix S205 EXR
- FinePix S3 Pro
- FinePix S5 Pro
- FinePix S5000 Z
- FinePix S5200 (FinePix S5600)
- FinePix S6000fd (FinePix S6500fd)
- FinePix S7000 Z
- FinePix S9000 (FinePix S9500)
- FinePix S9100 (FinePix S9600)
- FinePix SL1000
- FinePix X10
- FinePix X100
- FinePix X-M1
- FinePix X-S1
- X100F
- X100S
- X100T
- X100V
- X100VI
- X100VI – 4 Camera Matching Profiles
- X20
- X30
- X70
- X-A1
- X-A2
- X-A3
- X-A5
- X-A7
- X-A10
- X-A20
- X-E1
- X-E2
- X-E2S
- X-E3
- X-E4
- X-E5
- X-H1
- X-H2 IR
- X-H2S
- X-M5
- X-Pro1
- X-Pro2
- X-Pro3
- X-S10
- X-S20
- X-T1
- X-T1 IR
- X-T2
- X-T3
- X-T4
- X-T5
- X-T10
- X-T20
- X-T30
- X-T30 II
- X-T30 III
- X-T50
- XT50 V2 – 4 Camera Matching Profiles
- X-T100
- X-T200
- XF1
- XF10
- XQ1
- XQ2
- X-H2
- REALA ACE Film Simulation Camera Matching Profiles for XH2S, X-S20

</details>

<details>
<summary><strong>Google</strong> &middot; 88 条</summary>

- Pixel
- Pixel XL
- Pixel 2
- Pixel 2 XL
- Pixel 3
- Pixel 3 Front Standard Camera
- Pixel 3 Front Wide Camera
- Pixel 3 XL
- Pixel 3 XL Front Standard Camera
- Pixel 3 XL Front Wide Camera
- Pixel 4
- Pixel 4 XL
- Pixel 5 Front Camera
- Pixel 5 Rear Main Camera
- Pixel 5 Rear Ultra Wide Camera
- Pixel 6 Front Camera
- Pixel 6 Rear Main Camera
- Pixel 6 Rear Ultrawide Camera
- Pixel 6 Pro Front Camera
- Pixel 6 Pro Rear Main Camera
- Pixel 6 Pro Rear Telephoto Camera
- Pixel 6 Pro Rear Ultrawide Camera
- Pixel 7 Front Camera
- Pixel 7 Ultrawide Camera
- Pixel 7 Wide Camera
- Pixel 7 Pro Front Camera
- Pixel 7 Pro Telephoto Camera
- Pixel 7 Pro Ultrawide Camera
- Pixel 7 Pro Wide Camera
- Pixel 4a Front Camera
- Pixel 4a Rear Wide Camera
- Pixel 5a Front Camera
- Pixel 5a Rear Main Camera
- Pixel 5a Rear Ultra Wide Camera
- Pixel 6a Front Camera
- Pixel 6a Rear Main Camera
- Pixel 6a Rear Ultrawide Camera
- Pixel 7a Front Camera
- Pixel 7a Ultrawide Camera
- Pixel 7a Wide Camera
- Pixel 8 Front Camera
- Pixel 8 Ultrawide Camera
- Pixel 8 Wide Camera
- Pixel 8 Pro Front Camera
- Pixel 8 Pro Telephoto Camera
- Pixel 8 Pro Ultrawide Camera
- Pixel 8 Pro Wide Camera
- Pixel 8a Front Camera
- Pixel 8a Ultrawide Camera
- Pixel 8a Wide Camera
- Pixel 9 Front Camera
- Pixel 9 Ultrawide Camera
- Pixel 9 Wide Camera
- Pixel 9 Pro Front Camera
- Pixel 9 Pro Telephoto Camera
- Pixel 9 Pro Ultrawide Camera
- Pixel 9 Pro Wide Camera
- Pixel 9 Pro XL Front Camera
- Pixel Pixel 9 Pro XL Telephoto Camera
- Pixel Pixel 9 Pro XL Ultrawide Camera
- Pixel 9 Pro XL Wide Camera
- Pixel 9 Pro Fold Front Camera
- Pixel 9 Pro Fold Telephoto Camera
- Pixel 9 Pro Fold Ultrawide Camera
- Pixel 9 Pro Fold Wide Camera
- Pixel 9a Front Camera
- Pixel 9a Ultrawide Camera
- Pixel 9a Wide Camera
- Pixel 10 Pro Front Camera
- Pixel 10 Pro Telephoto Camera
- Pixel 10 Pro Ultrawide Camera
- Pixel 10 Pro Wide Camera
- Pixel 10 Pro XL Front Camera
- Pixel 10 Pro XL Telephoto Camera
- Pixel 10 Pro XL Ultrawide Camera
- Pixel 10 Pro XL Wide Camera
- Pixel 10 Front Camera
- Pixel 10 Telephoto Camera
- Pixel 10 Ultrawide Camera
- Pixel 10 Wide Camera
- Pixel 10 Pro Fold Front Camera
- Pixel 10 Pro Fold Telephoto Camera
- Pixel 10 Pro Fold Ultrawide Camera
- Pixel 10 Pro Fold Wide Camera
- Pixel Fold Inner Camera
- Pixel Fold Telephoto Camera
- Pixel Fold Ultrawide Camera
- Pixel Fold Wide Camera

</details>

<details>
<summary><strong>GoPro</strong> &middot; 11 条</summary>

- FUSION
- HERO5 Black
- HERO6 Black
- HERO7 Black
- HERO10 Black
- HERO12 Black
- HERO13 Black
- MISSION 1
- MISSION 1 PRO
- GoPro MISSION 1
- GoPro MISSION 1 PRO

</details>

<details>
<summary><strong>Hasselblad</strong> &middot; 34 条</summary>

- 503CWD
- A6D-100c
- CF-22
- CF-22MS
- CF-39
- CF-39MS
- CFH-22
- CFH-39
- CFV
- CFV-50c
- H2D
- H2D-22
- H2D-39
- H3D-22
- H3D-39
- H3DII-22
- H3DII-31
- H3DII-39
- H3DII-39MS
- H3DII-50
- H4D-40
- H4D-60
- H5D-40
- H5D-50
- H5D-50c
- H5D-60
- H6D-100c
- HV
- Lunar
- Stellar II
- X1D
- X2D II 100C
- X1D II 50C
- X2D 100C

</details>

<details>
<summary><strong>Huawei</strong> &middot; 11 条</summary>

- Honor 20 Pro Rear Main Camera
- Honor 20 Pro Rear Telephoto Camera
- Honor 20 Pro Rear Wide Camera
- Mate 10 Pro
- P30 Rear Main Camera
- P30 Rear Telephoto Camera
- P30 Rear Wide Camera
- P30 Pro Rear Main Camera
- P30 Pro Rear Telephoto Camera
- P30 Pro Rear Wide Camera
- P9 Lite

</details>

<details>
<summary><strong>Insta360</strong> &middot; 2 条</summary>

- Ace Pro 2
- GO Ultra

</details>

<details>
<summary><strong>Kodak</strong> &middot; 12 条</summary>

- DCS 14n
- DCS 720x
- DCS 760
- DCS Pro 14nx
- DCS Pro SLR/n
- EasyShare P712
- EasyShare P850
- EasyShare P880
- EasyShare Z1015 IS
- EasyShare Z980
- EasyShare Z981
- EasyShare Z990

</details>

<details>
<summary><strong>Konica Minolta</strong> &middot; 11 条</summary>

- Alpha-5 Digital (China)
- Alpha Sweet Digital (Japan)
- DiMAGE 5
- DiMAGE 7
- DiMAGE 7i
- DiMAGE 7Hi
- DiMAGE A1
- DiMAGE A2
- DiMAGE A200
- Maxxum 5D Dynax 5D
- Maxxum 7D Dynax 7D

</details>

<details>
<summary><strong>Leaf</strong> &middot; 22 条</summary>

- AFi II 6
- AFi II 7
- Aptus 17
- Aptus 22
- Aptus 54s
- Aptus 65
- Aptus 75
- Aptus 75s
- Aptus-II 5
- Aptus-II 6
- Aptus-II 7
- Aptus-II 8
- Aptus-II 10R
- Aptus-II 12
- Valeo 6
- Valeo 11
- Valeo 17
- Valeo 22
- Credo 40
- Credo 50
- Credo 60
- Credo 80

</details>

<details>
<summary><strong>Leica</strong> &middot; 61 条</summary>

- C (Typ 112)
- CL
- C-Lux
- D-Lux 2
- D-Lux 3
- D-Lux 4
- D-Lux 5
- D-Lux 6
- D-Lux 7
- D-Lux (Typ 109)
- D-Lux 8
- D-Lux 8 "100 Years of Leica"
- Digilux 2
- Digilux 3
- Digital-Modul-R
- Leitz Phone 3
- M8
- M9
- M10
- M10-D
- M10-P
- M10-R
- M11-D
- M (Typ 262)
- M-D (Typ 262)
- M-E
- M-EV1
- M-P
- M Monochrom
- M Monochrom (Typ 246)
- M10 Monochrom
- M11
- M11 MONOCHROM
- M11-P
- Q (Typ 116)
- Q2
- Q2 Monochrom
- Q3
- Q3 43
- Q3 Monochrom
- S2
- S (Typ 007)
- S3
- SL (Typ 601)
- SL2
- SL2-S
- SL3
- SL3-P
- SL3-S
- T (Typ 701)
- TL
- TL2
- V-LUX 1
- V-LUX 2
- V-LUX 3
- V-LUX 4
- V-LUX 5
- V-LUX (Typ 114)
- X2
- X (Typ 113)
- X-U (Typ 113)

</details>

<details>
<summary><strong>LG</strong> &middot; 18 条</summary>

- G7 ThinQ
- G8 ThinQ Front Camera
- G8 ThinQ Rear Main Camera
- G8 ThinQ Rear Wide Camera
- V40 ThinQ Front Standard Camera
- V40 ThinQ Rear Main Camera
- V40 ThinQ Rear Wide Camera
- V50s ThinQ Front Camera
- V50s ThinQ Rear Main Camera
- V50s ThinQ Rear Wide Camera
- V60 ThinQ Front Camera
- V60 ThinQ Rear Main Camera
- Velvet Front Camera
- Velvet Rear Main Camera
- Velvet Rear Wide Camera
- Wing Rear Main Camera
- Wing Front Camera
- Wing Rear Wide Camera

</details>

<details>
<summary><strong>Light</strong> &middot; 1 条</summary>

- L16

</details>

<details>
<summary><strong>Mamiya</strong> &middot; 9 条</summary>

- Mamiya DM22
- Mamiya DM28
- Mamiya DM33
- Mamiya DM56
- Mamiya M18
- Mamiya M22
- Mamiya M31
- Mamiya DM40
- ZD

</details>

<details>
<summary><strong>Motorola</strong> &middot; 3 条</summary>

- Moto G Power (2021) Front Camera
- Moto G Power (2021) Rear Macro Camera
- Moto G Power (2021) Rear Wide Camera

</details>

<details>
<summary><strong>Nikon</strong> &middot; 101 条</summary>

- 1 J1
- 1 J2
- 1 J3
- 1 J4
- 1 J5
- 1 S1
- 1 S2
- 1 V1
- 1 V2
- 1 V3
- COOLPIX 5000
- COOLPIX 5400
- COOLPIX 5700
- COOLPIX 8400
- COOLPIX 8700
- COOLPIX 8800
- COOLPIX A
- COOLPIX A1000
- COOLPIX B700
- COOLPIX P330
- COOLPIX P340
- COOLPIX P1000
- COOLPIX P1100
- COOLPIX P6000
- COOLPIX P7000
- COOLPIX P7100
- COOLPIX P7700
- COOLPIX P7800
- COOLPIX P950
- D1
- D1H
- D1X
- D2H
- D2Hs
- D2X
- D2Xs
- D3
- D3s
- D3X
- D4
- D4S
- D5
- D40
- D40x
- D50
- D60
- D6
- D70
- D70S
- D80
- D90
- D100
- D200
- D300
- D300s
- D500
- D600
- D610
- D700
- D750
- D780
- D800
- D800E
- D810
- D810A
- D850
- D3000
- D3100
- D3200
- D3300
- D3400
- D3500
- D5000
- D5100
- D5200
- D5300
- D5500
- D5600
- D7000
- D7100
- D7200
- D7500
- Df
- Z 30
- Z 50
- Z 50 II
- Z 5
- Z 5 2
- Z 6
- Z 6 II
- Z 6 III
- Z 6 III Camera Matching profiles
- Z 7
- Z 7 II
- Z 8
- Z 8 Pixel Shift Support
- Z 9
- Z 8/ Z 9 CM profiles
- Z fc
- Z f
- ZR

</details>

<details>
<summary><strong>Nokia</strong> &middot; 3 条</summary>

- Lumia 1020
- HMD Global Nokia 9 PureView Front Camera
- HMD Global Nokia 9 PureView Rear Camera

</details>

<details>
<summary><strong>Olympus</strong> &middot; 71 条</summary>

- AIR A01
- Camedia C-5050 Zoom
- Camedia C-5060 Zoom
- Camedia C-7070 Wide Zoom
- Camedia C-8080 Wide Zoom
- E-1
- E-3
- E-5
- E-10
- E-20
- E-30
- E-420
- E-450
- E-520
- E-600
- E-620
- EVOLT E-300
- EVOLT E-330
- EVOLT E-400
- EVOLT E-410
- EVOLT E-500
- EVOLT E-510
- OM-D E-M1
- OM-D E-M1X
- OM-D E-M1 Mark II
- OM-D E-M1 Mark III
- OM-D E-M5
- OM-D E-M5 Mark II
- OM-D E-M5 Mark III
- OM-D E-M10
- OM-D E-M10 Mark II
- OM-D E-M10 Mark III
- OM-D E-M10 Mark III S
- OM-D E-M10 Mark IV
- PEN E-P1
- PEN E-P2
- PEN E-P3
- PEN E-P5
- PEN E-P7
- PEN E-PL1
- PEN E-PL1s
- PEN E-PL10
- PEN E-PL2
- PEN E-PL3
- PEN E-PL6
- PEN E-PL5
- PEN E-PL7
- PEN E-PL8
- PEN E-PL9
- PEN E-PM1
- PEN E-PM2
- PEN-F
- SP-310
- SP-320
- SP-350
- SP-500 UZ
- SP-510 UZ
- SP-550 UZ
- SP-560 UZ
- SP-565 UZ
- SP-570 UZ
- Stylus 1
- Stylus 1s
- Stylus SH-2
- Stylus SH-3
- Stylus Tough TG-4
- Stylus Tough TG-5
- Stylus Tough TG-6
- Stylus XZ-2 iHS
- Stylus XZ-10
- XZ-1

</details>

<details>
<summary><strong>OM Digital Solutions</strong> &middot; 7 条</summary>

- OM System OM-1
- OM System OM-5
- OM System TG - 7
- OM System OM-1 MARK II
- OM System OM-3
- OM-5 Mark II
- OM-3 Astro

</details>

<details>
<summary><strong>OnePlus</strong> &middot; 9 条</summary>

- 7T Front Camera
- 7T Rear Main Camera
- 8 Front Camera
- 8 Rear Main Camera
- 8 Pro Front Camera
- 8 Pro Rear Main Camera
- 12 Telephoto Camera
- 12 Ultrawide Camera
- 12 Wide Camera

</details>

<details>
<summary><strong>Oppo</strong> &middot; 37 条</summary>

- Find X7 Telephoto Camera
- Find X7 Ultrawide Camera
- Find X7 Wide Camera
- Find X7 Ultra Super Telephoto Camera
- Find X7 Ultra Telephoto Camera
- Find X7 Ultra Ultrawide Camera
- Find X7 Ultra Wide Camera
- Find X8 Ultra Super Telephoto Camera
- Find X8 Ultra Telephoto Camera
- Find X8 Ultra Ultrawide Camera
- Find X8 Ultra Wide Camera
- Find X8 Telephoto Camera
- Find X8 Ultrawide Camera
- Find X8 Wide Camera
- Find X8s Telephoto Camera
- Find X8s Ultrawide Camera
- Find X8s Wide Camera
- Find X8s+ Telephoto Camera
- Find X8s+ Ultrawide Camera
- Find X8s+ Wide Camera
- Find X8 Pro Super Telephoto Camera
- Find X8 Pro Telephoto Camera
- Find X8 Pro Ultrawide Camera
- Find X8 Pro Wide Camera
- Find X9 Telephoto Camera
- Find X9 Ultrawide Camera
- Find X9 Wide Camera
- Find X9 Pro Telephoto Camera
- Find X9 Pro Ultrawide Camera
- Find X9 Pro Wide Camera
- Find X9s Pro Telephoto Camera
- Find X9s Pro Ultrawide Camera
- Find X9s Pro Wide Camera
- Find X9 Ultra Super Telephoto Camera
- Find X9 Ultra Telephoto Camera
- Find X9 Ultra Ultrawide Camera
- Find X9 Ultra Wide Camera

</details>

<details>
<summary><strong>Panasonic</strong> &middot; 104 条</summary>

- LUMIX AG-GH4
- LUMIX DC-FZ80 (DC-FZ82, DC-FZ85)
- LUMIX DC-FZ80D (DC-FZ82D, DC-FZ85D)
- LUMIX DC-FZ81 (DC-FZ83)
- LUMIX DC-FZ1000M2 (DC-FZ10002)
- LUMIX DC-G100 (DC-G110)
- LUMIX DC-G9
- LUMIX DC-G99 (DC-G90, DC-G91, DC-G95)
- LUMIX DC-GF9 (DC-GX850, DC-GX800)
- LUMIX DC-GF10 (DC-GF90)
- LUMIX DC-GH5
- LUMIX DC-GH5M2
- LUMIX DC-GH5s
- LUMIX DC-GH6
- LUMIX DC-GH7
- LUMIX DC-GX880
- LUMIX DC-LX100 II
- LUMIX DC-S1
- LUMIX DC-S1H
- LUMIX DC-S1R
- LUMIX DC-S5
- LUMIX DC-S9
- LUMIX DC-ZS70 (DC-TZ90, DC-TZ91, DC-TZ92, DC-TZ93)
- LUMIX DC-ZS80 (DC-TZ95, DC-TZ96, DC-TZ97)
- LUMIX DMC-CM1
- LUMIX DMC-CM10
- LUMIX DMC-FZ1000
- LUMIX DMC-FX150
- LUMIX DMC-FZ8
- LUMIX DMC-FZ18
- LUMIX DMC-FZ28
- LUMIX DMC-FZ30
- LUMIX DMC-FZ35
- LUMIX DMC-FZ38
- LUMIX DMC-FZ40 (DMC-FZ45)
- LUMIX DMC-FZ50
- LUMIX DMC-FZ70
- LUMIX DMC-FZ72
- LUMIX DMC-FZ100
- LUMIX DMC-FZ150
- LUMIX DMC-FZ200
- LUMIX DMC-FZ2500 (DMC-FZ2000, DMC-FZH1)
- LUMIX DMC-FZ300
- LUMIX DMC-FZ330
- LUMIX DMC-G1
- LUMIX DMC-G2
- LUMIX DMC-G3
- LUMIX DMC-G5
- LUMIX DMC-G6
- LUMIX DMC-G7
- LUMIX DMC-G8 (DMC-G80, DMC-G81, DMC-G85)
- LUMIX DMC-G10
- LUMIX DMC-GF1
- LUMIX DMC-GF2
- LUMIX DMC-GF3
- LUMIX DMC-GF5
- LUMIX DMC-GF6
- LUMIX DMC-GF7
- LUMIX DMC-GF8
- LUMIX DMC-GH1
- LUMIX DMC-GH2
- LUMIX DMC-GH3
- LUMIX DMC-GH4
- LUMIX DMC-GM1
- LUMIX DMC-GM1S
- LUMIX DMC-GM5
- LUMIX DMC-GX1
- LUMIX DMC-GX7
- LUMIX DMC-GX8
- LUMIX DMC-GX85 (DMC-GX80, DMC-GX7MK2)
- LUMIX DC-GX9 (DC-GX7MK3)
- LUMIX DMC-L1
- LUMIX DMC-L10
- LUMIX DMC-LC1
- LUMIX DMC-LF1
- LUMIX DMC-LX1
- LUMIX DMC-LX2
- LUMIX DMC-LX3
- LUMIX DMC-LX5
- LUMIX DMC-LX7
- LUMIX DMC-LX9 (DMC-LX10, DMC-LX15)
- LUMIX DMC-LX100
- LUMIX DMC-TZ82
- LUMIX DMC-ZS40 (DMC-TZ60, DMC-TZ61)
- LUMIX DMC-ZS50 (DMC-TZ70, DMC-TZ71)
- LUMIX DMC-ZS60 (DMC-TZ80, DMC-TZ81, DMC-TZ85)
- LUMIX DMC-ZS100 (DMC-ZS110, DMC-TZ100, DMC-TZ101, DMC-TZ110, DMC-TX1)
- LUMIX ZS200 (DC-TX2, DC-TZ200, DC-TZ202, DC-TZ220, DC-ZS220)
- LUMIX DC-G95D
- LUMIX DC-G99D
- LUMIX DC-TX2D (DC-TZ200D, DC-TZ202D, DC-TZ220D, DC-ZS200D, DC-ZS220D)
- LUMIX DC-ZS80D (DC-TZ95D, DC-TZ96D)
- LUMIX DC-S5M2
- LUMIX DC-S5M2X
- LUMIX DCG9M2
- LUMIX DC-G100D
- LUMIX DC-S5D
- LUMIX DC - G97 (DC-G99M2)
- LUMIX DC - TZ99 (DC - ZS99)
- LUMIX DC-S1RM2 (Final Support)
- LUMIX DC-S1M2ES (Final Support)
- LUMIX DC-S1M2
- LUMIX DC-ZS300 (DC-TZ300, DC-TX3)
- LUMIX DC-L10

</details>

<details>
<summary><strong>Parrot</strong> &middot; 2 条</summary>

- Anafi
- ANAFI Ai

</details>

<details>
<summary><strong>Pentax</strong> &middot; 40 条</summary>

- 645D
- 645Z
- \*ist D
- \*ist DL
- \*ist DL2
- \*ist DS
- \*ist DS2
- K-01
- K-1
- K-1 II
- K-3
- K-3 II
- K-5
- K-5 II
- K-5 IIs
- K-7
- K-3 Mark III
- K-3 Mark III Monochrome
- K-30
- K-50
- K-70
- K-500
- KP
- K-r
- K-S1
- K-S2
- K-x
- K10D
- K20D
- K100D
- K100D Super
- K110D
- K200D
- K2000 K-m
- KF
- MX-1
- Q
- Q7
- Q10
- QS-1

</details>

<details>
<summary><strong>Phase One</strong> &middot; 28 条</summary>

- H 20
- H 25
- IQ 140
- IQ 160
- IQ 150
- IQ 180
- IQ 250
- IQ 260
- IQ 280
- IQ3 50MP
- IQ3 60MP
- IQ3 80MP
- IQ3 100MP
- IQ3 100MP Trichromatic
- IQ4 150MP
- IQ4 150MP Achromatic
- P 20
- P 20+
- P 21
- P 21+
- P 25
- P 25+
- P 30
- P 30+
- P 40+
- P 45
- P 45+
- P 65+

</details>

<details>
<summary><strong>Pixii</strong> &middot; 1 条</summary>

- PIXII Camera (A1571)

</details>

<details>
<summary><strong>Ricoh</strong> &middot; 20 条</summary>

- GR
- GR II
- GR III
- GR IIIx
- GR III HDF
- GR IIIx HDF
- GR IV
- GR IV Monochrome
- GR Digital
- GR Digital II
- GR Digital III
- GR Digital IV
- GX100
- GX200
- GXR with GR LENS A12 28mm F2.5
- GXR with GR LENS A12 50mm F2.5 MACRO
- GXR with GR LENS A16 24-85 F3.5-5.5
- GXR with GR LENS S10 24-72mm F2.5-4.4 VC
- GXR with GR LENS Mount A12
- THETA Z1

</details>

<details>
<summary><strong>Samsung</strong> &middot; 128 条</summary>

- EK-GN100
- EK-GN110
- EK-GN120
- EK-KN120
- EX2F
- NX300
- NX500
- NX1000
- NX1100
- NX2000
- NX3000
- NX3300
- NX U
- Pro 815
- TL350 (WB2000)
- TL500 (EX1)
- Galaxy Note 9
- Galaxy Note 20 Rear Main Camera
- Galaxy Note 20 Ultra Rear Main Camera
- Galaxy S20 Front Camera
- Galaxy S20 Rear Main Camera
- Galaxy S20+ Front Camera
- Galaxy S20+ Rear Main Camera
- Galaxy S20 Ultra Front Camera
- Galaxy S20 Ultra Rear Main Camera
- Galaxy S21 Rear Main Camera
- Galaxy S21 Rear Wide Camera
- Galaxy S21+ Rear Main Camera
- Galaxy S21+ Rear Wide Camera
- Galaxy S21 Ultra Rear Main Camera
- Galaxy S21 Ultra Rear Wide Camera
- Galaxy S21 Ultra Super Telephoto Camera
- Galaxy S21 Ultra Telephoto Camera
- Galaxy S6
- Galaxy S6 Edge
- Galaxy S7
- Galaxy S7 Edge
- Galaxy S8
- Galaxy S8+
- Galaxy S9
- Galaxy S9+
- Galaxy Z Fold3 Rear Main Camera
- Galaxy Z Fold3 Rear Telephoto Camera
- Galaxy Z Fold3 Rear Ultrawide Camera
- Galaxy S22 Front Camera
- Galaxy S22 Rear Telephoto Camera
- Galaxy S22 Rear Ultrawide Camera
- Galaxy S22 Rear Wide Camera
- Galaxy S22+ Front Camera
- Galaxy S22+ Rear Telephoto Camera
- Galaxy S22+ Rear Ultrawide Camera
- Galaxy S22+ Rear Wide Camera
- Galaxy S22 Ultra Front Camera
- Galaxy S22 Ultra Rear Super Telephoto Camera
- Galaxy S22 Ultra Rear Telephoto Camera
- Galaxy S22 Ultra Rear Ultrawide Camera
- Galaxy S22 Ultra Rear Wide Camera
- Galaxy S23 Front Camera
- Galaxy S23 Rear Telephoto Camera
- Galaxy S23 Rear Ultrawide Camera
- Galaxy S23 Rear Wide Camera
- Galaxy S23+ Front Camera
- Galaxy S23+ Rear Telephoto Camera
- Galaxy S23+ Rear Ultrawide Camera
- Galaxy S23+ Rear Wide Camera
- Galaxy S23 Ultra Front Camera
- Galaxy S23 Ultra Rear Super Telephoto Camera
- Galaxy S23 Ultra Rear Telephoto Camera
- Galaxy S23 Ultra Rear Ultrawide Camera
- Galaxy S23 Ultra Rear Wide Camera
- Galaxy S24 Front Camera
- Galaxy S24 Rear Telephoto Camera
- Galaxy S24 Rear Ultrawide Camera
- Galaxy S24 Rear Wide Camera
- Galaxy S24+ Front Camera
- Galaxy S24+ Rear Telephoto Camera
- Galaxy S24+ Rear Ultrawide Camera
- Galaxy S24+ Rear Wide Camera
- Galaxy S24 Ultra Front Camera
- Galaxy S24 Ultra Rear Super Telephoto Camera
- Galaxy S24 Ultra Rear Telephoto Camera
- Galaxy S24 Ultra Rear Ultrawide Camera
- Galaxy S24 Ultra Rear Wide Camera
- Galaxy S25 Front Camera
- Galaxy S25 Rear Telephoto Camera
- Galaxy S25 Rear Ultrawide Camera
- Galaxy S25 Rear Wide Camera
- Galaxy S25+ Front Camera
- Galaxy S25+ Rear Telephoto Camera
- Galaxy S25+ Rear Ultrawide Camera
- Galaxy S25+ Rear Wide Camera
- Galaxy S25 Ultra Front Camera
- Galaxy S25 Ultra Rear Super Telephoto Camera
- Galaxy S25 Ultra Rear Telephoto Camera
- Galaxy S25 Ultra Rear Ultrawide Camera
- Galaxy S25 Ultra Rear Wide Camera
- Galaxy Z Fold4 Rear Telephoto Camera
- Galaxy Z Fold4 Rear Ultrawide Camera
- Galaxy Z Fold4 Rear Wide Camera
- Galaxy Z Fold5 Front Camera
- Galaxy Z Fold5 Telephoto Camera
- Galaxy Z Fold5 Ultrawide Camera
- Galaxy Z Fold5 Wide Camera
- Galaxy Z Fold6 Front Camera
- Galaxy Z Fold6 Rear Telephoto Camera
- Galaxy Z Fold6 Rear Ultrawide Camera
- Galaxy Z Fold6 Rear Wide Camera
- Galaxy Z Fold Special Edition Front Camera
- Galaxy Z Fold Special Edition Rear Telephoto Camera
- Galaxy Z Fold Special Edition Rear Ultrawide Camera
- Galaxy Z Fold Special Edition Rear Wide Camera
- Galaxy Z Flip6 Rear Ultrawide Camera
- Galaxy Z Flip6 Rear Wide Camera
- Galaxy Z Flip7 FE Front Camera
- Galaxy Z Flip7 FE Rear Ultrawide Camera
- Galaxy Z Flip7 FE Wide Camera
- Galaxy Z Flip7 Front Camera
- Galaxy Z Flip7 Rear Ultrawide Camera
- Galaxy Z Flip7 Rear Wide Camera
- Galaxy Z Fold7 Front Camera
- Galaxy Z Fold7 Rear Telephoto Camera
- Galaxy Z Fold7 Rear Ultrawide Camera
- Galaxy Z Fold7 Under-Display Camera
- Galaxy Z Fold7 Rear Wide Camera
- Galaxy Z Trifold Front Camera
- Galaxy Z Trifold Rear Telephoto Camera
- Galaxy Z Trifold Rear Ultrawide Camera
- Galaxy Z Trifold Rear Wide Camera

</details>

<details>
<summary><strong>Sigma</strong> &middot; 9 条</summary>

- BF
- DP1
- DP1s
- DP2
- fp
- fp L
- SD9
- SD10
- SD14

</details>

<details>
<summary><strong>Skydio</strong> &middot; 1 条</summary>

- Skydio 2

</details>

<details>
<summary><strong>Sony</strong> &middot; 149 条</summary>

- Xperia 5 IV Telephoto Camera
- Xperia 5 IV Ultrawide Camera
- Xperia 5 IV Wide Camera
- Xperia 1 V Front Camera
- Xperia 1 V Ultrawide Camera
- Xperia 1 V Wide Camera
- Xperia 1 V Zoom Camera
- A1 II (ILCE-1M2)
- A7 (ILCE-7)
- A7 II (ILCE-A7M2)
- A7 III (ILCE-7M3)
- A7 IV (ILCE-7M4)
- A7 V (ILCE-7M5)
- A7C (ILCE-7C)
- A7C II (ILCE-7CM2)
- A7CR (ILCE-7CR)
- A7R (ILCE-7R)
- A7R II (ILCE-7RM2)
- A7R III (ILCE-7RM3)
- A7R IV (ILCE-7RM4)
- A7S (ILCE-7S)
- A7S II (ILCE-7SM2)
- A7s III (ILCE-7SM3)
- A9 (ILCE-9)
- A9 II (ILCE-9M2)
- A9 III (ILCE-9M3)
- A33 (SLT-A33)
- A35 (SLT-A35)
- A37 (SLT-A37)
- A55V (SLT-A55V)
- A57 (SLT-A57)
- A58 (SLT-A58)
- A65 (SLT-A65)
- A68 (ILCA-68)
- A77 (SLT-A77)
- A77 II (ILCA-77M2)
- A7R IIIA (ILCE-7RM3A)
- A7R IVA (ILCE-7RM4A)
- A7R V (ILCE-7RM5)
- A7R VI (ILCE-7RM6)
- A99 (SLT-A99V)
- A99 II (ILCA-99M2)
- A100 (DSLR-A100)
- A200 (DSLR-A200)
- A230 (DSLR-A230)
- A290 (DSLR-A290)
- A300 (DSLR-A300)
- A330 (DSLR A330)
- A350 (DSLR-A350)
- A380 (DSLR-A380)
- A390 (DSLR-A390)
- A450 (DSLR-A450)
- A500 (DSLR-A500)
- A550 (DSLR-A550)
- A560 (DSLR-A560)
- A580 (DSLR-A580)
- A700 (DSLR-A700)
- A850 (DSLR-A850)
- A900 (DSLR-A900)
- A3000 (ILCE-3000)
- A3500 (ILCE-3500)
- A5000 (ILCE-5000)
- A5100 (ILCE-5100)
- A6000 (ILCE-6000)
- A6100 (ILCE-6100)
- A6300 (ILCE-6300)
- A6400 (ILCE-6400)
- A6500 (ILCE-6500)
- A6600 (ILCE-6600)
- A6700 (ILCE-6700)
- DSC-F828
- DSC-HX95
- DSC-HX99
- DSC-V3
- DSC-RX100M7A
- FX3 (ILME-FX3)
- FX30 (ILME-FX30)
- NEX-3
- NEX-3N
- NEX-5
- NEX-5N
- NEX-5R
- NEX-5T
- NEX-6
- NEX-7
- NEX-C3
- NEX-F3
- NEX-VG20
- NEX-VG30
- NEX-VG900
- RX0 (DSC-RX0)
- RX0 II (DSC-RX0M2)
- RX1 (DSC-RX1)
- RX1R (DSC-RX1R)
- RX1R II (DSC-RX1RM2)
- RX10 (DSC-RX10)
- RX10 II (DSC-RX10M2)
- RX10 III (DSC-RX10M3)
- RX10 IV (DSC-RX10M4)
- RX10 V (DSC-RX10M5)
- RX100 (DSC-RX100)
- RX100 II (DSC-RX100M2)
- RX100 III (DSC-RX100M3)
- RX100 IV (DSC-RX100M4)
- RX100 V (DSC-RX100M5)
- RX100 VA (DSC-RX100M5A)
- RX100 VI (DSC-RX100M6)
- RX100 VII (DSC-RX100M7)
- QX1 (ILCE-QX1)
- ZV-1 (DCZV1/B)
- Alpha 1 (ILCE-1)
- Xperia 1 Wide-angle Camera
- Xperia 1 II Telephoto Camera
- Xperia 1 II Ultra wide-angle Camera
- Xperia 1 II Wide-angle Camera
- Xperia 1 IV Wide Camera
- Xperia 1 IV Zoom Camera
- Xperia 1 IV Ultrawide Camera
- Xperia 1 VI Front Camera
- Xperia 1 VI Ultrawide Camera
- Xperia 1 VI Wide Camera
- Xperia 1 VI Zoom Camera
- Xperia 1 VII Front Camera
- Xperia 1 VII Ultrawide Camera
- Xperia 1 VII Wide Camera
- Xperia 1 VII Zoom Camera
- Xperia 1 III Telephoto Camera
- Xperia 1 III Ultra wide-angle Camera
- Xperia 1 III Wide-angle Camera
- Xperia 5 III Super Telephoto Camera
- Xperia 5 III Telephoto Camera
- Xperia 5 III Ultra wide-angle Camera
- Xperia 5 III Wide-angle Camera
- Xperia 5 V Front Camera
- Xperia 5 V Ultrawide Camera
- Xperia 5 V Wide Camera
- Xperia Pro-I Rear Wide Camera
- ZV-E10
- ZV-E1
- ZV-E10M2
- ZV-1M2
- ZV-1A
- ILX-LR1
- ILCE - 1M2 (Final Support)
- ILCE - 6100A
- ILCE - 6400A
- FX2 (ILMEFX2)
- FX3A (ILMEFX3A)
- RX1R III (DSC-RX1RM3)

</details>

<details>
<summary><strong>Xiaomi</strong> &middot; 58 条</summary>

- Mi 11 Lite Front Camera
- Mi 11 Lite Rear Ultrawide Camera
- Mi 11 Lite Rear Wide Camera
- Xiaomi 12S
- Xiaomi 12S Pro
- Xiaomi 12S Ultra
- Xiaomi 13 Rear Telephoto Camera
- Xiaomi 13 Rear Ultrawide Camera
- Xiaomi 13 Rear Wide Camera
- Xiaomi 13 Pro Rear Telephoto Camera
- Xiaomi 13 Pro Rear Ultrawide Camera
- Xiaomi 13 Pro Rear Wide Camera
- Xiaomi 13 Ultra Rear Super Telephoto Camera
- Xiaomi 13 Ultra Rear Telephoto Camera
- Xiaomi 13 Ultra Rear Ultrawide Camera
- Xiaomi 13 Ultra Rear Wide Camera
- Xiaomi 13T Front Camera
- Xiaomi 13T Rear Telephoto Camera
- Xiaomi 13T Rear Ultrawide Camera
- Xiaomi 13T Rear Wide Camera
- Xiaomi 13T Pro Front Camera
- Xiaomi 13T Pro Rear Telephoto Camera
- Xiaomi 13T Pro Rear Ultrawide Camera
- Xiaomi 13T Pro Rear Wide Camera
- Xiaomi 14 Rear Telephoto Camera
- Xiaomi 14 Rear Ultrawide Camera
- Xiaomi 14 Rear Wide Camera
- Xiaomi 14 Pro Rear Telephoto Camera
- Xiaomi 14 Pro Rear Ultrawide Camera
- Xiaomi 14 Pro Rear Wide Camera
- Xiaomi 14 Ultra Rear Super Telephoto Camera
- Xiaomi 14 Ultra Rear Telephoto Camera
- Xiaomi 14 Ultra Rear Ultrawide Camera
- Xiaomi 14 Ultra Rear Wide Camera
- Xiaomi 14T Front Camera
- Xiaomi 14T Telephoto Camera
- Xiaomi 14T Ultrawide Camera
- Xiaomi 14T Wide Camera
- Xiaomi 14T Pro Front Camera
- Xiaomi 14T Pro Telephoto Camera
- Xiaomi 14T Pro Ultrawide Camera
- Xiaomi 14T Pro Wide Camera
- Xiaomi MIX Fold 3 Rear Telephoto Camera
- Xiaomi MIX Fold 3 Rear Super Telephoto Camera
- Xiaomi MIX Fold 3 Rear Ultrawide Camera
- Xiaomi MIX Fold 3 Rear Wide Camera
- Xiaomi Civi 4 Pro Rear Telephoto Camera
- Xiaomi Civi 4 Pro Rear Ultrawide Camera
- Xiaomi Civi 4 Pro Rear Wide Camera
- Xiaomi 15 Rear Telephoto Camera
- Xiaomi 15 Rear Ultrawide Camera
- Xiaomi 15 Rear Wide Camera
- Xiaomi 15 Pro Rear Telephoto Camera
- Xiaomi 15 Pro Rear Ultrawide Camera
- Xiaomi 15 Pro Rear Wide Camera
- Xiaomi 17 Ultra Rear Telephoto Camera
- Xiaomi 17 Ultra Rear Ultrawide Camera
- Xiaomi 17 Ultra Rear Wide Camera

</details>

<details>
<summary><strong>Yuneec</strong> &middot; 2 条</summary>

- CGO4
- ION L1 Pro

</details>

<details>
<summary><strong>Zeiss</strong> &middot; 1 条</summary>

- ZX1

</details>
