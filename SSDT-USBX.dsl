DefinitionBlock ("", "SSDT", 2, "GWYD", "_USBX", 0x00000000)
{
    Device (_SB.USBX)
    {
        Name (_ADR, Zero)
        Method (_DSM, 4, NotSerialized)
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03
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

