# Deprecation

I am moving on from GameMaker in general. I will provide support for this library as best possible if people still express interest in it, but I will not be actively using it and will be unlikely to add new features to Chameleon unless necessary for a probable backport.

Pull requests and issues will still be addressed, but you may get better long-term mileage with a fork.

# Chameleon
A fast, reliable, free, and open-source palette swapper for GameMaker Studio 2.

This project is newly released as of 7/10/2022. The shader itself should be rock solid but the editor may have some faults still. I'm definitely not going to claim it's well-organized internally :)

## Usage and demo

[Check out the wiki](https://github.com/Lojemiru/Chameleon/wiki) for usage and implementation details.

[Check out the latest release](https://github.com/Lojemiru/Chameleon/releases/latest) for both the palette construction tool, which also serves as a great way to try out the palette swapper.

## Todo
Want to help out? Here's what I'm aiming to do next with this tool:

- Backport shader and associated scripts to GameMaker: Studio 1.4.
- Add a drawbacks/Q&A wiki page.
- Add some form of safety check/warning on palette overlaps during compression.

## Attribution

The sprites used in the Palette Builder wiki page were made by the incredibly talented and very cool [@shmegleskimo](https://twitter.com/shmegleskimo). Go give him a follow!

This project makes use of some GMLScripts for color conversion. [Check out their license here.](GMLscripts.com/license)

This project also makes use of the CC0-1.0 licensed [GMS2-Color-Picker by THEASK-CN.](https://github.com/THEASK-CN/GMS2-Color-Picker)

I've also received a great deal of general GML education pertinent to this tool from the [GameMaker Kitchen Discord server](https://discord.gg/8krYCqr), particularly in regard to stuffing surfaces into buffers.
