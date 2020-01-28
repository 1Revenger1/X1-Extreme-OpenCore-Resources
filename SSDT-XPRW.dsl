DefinitionBlock("", "SSDT", 2, "GWYD", "XPRW", 0) {
    External (XPRW, MethodObj)
    
    Method (GPRW, 2) {
        For (,,) {
            If (!(_OSI("Darwin"))) { Break }
            If (0x6D == Arg0) { Return (Package(0x02) { 0x6D, 0x00 }) }
            If (0x0D == Arg0) { Return (Package(0x02) { 0x0D, 0x00 }) }
            Break
         }
         Return (XPRW(Arg0, Arg1))
    }
}