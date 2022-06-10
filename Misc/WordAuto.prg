// File: WordAuto.prg

Using System
Using System.Diagnostics
Using Microsoft.Office
Using Word := Microsoft.Office.Interop.Word

Using System.Threading

Begin Namespace XSharpAllgemein

	/// <summary>
    /// The WordAuto class.
    /// </summary>
	Class WordAuto
    
        Constructor()
            
        Return
        
        Static Method StartWord() As Void
            Local WordApp := Word.ApplicationClass{} As Word.Application
            WordApp:Visible := True
            Return

        // Funktioniert leider nicht - schwere COM-Exception
        Static Method StartMarko(MakroName As String) As Void
            // Thread.CurrentThread:ApartmentState := System.Threading.ApartmentState.STA

            Local WordApp := Word.Application{} As Word.Application
            Local dotmPfad := "C:\Users\Pemo\AppData\Roaming\Microsoft\Word\STARTUP\EurekaMakroX.dotm" As String
            Local docxPfad := "C:\Users\Pemo\AppData\Roaming\Test.docx" As String
            Local MakroDoc := Null As Word.Document
            // Local WordDoc := Null As Word.Document
            
            // Die try/catch-Version in VO
            // Kann in Core nicht kompiliert werden
            #ifndef lCore
            Begin Sequence
                // Gibt immer einen Fatal Execution Error
                // MakroDoc := WordApp:Documents:Open(docxPfad)
                // Der Befehl geht
                // MakroDoc := WordApp:Documents:Add()
                // Process:Start(dotmPfad)
                MakroName := "eurekaGSW.Main"
                MakroDoc := WordApp:Documents:Open(dotmPfad)
                // WordDoc := WordApp:Documents:Open(docxPfad)
                WordApp:Run(MakroName)
                //MakroDoc:Close()
            RECOVER
                ? "Fehler beim Starten des Makros"
            End
            #endif
            // WordApp:Run(MakroName,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o)
            // "'My Document.doc'!ThisModule.ThisProcedure"
            // MakroName := "EurekaMakro.eurekaGSW.Main"
            // MakroName := "'EurekaMakroX.dotm'!eurekaGSW.Main"
            // Es geht nur, wenn die dotm-Datei bereits geladen wurde, z.B. im Debug-Fenster
            Return
            
        #ifndef lCore
        Static Method StartMakro2() As Void
            Local dotmPfad := "" As String
            Local docxPfad := "" As String
            Local MakroName := "" As String
            Local WordApp := Null As Word.ApplicationClass
            Local MakroDoc := Null As Word.Document
            // Kann in Core nicht kompiliert werden wegen Date
            Begin Sequence
                MakroName := "eurekaGSW.Main"
                dotmPfad := "C:\Users\Pemo\AppData\Roaming\Microsoft\Word\STARTUP\EurekaMakroX.dotm"
                docxPfad := "Test.docx"
                WordApp := Word.ApplicationClass{}
                // WordApp:Visible = true
                // MakroDoc := WordApp:Documents:Open(dotmPfad)
                // WordApp:Documents:Open(docxPfad)
                WordApp:Run(MakroName)
            RECOVER
                ? "Fehler beim Starten des Makros"
            End
        #endif

        Static Method StartMakro3() As Void
            // WordHelper.RunMacro("eurekaGSW")

    End Class
    
End Namespace
