// ============================================================================
// File: CityInfo.prg
// ============================================================================

Begin Namespace XKompendium
    
    /// <summary>
    /// Definition of the CityInfo class
    /// </summary>
    Class CityInfo
        Private _Name As String
        Private _Inhabitants As Int
        
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
        
        Method ToString() As String
            Return "Name=" + Self:_Name + " Inhabitants: " + Self:_Inhabitants:ToString("f2")

    End Class
    
End Namespace