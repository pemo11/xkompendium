// File: Place.prg

Using System
Using System.Collections.Generic
Using System.Text

Begin Namespace XKompendium

	/// <summary>
    /// Definition of the Place class
    /// </summary>
	Class Place
        Private _Inhabitants As Int
        Private _Name As String
        
        Constructor(Name As String, Inhabitants As Int)
            Self:_Name := Name
            Self:_Inhabitants := Inhabitants
        End Constructor
        
        Property Name As String
            Get
                Return Self:_Name
            End Get
            Set
                Self:_Name := Value
            End Set
        End Property

        Property Inhabitants As Int
            Get
                Return Self:_Inhabitants
            End Get
            Set
                Self:_Inhabitants := Value
            End Set
        End Property

    End Class

End Namespace
