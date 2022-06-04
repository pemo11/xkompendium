// File: TupelBeispiel.prg

Using System
Using System.Collections.Generic

Begin Namespace XSharpAllgemein

	Static Class TupelBeispiel

        // Geht nicht???
        /*
        Static Method Tup1() As Tuple<int,int>
            // Instanzierung ist nicht möglich
            Local t := Tuple{1,2} As Tuple<int,int>
            
            Return t
        */

        // Tuples werden aktuell noch nicht unterstützt, soll aber in naher Zukunft kommen
        Static Method Tup2() As Tuple<int,int>
            Local l := List<Tuple<int, int>>{} As List<Tuple<int, int>>
            // ??? Wie wird ein Tuple Literal geschrieben???
            // var t := {0:11},{1:22}
            // 06/05 - so geht es nicht...
            // var t := (Tuple<int, int>)"{0:11,1:22}"
            // var t := (11,22)
            // Local t := (11,22) As Tuple<int, int>
            // l:Add(t)
            Return l[0]
            
        Static Method M1() As Void
            Local t := Tup2() As Tuple<int,int>
            ? t
            Return
            
    End Class

End Namespace
 
