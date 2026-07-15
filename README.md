<div align="center">
  <img src="https://raw.githubusercontent.com/TKMM-Team/.github/refs/heads/main/resources/Icon-Transparent-1024.png" width="300vh">
  <h1>TKMM-NX - Lightweight OS for the Nintendo Switch</h1>
  
  <a href="https://discord.gg/BbVXenRFVc">
    <img src="https://img.shields.io/discord/1179611100183011429?style=for-the-badge&logoColor=5865F2&color=5865F2&labelColor=2A2C33&logo=discord&label=discord" alt="Discord"/>
  </a> &nbsp;
  <a href="https://github.com/TKMM-Team/TKMM-NX/releases/latest">
    <img src="https://img.shields.io/github/v/tag/TKMM-Team/TKMM-NX?style=for-the-badge&logoColor=ffffff&color=C71B42&labelColor=2A2C33&logo=github&label=Version" alt="Releases"/>
  </a> &nbsp;
  <a href="https://tkmm.org/downloads/index.html?tabs=switch">
    <img src="https://img.shields.io/github/downloads/TKMM-Team/TKMM-NX/total?style=for-the-badge&labelColor=2A2C33&color=31c059" alt="Downloads"/>
  </a>
</div>

<br />

**TKMM-NX** is a Linux operating system based on [Lakka (LibreELEC)](https://github.com/libretro/Lakka-LibreELEC) with custom adaptations that allows the TotK Mod Manager to seamlessly run on the Nintendo Switch, without needing a PC (or needing to modify the partition table on your SD card).

## Help and Documentation

- **[Discord Server](https://tkmm.org/discord)**: Join our community for support and updates.
- **[Setup Guide](https://tkmm.org/tkmm-nx)**: Your guide to setup, configure, and troubleshoot.
- **[Documentation](https://tkmm.org/docs)**: The documentation that explains how to use the application after setup.

## Downloads

Get the latest OS images to run TKMM on your Switch:
- **Stable Release:** [Download TKMM OS for Switch](https://tkmm.org/downloads/?tabs=switch)

## Installation

After downloading the .zip file, extract the `tkmm` and `bootloader` folders at the root of your micro SD card.

- boot your Switch into RCM mode
- inject the Hekate payload
- go to "More Configs"
- select "TKMM"

Your Switch should now boot into TKMM-NX.

## Updating

TKMM should prompt you when it detects an update (if connected to wifi), when selecting `Yes` on the update prompt, the update will be downloaded and your Switch will reboot to the new version.

If you ever need to update manually, download the latest [update tarball](https://github.com/TKMM-Team/TKMM-NX/releases/latest/download/update.tar) and place it under `tkmm/storage/.update/` on your micro SD card. The next time you boot to TKMM-NX, the update will be installed.

## Building TKMM-NX

To build your own image, follow these steps:

1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/TKMM-Team/TKMM-NX.git
   cd TKMM-NX
   ```

2. **Install Dependencies:**  
   Ensure you have the required toolchain installed (see the [build-basics](https://wiki.libreelec.tv/development/build-basics) and [build-advanced](https://wiki.libreelec.tv/development/build-advanced) pages on the LibreELEC wiki for details).

   ```bash
   wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
   chmod +x dotnet-install.sh
   ./dotnet-install.sh --channel 10.0
   sudo apt update
   sudo apt upgrade -y
   sudo apt install -y gcc make git unzip wget xz-utils bc gperf zip g++ \
        xfonts-utils xsltproc openjdk-11-jre-headless libparse-yapp-perl \
        libxml-parser-perl patchutils lzop rdfind
   ```

3. **Build the Image:**  
   Use the provided build scripts and package definitions. For example, to build the release version run:
   ```bash
   DISTRO=TKMM TKMM_VERSION=<tag_name> PROJECT=L4T DEVICE=Switch ARCH=aarch64 make image
   ```
   For a debug build (with dotnet SDK and git installed), run:
   ```bash
   DISTRO=TKMM TKMM_VERSION=<tag_name> PROJECT=L4T DEVICE=Switch ARCH=aarch64 DEVMODE=enabled make image
   ```

## The Team

- **[Arch Leaders](https://github.com/ArchLeaders)**: Lead TKMM Developer
- **[Lord Bubbles](https://github.com/LordBubblesDev)**: TKMM-NX Developer & Maintainer
- **[Aster](https://github.com/AsteroidPizza39)**: Co-Founder, Artist, & Operations Manager
- **[The5thTear](https://github.com/The5thTear)**: Co-Founder & Developer
- **[Mikachan](https://github.com/okmika)**: Developer

## Special Thanks

A heartfelt thank you to:
- The [**Switchroot**](https://switchroot.org) community for pioneering open-source development on the Nintendo Switch.
- The [**Lakka**](https://www.lakka.tv) team, for its work that allowed us to create a custom OS for TKMM on Switch.
- The [**LibreELEC**](https://libreelec.tv) team for creating the Linux distribution upon which all of this is built.

<br>

---
