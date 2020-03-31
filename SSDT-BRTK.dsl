DefinitionBlock ("", "SSDT", 2, "GWYD", "BRTK", 0) {
    External (\_SB.PCI0.LPCB.EC.XQ14, MethodObj)
    External (\_SB.PCI0.LPCB.EC.XQ15, MethodObj)
    External (\_SB.PCI0.LPCB.KBD, DeviceObj)
    External (\_SB.PCI0.LPCB.EC, DeviceObj)
    
    Scope (\_SB.PCI0.LPCB.EC) {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {   
            If (_OSI("Darwin")) {
                // Brightness Up
                Notify (\_SB.PCI0.LPCB.KBD, 0x0406)
            }
            
            XQ14()
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI("Darwin")) {
                // Brightness Down
                Notify (\_SB.PCI0.LPCB.KBD, 0x0405)
            }
            
            Return(XQ15())
        }
    }
}
            