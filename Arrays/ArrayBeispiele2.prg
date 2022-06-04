// File: ArrayBeispiele2.prg

USING System
Using System.Collections.Generic
Using System.Text
Using System.Linq

BEGIN NAMESPACE XSharpAllgemein

    /// <summary>
    /// Weitere Array-Beispiele
    /// </summary>
 	Static Class ArrayBeispiele2

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
            Local Orte := <String>{"Esslingen", "Plochingen", "Nürtingen","Geislingen"} As String[]
            foreach Ort As String in Orte
                ? Ort
            next

     Static Method ArrayContains1() As Void
            Local Orte := <String>{"Esslingen", "Plochingen", "Nürtingen","Geislingen"} As String[]
            Var result1 := Orte:Any({ort => ort == "Esslingen"})
            ? result1
            Var result2 := Orte:Any({ort => ort == "Tübingen"})
            ? result2

    // Index eines Objekts in einem Array
    Static Method FindObject1() As Void
        Local Ort1 := Ort{"Esslingen", 80000} As Ort
        Local Ort2 := Ort{"Plochingen", 35000} As Ort
        Local Ort3 := Ort{"Geislingen", 28000} As Ort
        Local Orte := List<Ort>{}{Ort1,Ort2,Ort3} As List<Ort>
        // Richtig - liefert 0
        ? Orte:IndexOf(Ort1)
        // Falsch - liefert -1
        Local SuchOrt := Ort{"Esslingen", 80000} As Ort
        ? Orte:IndexOf(SuchOrt)
        // Richtig - liefert 0
        ? Orte:FindIndex({o => o:Name == SuchOrt:Name})

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

END NAMESPACE // XSharpAllgemein