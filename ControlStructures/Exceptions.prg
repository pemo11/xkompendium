// File: Exceptions.prg
Using System
Using System.Data.SqlClient

Begin Namespace XSharpAllgemein

	Static Class ExceptionBeispiele

        Static Method ExceptionBeispiel1() As Void
            Try 
                // Exception auslösen
                Throw Exception{"Feieralarm!"}
            // Wichtig: SystemException fängt keine Exceptions
            Catch ex As SystemException
                Console.WriteLine(i"SystemException: {ex}")
            Catch ex As Exception
                Console.WriteLine(i"Exception: {ex}")
            End Try
            Return
        
        Static Method MockSqlExection() As SQLException
            Local sqlEx As SqlException
            Try
                Var cn := SqlConnection{"Data Source=.;Database=GUARANTEED_TO_FAIL;Connection Timeout=1"} 
                cn:Open()
            Catch Ex As SqlException
                sqlEx := ex
            End Try
            Return sqlEx

        Static Method ExceptionBeispiel2() As Void
            Try 
                // SqlException weiterreichen
                Throw MockSqlExection()
            // Wichtig: SystemException fängt eine SqlException
            Catch ex As SystemException
                // SqlException besitzt eine Errors-Property mit allen Errors
                Console.WriteLine(i"SystemException: {ex} Typ: {ex:GetType().Name}")
            Catch ex As Exception
                Console.WriteLine(i"Exception: {ex}")
            End Try
            Return

    End Class

End Namespace
