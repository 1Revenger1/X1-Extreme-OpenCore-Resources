# X1-Extreme-OpenCore-Resources

With OpenCore, we get bootcamp support as well as proper Kext injection (No more Clover breaking SIP, yay!). This also "hotpatches" ACPI for battery status, rather than needing a patched DSDT provided. This makes it more likely to survive BIOS updates without requiring any other patches. Also makes it so that if we ever need to make anything OS specific, it is easier to do so.

### What works
* Bootcamp switching/Booting windows through OpenCore
* Fingerprint reader in Windows
* Sleep in both oses (Hibernation in Windows too)
* Backlight Control
* USB
* Bluetooth (Might break if I replace wifi card)

### What doesn't work
* SD Card reader in macOS (Maybe a fix, I haven't looked to be honest)
* Hibernation in macOS (Haven't really tried to fix)
* Wifi - I haven't replaced the wifi card yet

## Specs
* I7 8750h
* GTX 1050ti
* Intel 512GB ssd
* 1Tb Sabrant Rocket (TLC) - Boot disk for OC/MacOS
* 1080p screen

## SSDTs
* PLUG - Plugin-type=1. Enables cpu power management
* PNLF - Backlight Control
* USBX - USB power
* XPRW - Sleep fixes
* DGFX - Disables dGPU only in macOS (still works in windows)
* BRTK - Brightness Key patch (only affects macOS)

## Kexts
* Lilu - Patching Kext required for many other kexts
* VirtualSMC - Fakes SMC
* SMCBatteryManager - Battery Status
* SMCProcessor - Processor Info
* SMCSuperIO - Fan speed/temperature
* WhateverGreen - Graphics Patching
* VoodooInput - Magic Trackpad emulation
* VoodooPS2Controller - Keyboard/trackpad. Requires Voodooinput
  * Keyboard, Mouse, Trackpad
* NVMeFix - Fixes NVMe power draw and power management
* CPUFriend - Patches CPU data
* CPUFriendDataProvider - Provides data for CPUFriend - lower clock speeds. Made from CPUFriendFriend by CorpNewt
