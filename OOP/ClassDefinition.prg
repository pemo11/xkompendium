// File: ClassDefinition.prg

Using System

BEGIN NAMESPACE XSharpAllgemein

	/// <summary>
    /// The ClassDefinition class.
    /// </summary>
	Class Dokument
        Private strTitel As String
        
        Property Titel As String
            Get
                Return Self.strTitel
            End Get
            Set 
                Self.strTitel := Value
            End Set
        End Property
 
    CONSTRUCTOR()
         RETURN

    End Class
    
   
END NAMESPACE // XSharpAllgemein