DefinitionBlock ("", "SSDT", 2, "GWYD", "BRTK", 0) {
    External (\_SB.PCI0.LPCB.EC, DeviceObj)
    External (\_SB.PCI0.LPCB.KBD, DeviceObj)
    External (\_SB.PCI0.GFX0.DD1F, DeviceObj)
    External (\_SB.PCI0.PEG0.PEGP.LCD0, DeviceObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.MHKK, MethodObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.MHKQ, MethodObj)
    
    External (\VIGD, FieldUnitObj)
    
    Scope (\_SB.PCI0.LPCB.EC) {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (\_SB.PCI0.LPCB.EC.HKEY.MHKK (0x01, 0x8000))
            {
                \_SB.PCI0.LPCB.EC.HKEY.MHKQ (0x1010)
            }
            
            If (_OSI("Darwin")) {
                // Brightness Up
                Notify (\_SB.PCI0.LPCB.KBD, 0x0406)
            }

            If (\VIGD)
            {
                Notify (\_SB.PCI0.GFX0.DD1F, 0x86) // Device-Specific
            }
            Else
            {
                Notify (\_SB.PCI0.PEG0.PEGP.LCD0, 0x86) // Device-Specific
            }
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (\_SB.PCI0.LPCB.EC.HKEY.MHKK (0x01, 0x00010000))
            {
                \_SB.PCI0.LPCB.EC.HKEY.MHKQ (0x1011)
            }

            If (_OSI("Darwin")) {
                // Brightness Down
                Notify (\_SB.PCI0.LPCB.KBD, 0x0405)
            }
            
            If (\VIGD)
            {
                Notify (\_SB.PCI0.GFX0.DD1F, 0x87) // Device-Specific
            }
            Else
            {
                Notify (\_SB.PCI0.PEG0.PEGP.LCD0, 0x87) // Device-Specific
            }

            Return (Zero)
        }
    }
}
            