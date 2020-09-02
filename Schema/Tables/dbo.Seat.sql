SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Seat
(
    AuditoriumId INT NOT NULL CONSTRAINT FK_dbo_Seat_AuditoriumId REFERENCES dbo.Auditorium (Id),
    [Row] VARCHAR(5) NOT NULL CONSTRAINT CK_dbo_Seat_Row CHECK (LEN([Row]) > 0),
    [Number] SMALLINT NOT NULL CONSTRAINT CK_dbo_Seat_Number CHECK ([Number] > 0),
    IsRemovable BIT NOT NULL CONSTRAINT DF_dbo_Seat_IsRemovable DEFAULT (0),
    CONSTRAINT PK_dbo_Seat PRIMARY KEY CLUSTERED (AuditoriumId, [Row], [Number])
)
GO
