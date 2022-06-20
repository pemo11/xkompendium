// ============================================================================
// File: NullExamples.prg
// ============================================================================

Using System
Using System.Collections.Generic

Begin Namespace XKompendium

	Public Static Class NullExamples
 
        /// <summary>
        /// Query of DateTime-Variable with Null value
        /// </summary>
        Static Method DateTimeNullQuery() As Void
            Local d As DateTime?
            d := Null
            ? "The value: " + d:HasValue:ToString()
            Return 
         
        /// <summary>
        /// Null compare the old fashioned way
        /// </summary>
        Static Method NullCompare1() As Void
            Local d1 As Document
            d1 := Document{1, "The X# papers"}
            
            ? d1:Title
            
            Local d2 As Document
            // check for a null value
            If d2 != Null
                ? d2:Title
            Endif
            
            If d1 != Null .and. d1:Author != Null
                ? d1:Author
            EndIf
            

        /// <summary>
        /// Null compare with a nice short cut
        /// </summary>
        Static Method NullCompare2() As Void
            Local d1 As Document
            d1 := Document{1, "The X# papers"}
            
            ? d1?:Title
            
            Local d2 As Document
            ? d2?:Title

        /// <summary>
        /// Null compare with an object and a property that is an object itself
        /// </summary>
        Static Method NullCompare3() As Void
            Local d1 As Document
            Local a1 := Author{"Pemo"} As Author
            d1 := Document{1, "The X# papers"}
            d1:Author := a1
            
            ? d1?:Author?:Name
            
            Local d2 As Document
            ? d2?:Author?:Name

        /// <summary>
        /// Null query with value types
        /// </summary>
        Static Method NullCompare4() As Void
            Local n1 := 100 As Int?
            Local n2 As Int?
            
            If n1:HasValue
                ? "n1 was initialized"
            End If

            If n2:HasValue
                ? "n2 was initialized"
            End If

    End Class
    
End Namespace
