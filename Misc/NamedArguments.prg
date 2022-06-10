// File: NamedArguments.prg
// Only available in the core dialect

Using System
#define lCore

Begin Namespace XKompendium

    #ifndef lCore
	Static Class NamedArguments

        Static Method CallMe(P1 As Int, P2 As Int) As Int
            Return P1 + P2
        End Method

        Static Method NamedArgs1() As Void
            Local sum := CallMe(P1:=100,P2:=200) As Int
            ? sum
            Return
    
    End Class
    #endif
    
End Namespace
