// file: Number.prg

Begin Namespace XKompendium
    
    /// <summary>
    /// Definition of the Number class
    /// </summary>
    Class Number
        Private _Value As Int

        Constructor(Value As Int)
            Self:_Value := Value
            Return

        Property Value As Int
            Get
                Return _Value
            End Get
        End Property

    End Class
    
End Namespace