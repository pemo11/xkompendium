// File: ConstructorChaining.prg


USING System
USING System.Collections.Generic
USING System.Text

BEGIN NAMESPACE XSharpAllgemein

	/// <summary>
    /// The ConstructorChaining class.
    /// </summary>
	CLASS ConstructorChaining
        Private y As Int
        
        CONSTRUCTOR()
            ? "Constructor A"
            y := 1000
             RETURN

        CONSTRUCTOR(x As Int)
            Self()
            ? i"Constructor B mit x={x} und y={Self:y}"
             RETURN

    End Class
    
    Public Static Class ConstructorChainingTest
    
        Public Static Method Test() As Void
            var c1 := ConstructorChaining{1234} 
            Return
            
    End Class
    
End Namespace // XSharpAllgemein