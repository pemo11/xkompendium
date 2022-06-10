// File: OracleTest.prg

Using System
Using Oracle.ManagedDataAccess.Client

Begin Namespace XKompendium

    Public Static Class OracleTest
        Private Static ConStr := "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oravm2)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=Eureka)));User Id=vghgw_admin;Password=vghgw_admin" As String

        Public Static Method DecimalTest1() As Void
            Local sqlText := "Select * From Jukos_Verfahren" As String
            Try
                Begin Using Var cn := OracleConnection{ConStr}
                    cn:Open()
                    Local cmd := cn:CreateCommand() As OracleCommand
                    cmd:CommandText := sqlText
                    Local dr := cmd:ExecuteReader() As OracleDataReader
                    Local JK_ID As Decimal
                    If dr:Read()
                        JK_ID := dr:GetDecimal(dr:GetOrdinal("JV_VER_ID"))
                        ? i"Ist-Decimal: {JK_ID Is Decimal}"
                        ? i"Int32-Wert: {Convert.ToInt32(JK_ID)}"
                        ? i"Decimal-Wert: {JK_ID}"
                    Endif

                End Using
            Catch Ex As SystemException
                ? i"!!! OracleTest->DecimalTest1: {ex:Message} !!!"
            End Try

            Return
        End Method

        Public Static Method DecimalTest2() As Void
            Local sqlText := "Select Max(JV_VER_ID) As MaxId From Jukos_Verfahren" As String
            Try
                Begin Using Var cn := OracleConnection{ConStr}
                    cn:Open()
                    Local cmd := cn:CreateCommand() As OracleCommand
                    cmd:CommandText := sqlText
                    Var RetVal := cmd:ExecuteScalar()
                    ? i"Ist-Decimal: {RetVal Is Decimal}"
                    ? i"Int32-Wert: {Convert.ToInt32(RetVal)}"
                    ? i"Typename: {RetVal:GetType().Name}"
                    // Diese Abfrage liefert false statt true
                    ? i"Typeof: {RetVal == typeof(Decimal)}"

                End Using
            Catch Ex As SystemException
                ? i"!!! OracleTest->DecimalTest2: {ex:Message} !!!"
            End Try

            Return
        End Method

        Public Static Method DecimalTest3() As Void
            Local sqlText := "Select Max(JV_VER_ID) As MaxId From Jukos_Verfahren" As String
            Local verId As Int
            Try
                Begin Using Var cn := OracleConnection{ConStr}
                    cn:Open()
                    Local cmd := cn:CreateCommand() As OracleCommand
                    cmd:CommandText := sqlText
                    Var RetVal := cmd:ExecuteScalar()
                    If RetVal Is DbNull
                        VerId := 0
                    Else
                        If RetVal Is Decimal
                            VerId := Convert.ToInt32(RetVal)
                        Else
                            VerId := (Int)RetVal
                        Endif
                    Endif
                    ? VerId

                End Using
            Catch Ex As SystemException
                ? i"!!! OracleTest->DecimalTest3: {ex:Message} !!!"
            End Try

            Return
        End Method
    End Class

End Namespace

