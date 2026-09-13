<p align="center">
  <img src=".branding/banners/ic_banner.png" alt="Flex" width="480"/>
</p>

<h1 align="center">Flex — An OSS Android TV Client for Jellyfin</h1>
<p align="center"><strong><em>Stream Like a King</em></strong></p>

<p align="center">
  <a href="https://github.com/kasundsilva/flex/releases/latest">
    <img alt="Latest Release" src="https://img.shields.io/github/v/release/kasundsilva/flex?style=flat-square&color=8A2BE2"/>
  </a>
  <a href="https://github.com/kasundsilva/flex/actions/workflows/build-flex.yml">
    <img alt="Build Status" src="https://img.shields.io/github/actions/workflow/status/kasundsilva/flex/build-flex.yml?style=flat-square"/>
  </a>
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/badge/license-GPL--2.0-blue?style=flat-square"/>
  </a>
</p>

---

**Flex** is an open-source Android TV / Google TV client for Jellyfin. It delivers a fast, modern media experience with a Plex-inspired user interface, native media playback, and automated release tracking synchronized with upstream [Wholphin](https://github.com/damontecres/Wholphin).

---

## Features

### User Interface
- **Fully Customizable Home Screen:** Re-order rows, use poster or thumb thumbnails, combine *Continue Watching* and *Next Up*, and pin favorite libraries, genres, or collections.
- **Quick Navigation Drawer:** Instant access to libraries, search, favorites, and settings from anywhere in the app.
- **Seerr Integration:** Discover trending movies and TV shows directly from your connected [Seerr](https://github.com/seerr-team/seerr) instance.
- **Multi-Profile & Privacy:** Protect profile switching with PIN codes or server logins.
- **Library Customization:** Grid or list views, toggleable titles, and custom image sizing.
- **Screensaver & System Integration:** Native Android TV ambient screensaver support.

### Playback & Subtitles
- **Dual Playback Engines:**
  - **ExoPlayer:** Hardware-accelerated playback with AV1 and SSA/ASS subtitle rendering.
  - **MPV / libmpv:** Direct plays almost any container/codec with pixel-perfect styled anime subtitles.
- **Plex-Inspired D-Pad Seeking:** Fast seeking with live video preview (Trickplay) and chapter jumping.
- **Cinema Mode:** Optional pre-roll intros (via Jellyfin Intros plugin).
- **Match Frame Rate & Resolution:** Automatic display refresh rate switching on supported Google TV displays.

---

## Installation on Google TV / Android TV

You can install **Flex** directly on your Google TV using any of these methods:

### Method 1: Obtainium (Recommended for Auto-Updates)
1. Install [Obtainium](https://github.com/ImranR98/Obtainium) on your Google TV.
2. Add App URL: `https://github.com/kasundsilva/flex`
3. Obtainium will automatically detect new releases and update Flex in-place with a single click.

### Method 2: Sideload via "Send Files to TV"
1. Download the latest `Flex-<version>.apk` from the **[Releases](https://github.com/kasundsilva/flex/releases)** page on your phone or PC.
2. Install **Send Files to TV** on both your TV and phone.
3. Send the APK to your TV and open it with a file manager (such as *FX File Explorer*) to install.

### Method 3: Via ADB
Connect to your TV over Wi-Fi:
```bash
adb connect <TV_IP_ADDRESS>:5555
adb install -r Flex-<version>.apk
```

---

## Automated Upstream Sync & Rebranding

This repository maintains an automated build pipeline via GitHub Actions:
- **Daily Upstream Monitoring:** Checks [damontecres/Wholphin](https://github.com/damontecres/Wholphin) daily for new releases.
- **Overlay Rebranding:** Injects custom branding assets (`.branding/`) during compilation without polluting the git history.
- **Keystore Signing:** Automatically signs every release APK with a persistent keystore secret to ensure seamless in-place updates.

---

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/62bb1703-abdf-4154-9054-e00b6ceb57b5" alt="Home Screen" width="80%"/>
</p>

<details>
  <summary><b>View More Screenshots</b></summary>
  <br/>
  
  <p align="center">
    <img src="https://github.com/user-attachments/assets/fad0424b-0631-4438-a8bc-d4fbb95a5bf3" alt="Library" width="80%"/><br/><br/>
    <img src="https://github.com/user-attachments/assets/849aad34-49d5-4864-8de7-005bbcb68ac6" alt="Movie Page" width="80%"/><br/><br/>
    <img src="https://github.com/user-attachments/assets/655389e1-6a6f-43bc-85e1-e2feffb20429" alt="Series Page" width="80%"/><br/><br/>
    <img src="https://github.com/user-attachments/assets/5bbcbeb6-edc9-42c7-a1d8-d92fa432a498" alt="Genres" width="80%"/>
  </p>
</details>

---

## Acknowledgements

- Upstream client development by [damontecres](https://github.com/damontecres/Wholphin).
- The [Jellyfin](https://jellyfin.org/) project and community.
- Built with Kotlin, Jetpack Compose, Media3/ExoPlayer, and MPV.

---

## License

This project is licensed under the [GNU General Public License v2.0](LICENSE).
