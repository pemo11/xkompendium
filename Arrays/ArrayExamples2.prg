// ============================================================================
// File: ArrayExamples2.prg
// ============================================================================

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
        /// Create an array the .Net way
        /// </summary>
        Static Method ArrayBeispiel1() As Void
                Local feld1 As Byte[]
                feld1 := Byte[]{10}
                feld1[1] := 11
                feld1[2] := 22
                feld1[3] := 33
                feld1[4] := 44
                For Local i := 1 Upto feld1:Length
                    ? feld1[i]
                Next
            Return

        /// <summary>
        /// Create an array the .Net way with initialization
        /// </summary>
        Static Method ArrayBeispiel2() As Void
            Local Cities := <String>{"Esslingen", "Plochingen", "Nürtingen","Geislingen"} As String[]
            Foreach City As String In Cities
                ? City
            Next

        /// <summary>
        /// Use an "LINQ" extension method to search for an array element
        /// </summary>
        Static Method ArrayContains1() As Void
            Local Cities := <String>{"Esslingen", "Plochingen", "Nürtingen","Geislingen"} As String[]
            Var result1 := Cities:Any({ort => ort == "Esslingen"})
            ? result1
            Var result2 := Cities:Any({ort => ort == "Tübingen"})
            ? result2

        /// <summary>
        /// Use FindIndex instead of IndexOf to search for an object in an array
        /// </summary>
        Static Method FindObject1() As Void
            Local City1 := CityInfo{"Esslingen", 80000} As CityInfo
            Local City2 := CityInfo{"Plochingen", 35000} As CityInfo
            Local City3 := CityInfo{"Geislingen", 28000} As CityInfo
            Local Cities := List<CityInfo>{}{City1,City2,City3} As List<CityInfo>
            // Correct - Result = 0
            ? Cities:IndexOf(City1)
            // Wrong - Result = -1
            Local SearchPlace := CityInfo{"Esslingen", 80000} As CityInfo
            ? Cities:IndexOf(SearchPlace)
            // Correct - Result = 0
            ? Cities:FindIndex({o => o:Name == SearchPlace:Name})

        /// <summary>
        /// Two techniques to determine if an array is empty
        /// </summary>
        Static Method CheckEmptyArray() As Void
            Local aZahlen := {0,0,0,0,0,0,0,0,0,0} As Array
            Local Pos := (Int) AScan(aZahlen, {|z|z > 0}) As Int
            ? Pos
            aZahlen[1] := 1
            Pos := (Int) AScan(aZahlen, {|z|z > 0})
            ? Pos
            Return


    End Class

End Namespace