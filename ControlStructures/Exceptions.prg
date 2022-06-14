// ============================================================================
// File: Exceptions.prg
// ============================================================================

Using System
Using System.Data.SqlClient

Begin Namespace XKompendium

	Static Class ExceptionExamples

        /// <summary>
        /// Example for throw
        /// </summary>
        Static Method ExceptionExample1() As Void
            Try
                // create an exception
                Throw Exception{"Feieralarm!"}
            // important: SystemException does not catch this exception
            Catch ex As SystemException
                Console.WriteLine(i"SystemException: {ex}")
            Catch ex As Exception
                Console.WriteLine(i"Exception: {ex}")
            End Try
            Return

        /// <summary>
        /// Example for catching an SqlException without a database
        /// </summary>
        Static Method MockSqlExection() As SQLException
            Local sqlEx As SqlException
            Try
                Var cn := SqlConnection{"Data Source=.;Database=GUARANTEED_TO_FAIL;Connection Timeout=1"}
                cn:Open()
            Catch Ex As SqlException
                sqlEx := ex
            End Try
            Return sqlEx

        /// <summary>
        /// Example for throw
        /// </summary>
        Static Method ExceptionExample2() As Void
            Try
                // throw a SqlException to the next calling level
                Throw MockSqlExection()
                // important: SystemException does not catch this exception
            Catch ex As SystemException
                // SqlException has an Errors-Property with all the errors
                Console.WriteLine(i"SystemException: {ex} Typ: {ex:GetType().Name}")
            Catch ex As Exception
                Console.WriteLine(i"Exception: {ex}")
            End Try
            Return

    End Class

End Namespace
