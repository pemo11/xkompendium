// File: ClassDefinition.prg

Using System

Begin Namespace XKompendium

	/// <summary>
    /// Definition of the Document class
    /// </summary>
	Class Document
        Private _Id As Int
        Private _Titel As String

        Property Titel As String
            Get
                Return Self._Titel
            End Get
            Set
                Self._Titel := Value
            End Set
        End Property

        Property Id As Int
            Get
                Return Self._Id
            End Get
            Set
                Self._Id := Value
            End Set
        End Property

        Constructor(Id As Int, Titel As String) As Void
            Self._Id := Id
            Self._Titel := Titel
            Return

    End Class


END Namespace