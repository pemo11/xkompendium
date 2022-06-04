Using System
Using System.Collections.Generic
Using System.Linq

#pragma options("lb", On)

Begin Namespace XSharpAllgemein

    [STAThread];
	Function Start() As Void
        Local quelle := "D:\Java11" As String
        Local ziel := "D:\Java11-Kopie" As String
        DirectoryMove.MoveDirectory(quelle, ziel)
        // Local strRandom := DiverseFunctions.getRandom2(8) As String
        // ? strRandom
        // NumericBeispiele.Precision03()
        // DataTableLinq.TableForEachBeispiel1()
        // AscanBeispiele.AScan2()
        // ArrayBeispiele2.CheckEmptyArray()
        // ArrayBeispiele2.FindObject1()
        // ExceptionBeispiele.ExceptionBeispiel2()
        // StringInterpolation.NumberFormat()
        // EFDatenbank.EFDatenbankBeispiel2()
        // EFDatenbank.EFDatenbankBeispiel1()
        // DBServerBeispiele.DBBeispiel3()
        // StringBeispiele.TrimStrings()
        // StringBeispiele.SplitStringTest()
        // Schleifen.For2()
        // Dateien.WriteText2()
        // Dateien.WriteText1()
        // AnonymeMethoden.Beispiel3()
        // OracleTest.DecimalTest3()
        // DatumsBeispiele.NullDate1()
        // EventsBeispiele.StartEvent1()
        // NamedArguments.NamedArgs1()
        // DbServerBeispiele.DBBeispiel2()
        // AScanBeispiele.AScan1()
        // StringBeispiele.SubstringVsSubstr1()
        // ExtensionMethods1.Beispiel1()
        // StringInterpolation.Path1();
        // StringInterpolation.Exception1()
        // StringInterpolation.Zufallszahl1()
        // StringInterpolation.Datumsausgabe2()
        // Schleifen.LoopBreak()
        // LINQDataColumn.SortColumns1()
        // ArrayBeispiele2.ArrayContains1()
        // LinqBeispiele.SelectBeispiel2()
        // LinqBeispiele.SelectBeispiel1()
        // LinqBeispiele.WhereBeispiel()
        // LinqBeispiele.SkipArray()
        // DataTableBeispiele.TableSelectBeispiel2()
        // DataTableBeispiele.TableSelectBeispiel1()
        // DictionaryBeispiele.DictionaryBeispiel2()
        // ForEachBeispiele.Beispiel5()
        // ArrayBeispiele2.ArrayBeispiel2()
        // LINQGroupBeispiele.DataTableGroup()
        // OleAuto.StartWord()
        // OleAuto.StartAcrobatVB2()
        // OleAuto.StartAcrobat()
        // Console.WriteLine("*** Weiter mit Taste ***")
        // Console.ReadLine()
        // OleAuto.SaveAcrobatDocument()
        // OleAuto.ScanAcrobatDocument2()
        // OleAuto.GetAcrobatVersion2()
        // StringBeispiele.ContainsBeispiel1()
        // VarLocalVergleich.NullAbfrage()
        // foreach var netv in NetVersion.GetNetVersion()
        //     ? netv
        // next
        // ConstructorChainingTest.Test()
        // NullBeispiele.DatumsAbfrage()
        // ArrayBeispiele.ArrayScan0()
	    // ArrayBeispiele2.ArrayBeispiel1()
        // var Monate := MonatePerEnumRange.Monate()
        // foreach var m in Monate
        //     ?M
        // next
        // AllgemeineSyntax.TernaryOp();
        // XLinqBeispiele.XDocBeispiel4();
	    // ArrayBeispiele2.ArrayBeispiel1()
        // TupelBeispiel.M1()
        // ArrayBeispiele.ArrayLetztesElementEntfernen()
        // ArrayBeispiele.ArrayDel()
	    // AllgemeineSyntax.IfVarBeispiel()
        // WordAuto.StartWord()
        // WordAuto.StartMakro2()
        // StringBeispiele.StringVergleich1()
        // WordAuto.StartMarko("EurekaMakro.eurekaGSW.Main")
	    // StringBeispiele.StringSplit()
        // LinqBeispiele.FirstElement()
        // StringBeispiele.Instr1()
        // LinqBeispiele.DataColumnSort()
        // LinqBeispiele.ArraySort()
        // ArrayBeispiele.DataTablePerIndexDurchlaufen()
        // DatumsBeispiele.Beispiel1()
        // ForEachBeispiele.Beispiel1()
        // LinqBeispiele.RangeBeispiel()
        // StringBeispiele.Substring1()
        // ArrayBeispiele.ArrayScan3()
        // LinqBeispiele.SumValues()
        // ArrayBeispiele.DataTableAnlegen()

        /*
        Local az := "2 U 100/14" As String
        Local StartPos1, EndePos1 As DWord
        Local StartPos2, EndePos2 As Int
	    StartPos1 := At2(" ", Az)
        StartPos2 := Az:IndexOf(" ")
	    EndePos1 := At3(" ", Az, StartPos1)
        EndePos2 := Az:IndexOf(" ", StartPos2)
        az := "ABCDEFGHIJKLMNOPQRSTWXYZ"
        ? i"StartPos={StartPos1} EndePos={EndePos1} StartPos={StartPos2} EndePos={EndePos2}"
        ? Substr(Az,0,4)
        ? Substr(Az,1,4)
        ? Az:Substring(0,4)
        Local AzNeu := Az:Substring(0,4) As String
        ? i"Substr(Az,0,4) = { Substr(Az,0,4)} Substr(Az,1,4) = { Substr(Az,1,4)} Az:Substring(0,4)= { AzNeu}"
        /*
        Local Felder As Array
        Felder := {#Sach1, #Sach2, #Sach3, #Sach4, #Sach5}
        for Local i := 1 UpTo len(Felder)
            ?Felder[i]
        next
        ?Felder[1]

        Local zahlen1 := {11,22,33,44,55} As Array
        var zahlen2 := List<int>{}{11,22,33,44,55} // As List<int>

        ? i"Länge : {len(zahlen1)}"
        ? i"Länge : {zahlen1:Length}"
        // Index bei Arrays beginnt bei 1 - Index = 0 => IndexOutOfRangeException
        for Local i := 1 UpTo len(zahlen1)
            ? zahlen1[i]
        next

        // Abfrage der geraden Zahlen per Where
        Console.ForegroundColor := ConsoleColor.Green
        Console.WriteLine()
        // So geht es nicht ??? - führt zu einem nicht näher spezifizierten Fehler
        // var geradeZahlen = zahlen2:Where({|x| x % 2 == 0})
        var geradeZahlen = from z in zahlen2 where z % 2 = 0 select z
        foreach var z in geradeZahlen
            console.WriteLine(z)
        next

        Console.WriteLine()
        Console.ForegroundColor := ConsoleColor.Yellow

        // Index bei Listen beginnt bei 0
        for Local i := 0 UpTo zahlen2:Count - 1
            ? zahlen2[i]
        next

        Local Wetter := "Sonne und Regen" As String

        // ? Substr(Wetter, 0, 3)
        // ? Wetter:Substring(0, 3)

        // ? Substr(Wetter, 4)
        // ? Wetter:Substring(3)

        // ? Upper(Wetter)
        // ? Wetter:ToUpper()

        Local Az := "2 U 100/14" As String
        // ? Az:Contains("100/14")
        // ? Instr("100/14", Az)

        // = vergleicht nur die ersten Zeichen!!!
        // ?
        ? Az = "2 U"
        ? Az == "2 U"

        Local AnhVerfahren := True As Logic
        Local Abgetrennt := True As Boolean

        // ? AnhVerfahren && Az:Contains("100/14")
        // & und | führe eine Bit-Verknüpfung durch, .or. und .and. sind logisch
        // ? AnhVerfahren .or. Az:Contains("100/14")
        // ? AnhVerfahren .And. Az:Contains("100/14")

        // Short Circuiting bei And und or
        Local val As Usual
        // ? val == Null
        // ? val <> Null
        // ? val != Null

        // Zweite Bedingung wird nicht mehr ausgewertet
        // ? val != Null .and. val > 0
        // dito
        // ? val == Null .or. val > 0
        // "Knallt", da hier die zweite Bedingung ausgewertet wird
        // ? val != Null .or. val > 0

        local zahl := 1 As Int
        // Bei Zahlen spielt es keine Rolle, ob = oder ==
        ? zahl = 1
        ? zahl == 1

        Local Pos1 As DWord
        // Löst einen StackOverflow aus???
        // Pos1 := AScan(zahlen1, {|aVal|aVal[1] % 2 == 1})
        // Pos1 := AScan(zahlen1, {|aVal|aVal % 2 == 1})
        // Index des ersten Array-Elements, das größer als 30 ist
        Pos1 := AScan(zahlen1, {|aVal| aVal > 30})
        ?Pos1

        Local a1 := {"Gez", "Gkk", "Aok", "Deak"} As Array
        Local a2 := {"Ibm", "Hal", "Aeg"} As Array
        Local Sachgebiete := {a1, a2} As Array
        // Liefert 1 - da Aok im ersten Array enthalten ist?
        // Aber warum aVal[3]?? Mit aVal[1] und aVal[2] ist das Ergebnis eine 0
        // {|x| x == 1} ist ein Lambda
        // aVal[] setzt voraus, dass das Array aus Arrays besteht, ansonsten ist ein StackOverflow die Folge
        Pos1 := AScan(Sachgebiete, {|aVal| aVal[3] == "Aok"})
        ?Pos1
        */
        Console.WriteLine()
        Console.WriteLine("Fertig...")
        Console.ReadKey()

End Namespace
