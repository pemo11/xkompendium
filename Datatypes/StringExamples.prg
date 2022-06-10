// File: StringExamples.prg

Using System
Using System.IO
Using System.Linq

Begin Namespace XKompendium

	Static Class StringExamples

        Static Method SubstringVsSubstr1() As Void
            Local strText := "NNNJNN" As String
            // Muss immer True ergeben
            ? strText:Substring(3,1) == "J"
            // In Core nicht erlaubt wegen ==-Vergleich string/char
            #ifndef lCore
            ? strText:Substring(3,1) == 'J'
            #endif
            // Index beginnt bei 1! Dialect=VisualObjects
            ? Substr(strText, 4,1) == "J"
            Return

        Static Method Substring1() As Void
            Local s := "Sonne, Meer und Liegestühle" As String
            // ? Substr(s, 0, 5)
            // ? Substr(s, 1, 5)
            // ? s:Substring(0, 5)
            // ? s:Substring(1, 5)
            ? Left(s, 5)
            ? s:Substring(0, 5)
            // Falsch, da 5 der Startindex ist
            ? s:Substring(5)
            Return

        Static Method Instr1() As Void
            Local s := "SuperMAX" As String

            ? Instr("max", s)
            ? Instr("MAX", s)

        Static Method StringSplit() As Void
            Local s := "Sonne, Meer und Liegestühle" As String
            // Geht nur bei Vulcan.Net - nicht bei VO!
            // Local aDelim := <Char>{',',' '} As Char[]
            // ForEach s1 As String in s:Split(aDelim)
            //     ?s1
            // Next

        Static Method StringVergleich1() As Void
            Local t:= "<RubrumText>" + CRLF + "<AbsRubrumtext>Alles mögliche</AbsRubrumText></Rubrumtext>" As String
            Local s := "<RubrumText>" + CRLF + "<AbsRubrumtext>" as String
            Local s1 := "</AbsRubrumText>" + CRLF + "</Rubrumtext>" As String
            ? t:Contains(s)
            ? t:Replace("\r\n", ""):Contains(s)
            ? t:Replace("\r\n", ""):Contains(s) .And. !t:Replace("\r\n", ""):Contains(s1)

        Static Method ContainsBeispiel1() As Void
            Local strDateiname := "test.html" As String
            ? strDateiname:contains(".htm")      // ok
            ? strDateiname:contains(".html")     // ok
            ? strDateiname:contains(".Htm")      // Nicht ok, da Groß/Kleinschreibung

        Static Method SplitString(Text As String, SliceSize As Int) As String[]
            Local sliceCount := Text:Length / SliceSize  As Int
            Local tmp := String[]{sliceCount+1} As String[]
            For Local i := 0 Upto sliceCount - 1
                tmp[i+1] := Text:Substring(i * sliceCount, SliceSize)
            Next
            // Den Rest einfügen
            tmp[sliceCount+1] := Text:Substring(sliceCount * sliceSize)
            Return tmp

        Static Method SplitStringTest() As Void
            Local text := "Sonne, Strand, Meer und Bier" As String
            Local tmpFeld := SplitString(text, 5) As String[]
            Foreach tmp As String In tmpFeld
                ?tmp
            Next

        Static Method TrimStrings() As Void
            Local text := "   !!Suppen Huhn!!   " As String
            Local text1 := AllTrim(text) As String
            Local text2 := text:Trim() As String
            Local text3 := text:Trim(c" ",c"!") As String
            ? i"*** AllTrim:{text1} ({text1:length})"
            ? i"*** Trim:{text2} ({text2:length})"
            ? i"*** Trim !:{text3} ({text3:length})"

    End Class

End Namespace
