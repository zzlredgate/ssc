SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [tests].[test prcAddContact]
AS
    BEGIN
        --Assemble
        --  This section is for code that sets up the environment. It often
        --  contains calls to methods such as tSQLt.FakeTable and tSQLt.SpyProcedure
        --  along with INSERTs of relevant data.
        --  For more information, see http://tsqlt.org/user-guide/isolating-dependencies/
        EXEC tSQLt.FakeTable @TableName = 'dbo.Contacts';
        DECLARE @TestEmail CHAR(30);
        SET @TestEmail = 'sql.in.the.city@red-gate.com';

        --Act
        --  Execute the code under test like a stored procedure, function or view
        --  and capture the results in variables or tables.
        -- Populate a record using the procedure I'm testing
        EXEC [dbo].[prcAddContact] @ContactFullName = 'David Atkinson' ,
                                   @Email = @TestEmail;

        --Assert
        --  Compare the expected and actual values, or call tSQLt.Fail in an IF statement.  
        --  Available Asserts: tSQLt.AssertEquals, tSQLt.AssertEqualsString, tSQLt.AssertEqualsTable
        --  For a complete list, see: http://tsqlt.org/user-guide/assertions/

        -- Specify the actual results
        DECLARE @ActualEmail CHAR(30);
        SET @ActualEmail = (   SELECT Email
                               FROM   dbo.Contacts );

        -- Verify that the actual results corresponds to the expected results
        EXEC tSQLt.AssertEquals @Expected = @TestEmail ,
                                @Actual = @ActualEmail;

    END;

GO
