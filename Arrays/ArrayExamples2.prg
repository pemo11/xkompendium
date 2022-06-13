// File: ArrayExamples2.prg

Using System
Using System.Collections.Generic
Using System.Text
Using System.Linq

Begin Namespace XKompendium

    /// <summary>
    /// More Array examples
    /// </summary>
 	Static Class ArrayExamples2

        /// <summary>
        /// Array direkt anlegen im .Net-Stil
        /// </summary>
        Static Method ArrayBeispiel1() As Void
                Local feld1 As Byte[]
                feld1 := Byte[]{10}
                feld1[1] := 11
                feld1[2] := 22
                feld1[3] := 33
                feld1[4] := 44
                for local i := 1 UpTo feld1:Length
                    ? feld1[i]
                next
            Return

        Static Method ArrayBeispiel2() As Void
            Local Places := <String>{"Esslingen", "Plochingen", "Nürtingen","Geislingen"} As String[]
            Foreach Place As String In Places
                ? Place
            next

        Static Method ArrayContains1() As Void
            Local Places := <String>{"Esslingen", "Plochingen", "Nürtingen","Geislingen"} As String[]
            Var result1 := Places:Any({ort => ort == "Esslingen"})
            ? result1
            Var result2 := Places:Any({ort => ort == "Tübingen"})
            ? result2

        // Index eines Objekts in einem Array
        Static Method FindObject1() As Void
            Local Place1 := Place{"Esslingen", 80000} As Place
            Local Place2 := Place{"Plochingen", 35000} As Place
            Local Place3 := Place{"Geislingen", 28000} As Place
            Local Places := List<Place>{}{Place1,Place2,Place3} As List<Place>
            // Richtig - liefert 0
            ? Places:IndexOf(Place1)
            // Falsch - liefert -1
            Local SearchPlace := Place{"Esslingen", 80000} As Place
            ? Places:IndexOf(SearchPlace)
            // Richtig - liefert 0
            ? Places:FindIndex({o => o:Name == SearchPlace:Name})

        // Angeben, ob ein Array leer ist
        Static Method CheckEmptyArray() As Void
            Local aZahlen := {0,0,0,0,0,0,0,0,0,0} As Array
            Local Pos := (Int) AScan(aZahlen, {|z|z > 0}) As Int
            ? Pos
            aZahlen[1] := 1
            Pos := (Int) AScan(aZahlen, {|z|z > 0})
            ? Pos
            Return


    End Class

End Namespace // XSharpAllgemein