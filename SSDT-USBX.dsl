/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20191213 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-USBX.aml, Tue Jan 28 13:08:11 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000B9 (185)
 *     Revision         0x02
 *     Checksum         0xC6
 *     OEM ID           "hack"
 *     OEM Table ID     "_USBX"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_USBX", 0x00000000)
{
    Device (_SB.USBX)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x08)
            {
                "kUSBWakePowerSupply", 
                0x0C80, 
                "kUSBSleepPowerSupply", 
                0x0A28, 
                "kUSBSleepPortCurrentLimit", 
                0x0834, 
                "kUSBWakePortCurrentLimit", 
                0x0834
            })
        }
    }
}

