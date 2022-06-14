// ============================================================================
// File: Author.prg
// ============================================================================

Begin Namespace XKompendium

	/// <summary>
    /// The class definition for the Author class
    /// </summary>
	Class Author
        Private _Name As String
        Private _BirthYear As Int

        Constructor(Name As String)
            _Name := Name
            Return

        Public Property BirthYear As Int Get _BirthYear Set _BirthYear := Value

        Public Property Name As String
            Get
                Return _Name
            End Get
            Set
                _Name := Value
            End Set
        End Property

    End Class
    
End Namespace