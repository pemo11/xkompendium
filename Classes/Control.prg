// ============================================================================
// File: Control.prg
// ============================================================================

Begin Namespace XKompendium
    
        /// <summary>
        /// Definition of the Control class
        /// </summary>
       Class Control
            Export Name As String
            
            Constructor(Name As String)
                Self:Name := Name
           
        End Class
        
End Namespace