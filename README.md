# X1-Extreme-OpenCore-Resources

**Last OC Version**: 0.5.9

With OpenCore, we get bootcamp support as well as proper Kext injection (No more Clover breaking SIP, yay!). OpenCore also has a cleaner code base and boots faster. This repo also provides ACPI "hotpatches" for battery status, rather than needing a patched DSDT provided. This makes it more likely to survive BIOS updates without requiring any other patches. Also makes it so that if we ever need to make anything OS specific, it is easier to do so.

#### This repo is really meant to be used as a source of information to reference rather than provide a full EFI.
I'd strongly suggest reading https://dortania.github.io/OpenCore-Desktop-Guide/ (Dortania's OpenCore Desktop Guide). [This laptop guide which references the Desktop Guide is not a bad read as well](https://dortania.github.io/oc-laptop-guide/)

### What works
* Booting Linux, Windows, and MacOS through OpenCore.
  * Bootcamp switching like on a real mac works in MacOS and Windows
  * Only thing that really breaks in Windows is Lenovo Vantage. You can use Linooox to edit battery parameters though. This also does reset the fingerprint reader and require you to re-add your finger. This also completely breaks using your fingerprint to allow the device to boot (before any OS loads).
* Sleeping in MacOS
  * Less than 1-2% battery used every few hours for sleep
* Backlight Control
* USB
* Intel Bluetooth
  * Require's zxystd's IntelBluetoothFirmware - though it causes panics waking from sleep
  * Seems to work better with firmware uploaded for wifi too.
* Camera/Mic
* Volume and Backlight keys

### What doesn't work
* Hibernation in macOS (Haven't really tried to fix)

### Haven't Tested
* SD Card Reader
* Thunderbolt - No thunderbolt devices. USB C works fine

### Note on Wifi

Currently helping out a little with the development of a wifi kext for intel cards:
* [hatf0's](https://github.com/AppleIntelWifi/adapter) - this one has working scanning for the AC9560

You can fit in an airport adapter in the slot, though you lose bluetooth as that isn't wired. Instead, bluetooth is wired to the PCH where the actual bluetooth module is. You can get bluetooth back by connecting the bluetooth specifically to the Smartcard port. I'm going to continue using my Intel 9560 as it works in other operating systems well and don't want to get an adapter.

## Specs
* I7 8750h
* GTX 1050ti
* Intel 512GB ssd
* 1Tb Sabrant Rocket (TLC) - Boot disk for OC/MacOS
* 1080p screen
* Camera w/ Shutter (No IR for Windows Hello)
* Intel 9560 Wifi card

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
* VoodooPS2Controller (Acidanthera version) - Keyboard
   * Keyboard
* VoodooRMI - Trackpad/Trackstick
   * Synaptics SMBus trackpad driver
   * Requires VoodooPS2Trackpad/Mouse disabled
   * Reliable four finger gestures and overall better tracking
   * Does stop responding after sleeping at times - unknown why.
      * If this is an issue, use VoodooPS2Mouse/Trackpad
* NVMeFix - Fixes NVMe power draw and power management
* CPUFriend - Patches CPU data
* CPUFriendDataProvider - Provides data for CPUFriend - lower clock speeds. Made from CPUFriendFriend by CorpNewt
* Zxystd's IntelBluetoothInjector
  * IntelBluetoothInjector
  * IntelBluetoothFirmware
  * Additional Bluetooth functionality - does break sleep though. Loading wifi firmware through the kext at AppleIntelWifi/adapter fixes this.


## Device Properties
* iGPU
  * Apple GuC firmware for better iGPU performance
    * igfxpavp = 1
    * igfxfw = 2
  * Shikigva=128 - Disables patches for Fairplay 1.0 to try and use iGPU
    * This doesn't really add functionality and is more for experimentation. You can safely skip this.
