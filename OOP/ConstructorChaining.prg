// File: ConstructorChaining.prg

Using System
Using System.Collections.Generic
Using System.Text

Begin Namespace XKompendium

    /// <summary>
    /// The ConstructorChaining class.
    /// </summary>
    Class ConstructorChaining
        Private y As Int
        
        Constructor()
            ? "Constructor A"
            y := 1000
            Return

        Constructor(x As Int)
            Self()
            ? i"Constructor B mit x={x} und y={Self:y}"
            Return

    End Class
    
    Public Static Class ConstructorChainingTest
    
        Public Static Method Test() As Void
            Var c1 := ConstructorChaining{1234} 
            Return
            
    End Class
    
End Namespace