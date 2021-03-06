SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Users
(
    Id INT IDENTITY NOT NULL CONSTRAINT PK_dbo_Users PRIMARY KEY,
    Email NVARCHAR(850) NOT NULL CONSTRAINT CK_dbo_Users_Email CHECK (LEN(Email) > 0),
    PasswordHashString VARCHAR(62) NOT NULL,
    FirstName NVARCHAR(4000) NOT NULL,
    LastName NVARCHAR(4000) NOT NULL,
    CONSTRAINT UX_dbo_Users_Email UNIQUE NONCLUSTERED (Email)
)
GO
