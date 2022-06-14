// ============================================================================
// ArrayExamples1.prg
// ============================================================================

Using System
Using System.Data
Using System.IO
Using System.Linq

Begin Namespace XKompendium

    /// <summary>
    /// Examples for handling Arrays (part 1)
    /// </summary>
	Static Class ArrayExamples1

        Private Delegate SearchDel(i As Int) As Boolean

        #ifndef lCore
        /// <summary>
        /// Example for the AScan function
        /// Does not work in Core Dialect
        /// </summary>
        Static Method ArrayScan1() As Void
            Local feld := {} As Array
            AAdd(feld, 11)
            AAdd(feld, 22)
            AAdd(feld, 33)
            AAdd(feld, 44)
            // Does the value 33 exists in the Array?
            ?AScan(feld, {|x|x = 33})
            // Does the value 55 exists in the Array?
            ?AScan(feld, {|x|x = 55})
            Return
        #endif

        #ifndef lCore
        /// <summary>
        /// Example for the AScan function
        /// Does not work in Core Dialect
        /// </summary>
        Static Method ArrayScan2() As Void
            Local feld := Array{} As Array
            Aadd(feld, {1,2,3,4,5,6,7,8,9})
            Aadd(feld, {11,22,33,44,55,66,77,88,99})
            Aadd(feld, {111,222,333,444,555,666,777,888,999})
            ? feld[1,1]
            ? feld[2,4]
            // Findet 444 an vierter Position im 3. Feld - Rückgabe folglich 3
            ?AScan(feld, {|x|x[4] = 444})
            Return
        #endif

        #ifndef lCore
        /// <summary>
        /// Example for the AScan function
        /// Does not work in Core Dialect
        /// </summary>
        Static Method ArrayScan3() As Void
            Local feld := Array{} As Array
            // Local searchFunc As System.Func<Int, Logic>
            Local searchFunc := { x => x > 100 } As SearchDel
            Aadd(feld, {1,2,3,4,5,6,7,8,9})
            Aadd(feld, {11,22,33,44,55,66,77,88,99})
            Aadd(feld, {111,222,333,444,555,666,777,888,999})
            Local feld1 := {111,222,333,444,555,666,777,888,999} As Array
            // Durchsucht ein eindimensionales Array - gibt 4 zurück - aber immer nur das erste Element
            ?AScan(feld1, {|x|x > 400})
            // Alle Zahlen finden
            Local z As Dword
            Repeat
                z := AScan(feld1, {|x|x > 400}, z + 1)
                If z > 0
                    ? feld1[z]
                End If
            Until z == 0

            Return
        #endif

        #ifndef lCore
        /// <summary>
        /// Example for the AScan function
        /// Does not work in Core Dialect
        /// </summary>
        Static Method ArrayScan4() As Void
            Local Werte := {} As Array
            AAdd(Werte, {"A", 1000})
            AAdd(Werte, {"A", 2000})
            AAdd(Werte, {"B", 100})
            AAdd(Werte, {"B", 200})
            // AWerte := AScan(Werte, {|f|f[1]=="A"})
            Var AWerte := (From w In Werte Where w[1] == "A" Select w[2]):ToList()
            For Local i := 0 Upto AWerte:Count - 1
                ?AWerte[i]
            Next

            Return
        #endif

        #ifndef lCore
        /// <summary>
        /// Example for the ADel function
        /// Does not work in Core Dialect
        /// </summary>
        Static Method ArrayDel1() As Void
            Local Werte := {} As Array
            AAdd(Werte, {"A", 1000})
            AAdd(Werte, {"B", 2000})
            AAdd(Werte, {"C", 3000})
            AAdd(Werte, {"D", 4000})
            Local wPos := AScan(Werte, {|a|a[1] = "C"}) As Dword
            // Wert wird entfernt, die oberen Werte rutschen eine Position nach unten
            ADel(Werte,wPos)
            For Var i := 1 Upto ALen(Werte)
                ? Werte[i,1]
            Next
            Return
        #endif

        #ifndef lCore
        /// <summary>
        /// Example for the ADel function deleting the last element
        /// Does not work in Core Dialect
        /// </summary>
        Static Method ArrayDel2() As Void
            Local aWerte := {} As Array
            AAdd(aWerte, {"A", 1000})
            AAdd(aWerte, {"B", 2000})
            AAdd(aWerte, {"C", 3000})
            AAdd(aWerte, {"D", 4000})
            // So geht es nicht, da die Array-Größe kleiner wird
            /* for var i := 1 UpTo ALen(aWerte)
                Local w = aWerte[ALen(aWerte),1] As String
                ADel(aWerte, ALen(aWerte))
                ASize(aWerte, ALen(aWerte)-1)
                ? w + " wurde gelöscht"
            next
            */
            While ALen(aWerte) > 0
                Local w := aWerte[ALen(aWerte),1] As String
                ADel(aWerte, ALen(aWerte))
                ASize(aWerte, ALen(aWerte)-1)
                ? w + " was deletet"
            End While
            Return
        #endif

        /// <summary>
        /// Initialize an Array with Objects
        /// </summary>
        Static Method ObjectArray() As Void
            Local dok1 := Document{1, "Alles klar mit X#!"}  As Document
            Local dok2 := Document{2, "Alles klar mit C#!"}  As Document
            Local Documents := <Document>{dok1, dok2} As Document[]
            Foreach dok As Document In Documents
                ? dok:Title
            Next
            Return

        /// <summary>
        /// Initialize an fixed size .NET-Array with Objects
        /// </summary>
        Static Method NetArray() As Void
            // Create a fixed size array with 2 documents
            Local Documents := Document[]{2} As Document[]
            ? i"Number of Documents: {Documents:Length}"
            // Beware, index starts with 1
            Documents[1] := Document{0, "Have fun with C#!"}
            Documents[2] := Document{1, "Have more fun with X#!"}
            Foreach dok As Document In Documents
                ? dok:Title
            Next
            // Do it, do it one more time...
            For Var i := 1 Upto 2
                ? Documents[i]:Title
            Next
            Return

    End Class

End Namespace
