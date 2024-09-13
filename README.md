# smw
A reimplementation of Super Mario World by snesrev, ported to WASM by MadSuleiman

The discord server is: https://discord.gg/AJJbJAzNNJ

## About

This is a reverse engineered clone of Super Mario World.

It reimplements all parts of the original game and a bunch of mods added by Lunar Magic. The game is playable from start to end.

You need a copy of the ROM to extract game resources (levels, images). Then once that's done, the ROM is no longer needed.

It uses the PPU and DSP implementation from [LakeSnes](https://github.com/elzo-d/LakeSnes), but with lots of speed optimizations.

## Building

You must self-build for now, made for Linux. Can be easily adjusted for Windows or use WSL (recommended)<br>
(1) Have [Python](https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe)<br>
(2) Download or clone this repo<br>
(3) Place your USA rom named smw.sfc inside the repo folder<br>
(4) Have SDL installed or Download [TCC](https://github.com/FitzRoyX/tinycc/releases/download/tcc_20230519/tcc_20230519.zip) and [SDL2](https://github.com/libsdl-org/SDL/releases/download/release-2.28.1/SDL2-devel-2.28.1-VC.zip) and extract each ZIP into the "third-party" subfolder<br>
(5) Configure with smw.ini in a text editor like notepad++<br>
(6) Run make, this will output four files: smw_assets.dat, smw.html,smw.js, and smw.wasm. The last three are the files you really need, as the assests are already embedded within the WASM. (Can change that to protect yourself.)<br>

For other platforms and compilers, see: https://github.com/snesrev/smw/blob/main/BUILDING.md


## Usage and controls

The game supports snapshots. The joypad input history is also saved in the snapshot. It's thus possible to replay a playthrough in turbo mode to verify that the game behaves correctly.

| Button | Key         |
| ------ | ----------- |
| Up     | W   |
| Down   | S   |
| Left   | A   |
| Right  | D   |
| Start  | V   |
| Select | B   |
| A      | K   |
| B      | J   |
| X      | I   |
| Y      | U   |
| L      | Left Shift  |
| R      | Right Shift |




The keys can be reconfigured in smw.ini

Additionally, the following commands are available:

| Key | Action                |
| --- | --------------------- |
| Tab | Turbo mode |
| P   | Pause (with dim)                |
| Shift+P   | Pause (without dim)                |
| Ctrl+Up   | Increase window size                |
| Ctrl+Down   | Decrease window size                |
| T   | Toggle replay turbo mode  |
| K   | Clear all input history from the joypad log  |
| L   | Stop replaying a shapshot  |
| R   | Toggle between fast and slow renderer |
| F   | Display renderer performance |
| F1-F10 | Load snapshot      |
| Alt+Enter | Toggle Fullscreen     |
| Shift+F1-F10 | Save snapshot |
| Ctrl+F1-F10 | Replay the snapshot |
