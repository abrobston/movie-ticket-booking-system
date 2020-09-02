SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Screening
(
    Id INT IDENTITY NOT NULL CONSTRAINT PK_dbo_Screening PRIMARY KEY CLUSTERED,
    ShowId INT NOT NULL CONSTRAINT FK_dbo_Screening_ShowId REFERENCES dbo.Show (Id),
    AuditoriumId INT NOT NULL CONSTRAINT FK_dbo_Screening_AuditoriumId REFERENCES dbo.Auditorium (Id),
    StartTime DATETIMEOFFSET(0) NOT NULL,
    CONSTRAINT UX_dbo_Screening_ShowId_AuditoriumId_StartTime UNIQUE NONCLUSTERED (ShowId, AuditoriumId, StartTime),
    -- For foreign-key constraint from dbo.Reservation
    CONSTRAINT UX_dbo_Screening_Id_AuditoriumId UNIQUE NONCLUSTERED (Id, AuditoriumId)
)
GO
