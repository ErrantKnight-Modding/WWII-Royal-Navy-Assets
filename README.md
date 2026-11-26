# WWII Royal Navy Assets for DCS World (v1.2.0)

Historical World War II Royal Navy surface fleet asset pack developed for Eagle Dynamics DCS World — featuring 8 warships, custom historical ballistics & fire control directors, custom omnidirectional naval weapon audio, dual-purpose AA/surface combat systems, carrier flight deck operations, multi-LOD optimization, dynamic Kelvin wakes, and **35 historical 1940–1945 liveries**.

---

## 📥 Downloads (GitHub Releases `1.2.0`)

The mod is distributed as **two independent, OvGME-ready packages** so Core updates stay fast and dedicated multiplayer servers stay lightweight. Only the **Core** package changed in `v1.2.0` — the `v1.1.0` **Historical Liveries** pack remains 100% compatible without re-downloading:

| Package | Size | Contents |
| :--- | :---: | :--- |
| **[WWII_Royal_Navy_Assets_v1.2.0_Core.zip](https://github.com/ErrantKnight-Modding/WWII-Royal-Navy-Assets/releases/download/1.2.0/WWII_Royal_Navy_Assets_v1.2.0_Core.zip)** *(Required)* | **405.83 MB** | All 8 warships, LOD 0–3 meshes, collision shells, weapons/directors, custom omnidirectional naval audio, carrier flight decks, dynamic wakes, Encyclopedia, and `AP 507C` / carrier ops defaults |
| **[WWII_Royal_Navy_Assets_v1.1.0_Historical_Liveries.zip](https://github.com/ErrantKnight-Modding/WWII-Royal-Navy-Assets/releases/download/1.1.0/WWII_Royal_Navy_Assets_v1.1.0_Historical_Liveries.zip)** *(Optional — unchanged from `v1.1.0`)* | **915.30 MB** | Companion plugin with **35 historical 1940–1945 Royal Navy & Commonwealth camouflage liveries** across all 8 ships *(100% compatible with `v1.2.0` Core — no re-download needed)* |

---

## ⚓ Included Warships

| Class / Name | Type | Armament | Flight Deck & Operations |
| :--- | :--- | :--- | :--- |
| **HMS Nelson (28)** | Nelson-class Battleship | 9x 16-inch Mk I, 12x 6-inch Mk XXII, 6x 4.7-inch AA, 24x 2-pdr Pom-Pom | Fleet Flagship / Shore Bombardment |
| **HMS Glorious (77)** | Courageous-class Aircraft Carrier | 16x 4.7-inch QF Mk VIII HA, 24x 2-pdr Pom-Pom (3x8), 4x 0.50-inch Vickers AA (1x4) | 48 Aircraft Capacity, unobstructed full deck run takeoffs, 4 arrestor wires |
| **HMS Illustrious (87)** | Illustrious-class Armored Aircraft Carrier | 16x 4.5-inch QF Mk I (8x2), 48x 2-pdr Pom-Pom (6x8), Oerlikon 20mm AA | Armored Flight Deck, BH-III catapult, arrestor wires, taxiway |
| **HMS Dido (37)** | Dido-class Light AA Cruiser | 10x 5.25-inch QF Mk I (Twin), 8x 2-pdr Pom-Pom, 5x 20mm Oerlikon, 6x 21-inch Torpedoes | Anti-Aircraft Fleet Escort |
| **HMS Leander (75)** | Leander-class Light Cruiser | 8x 6-inch BL Mk XXIII (Twin), 8x 4-inch QF Mk XVI AA (Twin), 12x 0.50-inch Vickers AA, 8x 21-inch Torpedoes | Cruiser Patrol & Surface Action |
| **HMS Javelin (F61)** | J-class Fleet Destroyer | 6x 4.7-inch QF Mk XII (Twin), 4x 2-pdr Pom-Pom, 10x 21-in Torpedoes | Fleet Destroyer Leader |
| **HMS Glowworm (H92)** | G-class Fleet Destroyer | 4x 4.7-inch QF Mk IX, 8x 0.50-inch Vickers AA, 10x 21-inch Torpedoes | Destroyer Escort & Torpedo Attack |
| **HMS Foxhound (H69)** | F-class Fleet Destroyer | 4x 4.7-in QF Mk IX, 8x 0.50-in Vickers AA, 8x 21-inch Torpedoes | Destroyer Escort & ASW Screen |

---

## 📦 Installation

### Players (OvGME / Open Mod Manager / JSGME — Recommended)
> *If upgrading from `v1.1.0`, disable/remove and replace only the Core module — keep your existing `v1.1.0` Historical Liveries pack enabled.*  
> *If upgrading from `v1.0.0`, remove your old `Saved Games\DCS\Mods\tech\WWII Royal Navy Assets` folder first.*
1. Point your Mod Manager profile root directory to `%USERPROFILE%\Saved Games\DCS\`.
2. Import **`WWII_Royal_Navy_Assets_v1.2.0_Core.zip`** (required) and optionally **`WWII_Royal_Navy_Assets_v1.1.0_Historical_Liveries.zip`**, then enable both.

### Players (Manual Install)
> *If upgrading from `v1.1.0`, delete/replace only `Saved Games\DCS\Mods\tech\WWII Royal Navy Assets` and leave `WWII Royal Navy Assets - Historical Liveries` intact.*  
> *If upgrading from `v1.0.0`, remove your old `Saved Games\DCS\Mods\tech\WWII Royal Navy Assets` folder first.*
1. Open **`WWII_Royal_Navy_Assets_v1.2.0_Core.zip`**, open the folder inside (`WWII_Royal_Navy_Assets_v1.2.0_Core`), and extract **`Mods`** into `%USERPROFILE%\Saved Games\DCS\`.
2. *(Optional)* Repeat for **`WWII_Royal_Navy_Assets_v1.1.0_Historical_Liveries.zip`** if not already installed.
3. Verify `Saved Games\DCS\Mods\tech\WWII Royal Navy Assets\entry.lua` exists (and `Saved Games\DCS\Mods\tech\WWII Royal Navy Assets - Historical Liveries\entry.lua` if installing liveries).

### Developers (Repo Clone)
Run `scripts\link_to_dcs.bat` to create an NTFS junction linking `Asset Pack\` directly into `%USERPROFILE%\Saved Games\DCS\Mods\tech\WWII Royal Navy Assets`, and run `scripts\package_release.py v1.2.0 --mode core-only` (or `--mode split`) to build redistributable OvGME archives.

---

## 📂 Repository Layout

* `entry.lua` - DCS World Core plugin declaration (`"WWII Royal Navy Assets"`).
* `Units/` - Self-contained warship definitions (`Shapes/`, `Textures/`, `Liveries/`).
* `Weapons/` - Royal Navy artillery, directors, shells, and torpedo systems.
* `Sounds/` - Omnidirectional `.sdef` weapon audio profiles and per-ship Navy Sounders.
* `Encyclopedia/` - In-game historical briefing text and specs.

---

## ☕ Support the Project

If you enjoy the WWII Royal Navy fleet pack and would like to support ongoing development, updates, and future warships:

[![Support on Ko-fi](https://img.shields.io/badge/Ko--fi-Buy%20Errant%20Knight%20a%20Coffee-ff5f5f?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/errantknight)

---

## 🎖️ Credits & Attribution

* **Original 3D Warship Models**: Created and generously shared for free by **Thomas Beerens**.
  * Patreon: [Thomas Beerens on Patreon](https://www.patreon.com/ThomasBeerens)
  * Free 3D Assets Index: [Links to all free models](https://www.patreon.com/ThomasBeerens/posts/links-to-all-52168097)
* **DCS World Conversion & Systems**: Model optimization, rigging, animations, EDM export, collision shells, multi-LOD pipeline, weapon definitions, radar/optical directors, custom naval audio, flight deck systems, historical liveries, and Lua integration by **ErrantKnight**.
