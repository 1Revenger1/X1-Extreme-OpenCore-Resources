DefinitionBlock("", "SSDT", 2, "GWYD", "BATT", 0) {
    
    External (\_SB.PCI0.LPCB.EC, DeviceObj)
    External (\_SB.LID, DeviceObj)
    External (\_SB.SLPB, DeviceObj)
    
    External (\_SB.PCI0.LPCB.EC.BATM, MutexObj)
    
    External (\_SB.PCI0.LPCB.EC.AC._PSR, MethodObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.MHKE, MethodObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.MHKQ, MethodObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.DYTC, MethodObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.WGWK, MethodObj)
    External (\_SB.PCI0.LPCB.EC.EVNT, MethodObj)
    External (\_SB.PCI0.LPCB.EC.FNST, MethodObj)
    External (\_SB.PCI0.LPCB.EC.HFNI, MethodObj)
    External (\_SB.PCI0.LPCB.EC.SYSC, MethodObj)
    External (\_SB.PCI0.LPCB.EC.ATMC, MethodObj)
    External (\_SB.PCI0.LPCB.EC.BRNS, MethodObj)
    External (\_SB.PCI0.LPCB.EC.BATW, MethodObj)
    External (\_SB.LID._LID, MethodObj)
    External (\ADBG, MethodObj)
    External (\PNOT, MethodObj)
    External (\UCMS, MethodObj)
    External (\CSUM, MethodObj)
    External (\VSLD, MethodObj)
    External (\NVSS, MethodObj)
    External (\PNTF, MethodObj)
    External (\VBTD, MethodObj)
    External (\VCMS, MethodObj)
    External (\AWON, MethodObj)
    External (\VBRC, MethodObj)
    External (\_SI._SST, MethodObj)
    
    External (\WAKI, PkgObj)
    
    External (\_SB.PCI0.LPCB.EC.HKEY.ANGN, IntObj)
    External (\_SB.PCI0.LPCB.EC.HKEY.DHKC, IntObj)
    External (\_SB.PCI0.LPCB.EC.B0I0, IntObj)
    External (\_SB.PCI0.LPCB.EC.B0I1, IntObj)
    External (\_SB.PCI0.LPCB.EC.B0I2, IntObj)
    External (\_SB.PCI0.LPCB.EC.B0I3, IntObj)
    External (\_SB.PCI0.LPCB.EC.B1I0, IntObj)
    External (\_SB.PCI0.LPCB.EC.B1I1, IntObj)
    External (\_SB.PCI0.LPCB.EC.B1I2, IntObj)
    External (\_SB.PCI0.LPCB.EC.B1I3, IntObj)
    External (\_SB.PCI0.LPCB.EC.C2SU, IntObj)
    External (\RRBF, IntObj)
    External (\SPS , IntObj)
    External (\FNID, IntObj)
    External (\ACST, IntObj)
    External (\WVIS, IntObj)
    External (\NBCF, IntObj)
    // ECOR Field
    External (\_SB.PCI0.LPCB.EC.HIID, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.HB0S, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.HB1S, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.SBBM, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.BSWA, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.BSWR, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.HFSP, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.HCMU, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.DCWL, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.ELNK, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.HSPA, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC.LGMS, FieldUnitObj)
    
    External (\VIGD, FieldUnitObj)
    External (\LIDB, FieldUnitObj)
    External (\WLAC, FieldUnitObj)
    External (\CHKE, FieldUnitObj)
    External (\PWRS, FieldUnitObj)
    External (\OSC4, FieldUnitObj)
    External (\CHKC, FieldUnitObj)
    External (\SCRM, FieldUnitObj)
    External (\IOEN, FieldUnitObj)
    External (\IOST, FieldUnitObj)
    External (\ISWK, FieldUnitObj)
    External (\CMPR, FieldUnitObj)
    External (\BRLV, FieldUnitObj)
    
    External (\_TZ.THM0, ThermalZoneObj)
    
    External (\_SB.PCI0.GFX0.CLID, UnknownObj)
    
    // Old methods
    External (\_SB.PCI0.LPCB.EC.XJTP, MethodObj)
    External (\_SB.PCI0.LPCB.EC.XBIF, MethodObj)
    External (\_SB.PCI0.LPCB.EC.XBIX, MethodObj)
    External (\_SB.PCI0.LPCB.EC.XBST, MethodObj)
    External (\_GPE.XL17, MethodObj)
    External (\XWAK, MethodObj)
    
    /*
     *    Rehabman's Methods
     */
    
    // Status from two EC fields
    Method (B1B2, 2, NotSerialized) {
        Return(Arg0 | (Arg1 << 0x08))
    }

    // Status from four EC fields
    Method (B1B4, 4, NotSerialized)
    {
        Local0 = Arg3
        Local0 = Arg2 | (Local0 << 0x08)
        Local0 = Arg1 | (Local0 << 0x08)
        Local0 = Arg0 | (Local0 << 0x08)
        Return(Local0)
    }
    
    Scope (\_SB.PCI0.LPCB.EC) {
        
        /*  Called from RECB, grabs a single byte from EC
         *  Arg0 - offset in bytes from zero-based EC
         */
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion(XXOR, EmbeddedControl, Arg0, 1)
            Field(XXOR, ByteAcc, NoLock, Preserve) { BYTE, 8 }
            Return(BYTE)
        }
        
        /*  Grabs specified number of bytes from EC
         *  Arg0 - offset in bytes from zero-based EC
         *  Arg1 - size of buffer in bits
         */
        Method (RECB, 2, Serialized)
        {
            Arg1 = Arg1 >> 0x03
            Name(TEMP, Buffer(Arg1) { })
            Arg1 = Arg0 + Arg1
            Local0 = 0
            While (Arg0 < Arg1)
            {
                Store(RE1B(Arg0), Index(TEMP, Local0))
                Arg0++
                Local0++
            }
            Return(TEMP)
        }
        
    }
    
    /*
     *    End of Rehabman's Methods
     */
    
    Scope (\_SB.PCI0.LPCB.EC) {
        OperationRegion (XCOR, EmbeddedControl, 0x00, 0x0100)
            
        Field(XCOR, ByteAcc, NoLock, Preserve) {
            Offset (0x36),
            AC10,    8 ,
            AC11,    8 ,
            Offset (0xA0),
            RC00,    8 ,
            RC01,    8 ,
            FC00,    8 ,
            FC01,    8 ,
            Offset (0xA8),
            AC00,    8 ,
            AC01,    8 ,
            BV00,    8 ,
            BV01,    8  
        }
        
        Field(XCOR, ByteAcc, NoLock, Preserve) {
            Offset (0xA0),
            DC00,    8 ,
            DC01,    8 ,
            DV00,    8 ,
            DV01,    8 ,
            Offset (0xAA),
            SN00,    8 ,
            SN01,    8            
        }
        
        Field (XCOR, ByteAcc, NoLock, Preserve) {
            Offset (0xA0),
            SB00,    8 ,
            SB01,    8 ,
            Offset (0xA4),
            CC00,    8 ,
            CC01,    8
        }
        
        Field (XCOR, ByteAcc, NoLock, Preserve) {
            Offset (0xA0),
            CH00,    8,
            CH01,    8,
            CH02,    8,
            CH03,    8
        }
        
        /*
         *  ---------------------------- AJTP ----------------------------
         *  SBRC -> B1B2(RC00, RC01)
         */
        
        Method (AJTP, 3, NotSerialized)
        {
            if(!_OSI("Darwin")) {
                Return ( XJTP( Arg0, Arg1, Arg2))           
            }
            
            Local0 = Arg1
            Acquire (BATM, 0xFFFF)
            HIID = Arg0
            Local1 = B1B2(RC00, RC01) // SBRC
            Release (BATM)
            
            If ((Arg0 == 0x00))
            {
                Local2 = HB0S /* \_SB_.PCI0.LPCB.EC__.HB0S */
            }
            Else
            {
                Local2 = HB1S /* \_SB_.PCI0.LPCB.EC__.HB1S */
            }

            If ((Local2 & 0x20))
            {
                If ((Arg2 > 0x00))
                {
                    Local0 += 0x01
                }

                If ((Local0 <= Local1))
                {
                    Local0 = (Local1 + 0x01)
                }
            }
            ElseIf ((Local2 & 0x40))
            {
                If ((Local0 >= Local1))
                {
                    Local0 = (Local1 - 0x01)
                }
            }

            Return (Local0)
        }

        /*
         *  ---------------------------- GBIF ----------------------------
         *  SBFC -> B1B2(FC00, FC01)
         *  SBBM -> B1B2(SB00, SB01)
         *  SBDC -> B1B2(DC00, DC01)
         *  SBDV -> B1B2(DV00, DV01)
         *  SBSN -> B1B2(SN00, SN01)
         *  SBCH -> B1B4(CH00, CH01, CH02, CH03)
         *  SBMN -> RECB (0xA0, 128)
         *  SBDN -> RECB (0xA0, 128)
         */

        Method (GBIF, 3, NotSerialized)
        {
            if(!_OSI("Darwin")) {
                Return ( XBIF( Arg0, Arg1, Arg2))           
            }
            
            Acquire (BATM, 0xFFFF)
            If (Arg2)
            {
                HIID = (Arg0 | 0x01)
                Local7 = B1B2(SB00, SB01) // SBBM
                Local7 >>= 0x0F
                Arg1 [0x00] = (Local7 ^ 0x01)
                HIID = Arg0
                If (Local7)
                {
                    Local1 = (B1B2(FC00, FC01) * 0x0A) // SBFC
                }
                Else
                {
                    Local1 = B1B2(FC00, FC01) // SBFC
                }

                Arg1 [0x02] = Local1
                HIID = (Arg0 | 0x02)
                If (Local7)
                {
                    Local0 = (B1B2(DC00, DC01) * 0x0A) // SBDC
                }
                Else
                {
                    Local0 = B1B2(DC00, DC01) // SBDC
                }

                Arg1 [0x01] = Local0
                Divide (Local1, 0x14, Local2, Arg1 [0x05])
                If (Local7)
                {
                    Arg1 [0x06] = 0xC8
                }
                ElseIf (B1B2(DV00, DV01)) // SBDV
                {
                    Divide (0x00030D40, B1B2(DV00, DV01), Local2, Arg1 [0x06]) // SBDV
                }
                Else
                {
                    Arg1 [0x06] = 0x00
                }

                Arg1 [0x04] = B1B2(DV00, DV01) // SBDV
                Local0 = B1B2(SN00, SN01) // SBSN
                Name (SERN, Buffer (0x06)
                {
                    "     "
                })
                Local2 = 0x04
                While (Local0)
                {
                    Divide (Local0, 0x0A, Local1, Local0)
                    SERN [Local2] = (Local1 + 0x30)
                    Local2--
                }

                Arg1 [0x0A] = SERN /* \_SB_.PCI0.LPCB.EC__.GBIF.SERN */
                HIID = (Arg0 | 0x06)
                Arg1 [0x09] = RECB (0xA0, 128) // SBDN
                HIID = (Arg0 | 0x04)
                Name (BTYP, Buffer (0x05)
                {
                        0x00, 0x00, 0x00, 0x00, 0x00                     // .....
                })
                BTYP = B1B4(CH00, CH01, CH02, CH03) // SBCH
                Arg1 [0x0B] = BTYP /* \_SB_.PCI0.LPCB.EC__.GBIF.BTYP */
                HIID = (Arg0 | 0x05)
                Arg1 [0x0C] = RECB (0xA0, 128) // SBMN
            }
            Else
            {
                Arg1 [0x01] = 0xFFFFFFFF
                Arg1 [0x05] = 0x00
                Arg1 [0x06] = 0x00
                Arg1 [0x02] = 0xFFFFFFFF
            }

            Release (BATM)
            Return (Arg1)
        }

        /*
         *  ---------------------------- GBIX ----------------------------
         *  SBFC -> B1B2(FC00, FC01)
         *  SBBM -> B1B2(SB00, SB01)
         *  SBCC -> B1B2(CC00, CC01)
         *  SBDC -> B1B2(DC00, DC01)
         *  SBDV -> B1B2(DV00, DV01)
         *  SBSN -> B1B2(SN00, SN01)
         *  SBCH -> B1B4(CH00, CH01, CH02, CH03)
         *  SBMN -> RECB (0xA0, 128)
         *  SBDN -> RECB (0xA0, 128)
         */

        Method (GBIX, 3, NotSerialized)
        {
            if(!_OSI("Darwin")) {
                Return ( XBIX( Arg0, Arg1, Arg2))           
            }
            
            Acquire (BATM, 0xFFFF)
            If (Arg2)
            {
                HIID = (Arg0 | 0x01)
                Local7 = B1B2(CC00, CC01) // SBCC
                Arg1 [0x08] = Local7
                Local7 = B1B2(SB00, SB01) // SBBM
                Local7 >>= 0x0F
                Arg1 [0x01] = (Local7 ^ 0x01)
                HIID = Arg0
                If (Local7)
                {
                    Local1 = (B1B2(FC00, FC01) * 0x0A) // SBFC
                }
                Else
                {
                    Local1 = B1B2(FC00, FC01) // SBFC
                }

                Arg1 [0x03] = Local1
                HIID = (Arg0 | 0x02)
                If (Local7)
                {
                    Local0 = (B1B2(DC00, DC01) * 0x0A) // SBDC
                }
                Else
                {
                    Local0 = B1B2(DC00, DC01) // SBDC
                }

                Arg1 [0x02] = Local0
                Divide (Local1, 0x14, Local2, Arg1 [0x06])
                If (Local7)
                {
                    Arg1 [0x07] = 0xC8
                }
                ElseIf (B1B2(DV00, DV01)) // SBDV
                {
                    Divide (0x00030D40, B1B2(DV00, DV01), Local2, Arg1 [0x07]) // SBDV
                }
                Else
                {
                    Arg1 [0x07] = 0x00
                }

                Arg1 [0x05] = B1B2(DV00, DV01) // SBDV
                Local0 = B1B2(SN00, SN01) // SBSN
                Name (SERN, Buffer (0x06)
                {
                    "     "
                })
                Local2 = 0x04
                While (Local0)
                {
                    Divide (Local0, 0x0A, Local1, Local0)
                    SERN [Local2] = (Local1 + 0x30)
                    Local2--
                }

                Arg1 [0x11] = SERN /* \_SB_.PCI0.LPCB.EC__.GBIX.SERN */
                HIID = (Arg0 | 0x06)
                Arg1 [0x10] = RECB (0xA0, 128) // SBDN
                HIID = (Arg0 | 0x04)
                Name (BTYP, Buffer (0x05)
                {
                        0x00, 0x00, 0x00, 0x00, 0x00                     // .....
                })
                BTYP = B1B4(CH00, CH01, CH02, CH03) // SBCH
                Arg1 [0x12] = BTYP /* \_SB_.PCI0.LPCB.EC__.GBIX.BTYP */
                HIID = (Arg0 | 0x05)
                Arg1 [0x13] = RECB (0xA0, 128) // SBMN
            }
            Else
            {
                Arg1 [0x02] = 0xFFFFFFFF
                Arg1 [0x06] = 0x00
                Arg1 [0x07] = 0x00
                Arg1 [0x03] = 0xFFFFFFFF
            }

            Release (BATM)
            Return (Arg1)
        }
        
        /*
        *  ---------------------------- GBST ----------------------------
        *  SBRC -> B1B2(RC00, RC01)
        *  SBAC -> B1B2(AC00, AC01), 
        *  SBVO -> B1B2(B1B2(BV00, BV01)
        */

        Method (GBST, 4, NotSerialized)
        {
            if(!_OSI("Darwin")) {
                Return ( XBST( Arg0, Arg1, Arg2, Arg3))           
            }
            
            Acquire (BATM, 0xFFFF)
            If ((Arg1 & 0x20))
            {
                Local0 = 0x02
            }
            ElseIf ((Arg1 & 0x40))
            {
                Local0 = 0x01
            }
            Else
            {
                Local0 = 0x00
            }

            If ((Arg1 & 0x07)){}
            Else
            {
                Local0 |= 0x04
            }

            If (((Arg1 & 0x07) == 0x07))
            {
                Local0 = 0x04
                Local1 = 0x00
                Local2 = 0x00
                Local3 = 0x00
            }
            Else
            {
                HIID = Arg0
                Local3 = B1B2(BV00, BV01) // SBVO
                If (Arg2)
                {
                    Local2 = (B1B2(RC00, RC01) * 0x0A) // SBRC
                }
                Else
                {
                    Local2 = B1B2(RC00, RC01) // SBRC
                }

                Local1 = B1B2(AC00, AC01) // SBAC
                If ((Local1 >= 0x8000))
                {
                    If ((Local0 & 0x01))
                    {
                        Local1 = (0x00010000 - Local1)
                    }
                    Else
                    {
                        Local1 = 0x00
                    }
                }
                ElseIf (!(Local0 & 0x02))
                {
                    Local1 = 0x00
                }

                If (Arg2)
                {
                    Local1 *= Local3
                    Divide (Local1, 0x03E8, Local7, Local1)
                }
            }

            Local5 = (0x01 << (Arg0 >> 0x04))
            BSWA |= BSWR /* \_SB_.PCI0.LPCB.EC__.BSWR */
            If (((BSWA & Local5) == 0x00))
            {
                Arg3 [0x00] = Local0
                Arg3 [0x01] = Local1
                Arg3 [0x02] = Local2
                Arg3 [0x03] = Local3
                If ((Arg0 == 0x00))
                {
                    B0I0 = Local0
                    B0I1 = Local1
                    B0I2 = Local2
                    B0I3 = Local3
                }
                Else
                {
                    B1I0 = Local0
                    B1I1 = Local1
                    B1I2 = Local2
                    B1I3 = Local3
                }
            }
            Else
            {
                If (\_SB.PCI0.LPCB.EC.AC._PSR ())
                {
                    If ((Arg0 == 0x00))
                    {
                        Arg3 [0x00] = B0I0 /* \_SB_.PCI0.LPCB.EC__.B0I0 */
                        Arg3 [0x01] = B0I1 /* \_SB_.PCI0.LPCB.EC__.B0I1 */
                        Arg3 [0x02] = B0I2 /* \_SB_.PCI0.LPCB.EC__.B0I2 */
                        Arg3 [0x03] = B0I3 /* \_SB_.PCI0.LPCB.EC__.B0I3 */
                    }
                    Else
                    {
                        Arg3 [0x00] = B1I0 /* \_SB_.PCI0.LPCB.EC__.B1I0 */
                        Arg3 [0x01] = B1I1 /* \_SB_.PCI0.LPCB.EC__.B1I1 */
                        Arg3 [0x02] = B1I2 /* \_SB_.PCI0.LPCB.EC__.B1I2 */
                        Arg3 [0x03] = B1I3 /* \_SB_.PCI0.LPCB.EC__.B1I3 */
                    }
                }
                Else
                {
                    Arg3 [0x00] = Local0
                    Arg3 [0x01] = Local1
                    Arg3 [0x02] = Local2
                    Arg3 [0x03] = Local3
                }

                If ((((Local0 & 0x04) == 0x00) && ((Local2 > 0x00) && 
                    (Local3 > 0x00))))
                {
                    BSWA &= ~Local5
                    Arg3 [0x00] = Local0
                    Arg3 [0x01] = Local1
                    Arg3 [0x02] = Local2
                    Arg3 [0x03] = Local3
                }
            }

            Release (BATM)
            Return (Arg3)
        }
    }

    // ---------------------------- END EC ---------------------------


    /*
     *  ---------------------------- _L17 ----------------------------
     *  HWAC -> B1B2(AC10, AC11)
     */
    
    Scope (\_GPE) {
        Method (_L17, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            if(!_OSI("Darwin")) {
                \_GPE.XL17()
                Return ()           
            }
            
            Local0 = B1B2(\_SB.PCI0.LPCB.EC.AC10,\_SB.PCI0.LPCB.EC.AC11)
            \RRBF = Local0
            Sleep (0x0A)
            If ((Local0 & 0x02)){}
            If ((Local0 & 0x04))
            {
                Notify (\_SB.LID, 0x02) // Device Wake
            }

            If ((Local0 & 0x08))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If ((Local0 & 0x10))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If ((Local0 & 0x40)){}
            If ((Local0 & 0x80))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }
        }
    }
    
    /*
     *  ---------------------------- OWAK ----------------------------
     *  HWAC -> B1B2(AC10, AC11)
     */

    Method (OWAK, 1, NotSerialized)
    {
        if(!_OSI("Darwin")) {
            Return ( XWAK( Arg0))           
        }
        
        ADBG ("OWAK")
        If (_OSI("Darwin") && Arg0 == 0x03) {
            \_SI._SST(0x01) // Reset LED to working state
        }
        
        If (((Arg0 == 0x00) || (Arg0 >= 0x05)))
        {
            Return (WAKI) /* \WAKI */
        }

        \SPS = 0x00
        \_SB.PCI0.LPCB.EC.HCMU = 0x00
        \_SB.PCI0.LPCB.EC.EVNT (0x01)
        \_SB.PCI0.LPCB.EC.HKEY.MHKE (0x01)
        \_SB.PCI0.LPCB.EC.FNST ()
        \UCMS (0x0D)
        \LIDB = 0x00
        If ((Arg0 == 0x01))
        {
            \FNID = \_SB.PCI0.LPCB.EC.HFNI
        }

        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.LPCB.EC.SYSC (0x30)
            \NVSS (0x00)
            \PWRS = \_SB.PCI0.LPCB.EC.AC._PSR ()
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            If ((\ACST != \_SB.PCI0.LPCB.EC.AC._PSR ()))
            {
                \_SB.PCI0.LPCB.EC.ATMC ()
            }

            If (\SCRM)
            {
                \_SB.PCI0.LPCB.EC.HFSP = 0x07
            }

            \IOEN = 0x00
            \IOST = 0x00
            If ((\ISWK == 0x01))
            {
                If (\_SB.PCI0.LPCB.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPCB.EC.HKEY.MHKQ (0x6070)
                }
            }

            If (\VIGD)
            {
                \_SB.PCI0.GFX0.CLID = \_SB.LID._LID ()
                If (\WVIS)
                {
                    \VBTD ()
                }
            }
            ElseIf (\WVIS)
            {
                \_SB.PCI0.GFX0.CLID = \_SB.LID._LID ()
                \VBTD ()
            }

            \VCMS (0x01, \_SB.LID._LID ())
            \AWON (0x00)
            If (\CMPR)
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
                \CMPR = 0x00
            }

            If ((\WLAC == 0x02)){}
            ElseIf ((\_SB.PCI0.LPCB.EC.ELNK && (\WLAC == 0x01)))
            {
                \_SB.PCI0.LPCB.EC.DCWL = 0x00
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.DCWL = 0x01
            }
        }

        If ((Arg0 == 0x04))
        {
            \NVSS (0x00)
            \_SB.PCI0.LPCB.EC.HSPA = 0x00
            \PWRS = \_SB.PCI0.LPCB.EC.AC._PSR ()
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            \_SB.PCI0.LPCB.EC.ATMC ()
            If (\SCRM)
            {
                \_SB.PCI0.LPCB.EC.HFSP = 0x07
            }

            If (!\NBCF)
            {
                If (\VIGD)
                {
                    \_SB.PCI0.LPCB.EC.BRNS ()
                }
                Else
                {
                    \VBRC (\BRLV)
                }
            }

            \IOEN = 0x00
            \IOST = 0x00
            If ((\ISWK == 0x02))
            {
                If (\_SB.PCI0.LPCB.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPCB.EC.HKEY.MHKQ (0x6080)
                }
            }

            If ((\WLAC == 0x02)){}
            ElseIf ((\_SB.PCI0.LPCB.EC.ELNK && (\WLAC == 0x01)))
            {
                \_SB.PCI0.LPCB.EC.DCWL = 0x00
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.DCWL = 0x01
            }
        }

        \_SB.PCI0.LPCB.EC.BATW (Arg0)
        \_SB.PCI0.LPCB.EC.HKEY.WGWK (Arg0)
        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
        \VSLD (\_SB.LID._LID ())
        If (\VIGD)
        {
            \_SB.PCI0.GFX0.CLID = \_SB.LID._LID ()
        }
        ElseIf (\WVIS)
        {
            \_SB.PCI0.GFX0.CLID = \_SB.LID._LID ()
        }

        If ((Arg0 < 0x04))
        {
            If (((\RRBF & 0x02) || (B1B2(\_SB.PCI0.LPCB.EC.AC10,\_SB.PCI0.LPCB.EC.AC11) & 0x02)))
            {
                Local0 = (Arg0 << 0x08)
                Local0 = (0x2013 | Local0)
                \_SB.PCI0.LPCB.EC.HKEY.MHKQ (Local0)
            }
        }

        If ((Arg0 == 0x04))
        {
            Local0 = 0x00
            Local1 = \CSUM (0x00)
            If ((Local1 != \CHKC))
            {
                Local0 = 0x01
                \CHKC = Local1
            }

            Local1 = \CSUM (0x01)
            If ((Local1 != \CHKE))
            {
                Local0 = 0x01
                \CHKE = Local1
            }

            If (Local0)
            {
                Notify (\_SB, 0x00) // Bus Check
            }
        }

        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            ADBG ("_WAK0")
            \_SB.PCI0.LPCB.EC.HKEY.ANGN = 0x00
            \_SB.PCI0.LPCB.EC.HKEY.DYTC (0x000F0001)
            ADBG ("_WAK1")
            If (\_SB.PCI0.LPCB.EC.LGMS)
            {
                \_SB.PCI0.LPCB.EC.C2SU = 0x00
                PNOT ()
            }
            Else
            {
                \_SB.PCI0.LPCB.EC.C2SU = 0x01
                PNOT ()
            }
        }

        \RRBF = Zero
        ADBG ("OWAK END")
        Return (WAKI) /* \WAKI */
    }
}