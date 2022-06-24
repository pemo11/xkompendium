Begin Namespace XKompendium.WinForms

    Public Partial Class BeginInvoke1
    Private tableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel

        /// <summary>
        /// Required designer variable.
        /// </summary>
        Private components := Null As System.ComponentModel.IContainer

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        Protected Method Dispose(disposing As Logic) As Void Strict

            If (disposing .and. (components != null))
                components:Dispose()
            Endif
            Super:Dispose(disposing)
			Return

        #region Windows Form Designer generated Code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        Private Method InitializeComponent() As Void Strict
            Self:tableLayoutPanel1 := System.Windows.Forms.TableLayoutPanel{}
            Self:SuspendLayout()
            // 
            // tableLayoutPanel1
            // 
            Self:tableLayoutPanel1:ColumnCount := 2
            Self:tableLayoutPanel1:ColumnStyles:Add(System.Windows.Forms.ColumnStyle{System.Windows.Forms.SizeType.Percent, 50})
            Self:tableLayoutPanel1:ColumnStyles:Add(System.Windows.Forms.ColumnStyle{System.Windows.Forms.SizeType.Percent, 50})
            Self:tableLayoutPanel1:Dock := System.Windows.Forms.DockStyle.Fill
            Self:tableLayoutPanel1:Location := System.Drawing.Point{0, 0}
            Self:tableLayoutPanel1:Name := "tableLayoutPanel1"
            Self:tableLayoutPanel1:RowCount := 2
            Self:tableLayoutPanel1:RowStyles:Add(System.Windows.Forms.RowStyle{System.Windows.Forms.SizeType.Percent, 16.73699})
            Self:tableLayoutPanel1:RowStyles:Add(System.Windows.Forms.RowStyle{System.Windows.Forms.SizeType.Percent, 83.26301})
            Self:tableLayoutPanel1:Size := System.Drawing.Size{737, 711}
            Self:tableLayoutPanel1:TabIndex := 0
            // 
            // BeginInvoke1
            // 
            Self:ClientSize := System.Drawing.Size{737, 711}
            Self:Controls:Add(Self:tableLayoutPanel1)
            Self:Font := System.Drawing.Font{"Arial Narrow", 11, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((Byte)(0))}
            Self:Name := "BeginInvoke1"
            Self:Text := "Begin-Invoke-Beispiel"
            Self:ResumeLayout(false)

        #endregion
    End Class 
End Namespace
