# X1-Extreme-OpenCore-Resources

**Last OC Version**: 0.5.7

With OpenCore, we get bootcamp support as well as proper Kext injection (No more Clover breaking SIP, yay!). OpenCore also has a cleaner code base and boots faster. This repo also provides ACPI "hotpatches" for battery status, rather than needing a patched DSDT provided. This makes it more likely to survive BIOS updates without requiring any other patches. Also makes it so that if we ever need to make anything OS specific, it is easier to do so.

### What works
* Bootcamp switching/Booting windows through OpenCore
* Booting linux through OpenCore (Don't think I can add it to startup pane though in macOS unfortunately)
* Fingerprint reader in Windows
* Sleep in both oses (Hibernation in Windows too)
  * Less than 1-2% battery used every few hours for sleep
* Backlight Control
* USB
* Bluetooth (Might break if I replace wifi card)
* Camera

### What doesn't work
* SD Card reader in macOS (Maybe a fix, I haven't looked to be honest)
* Hibernation in macOS (Haven't really tried to fix)

### Note on Wifi

Currently helping out a little with the development of a wifi kext for intel cards:
* [hatf0's](https://github.com/AppleIntelWifi/adapter) - this one has working scanning for the AC9560

## Specs
* I7 8750h
* GTX 1050ti
* Intel 512GB ssd
* 1Tb Sabrant Rocket (TLC) - Boot disk for OC/MacOS
* 1080p screen
* Camera w/ Shutter (No IR for Windows Hello)

## SSDTs
* [PLUG](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl) - Plugin-type=1. Enables cpu power management
* [PNLF](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/SSDT-PNLF.dsl) - Backlight Control
* USBX - USB power
* XPRW - Sleep fixes
* DGFX - Disables dGPU only in macOS (still works in windows)
* BRTK - Brightness Key patch (only affects macOS)
* BATT - Battery

## Kexts
* Lilu - Patching Kext required for many other kexts
* VirtualSMC - Fakes SMC
* SMCBatteryManager - Battery Status
* SMCProcessor - Processor Info
* SMCSuperIO - Fan speed/temperature
* WhateverGreen - Graphics Patching
* VoodooInput - Magic Trackpad emulation
* VoodooPS2Controller (Acidanthera version) - Keyboard/trackpad. Requires Voodooinput
  * Keyboard, Mouse, Trackpad
* NVMeFix - Fixes NVMe power draw and power management
* CPUFriend - Patches CPU data
* CPUFriendDataProvider - Provides data for CPUFriend - lower clock speeds. Made from CPUFriendFriend by CorpNewt
