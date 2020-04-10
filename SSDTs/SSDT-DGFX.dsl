DefinitionBlock ("", "SSDT", 2, "MAEMO", "NoHybGfx", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._DSM, MethodObj)
    External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)

    Device (NHG1)
    {
        Name (_HID, "NHG10000")
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_INI, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Local0 = ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0")
                \_SB.PCI0.PEG0.PEGP._DSM (Local0, 0x0100, 0x1A, Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x03
                    })
                \_SB.PCI0.PEG0.PEGP._PS3 ()
            }
        }
    }
}

