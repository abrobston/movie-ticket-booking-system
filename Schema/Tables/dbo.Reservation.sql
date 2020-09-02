SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Reservation
(
    Id INT IDENTITY NOT NULL CONSTRAINT PK_dbo_Reservation PRIMARY KEY,
    ScreeningId INT NOT NULL,
    AuditoriumId INT NOT NULL CONSTRAINT FK_dbo_Reservation_AuditoriumId REFERENCES dbo.Auditorium (Id),
    SeatRow VARCHAR(5) NOT NULL,
    SeatNumber SMALLINT NOT NULL,
    OrderId INT NOT NULL CONSTRAINT FK_dbo_Reservation_OrderId REFERENCES dbo.Orders (Id),
    CancelDate DATETIMEOFFSET(7) NULL,
    CONSTRAINT FK_dbo_Reservation_ScreeningId_AuditoriumId FOREIGN KEY (ScreeningId, AuditoriumId) REFERENCES dbo.Screening (Id, AuditoriumId),
    CONSTRAINT FK_dbo_Reservation_AuditoriumId_SeatRow_SeatNumber FOREIGN KEY (AuditoriumId, SeatRow, SeatNumber) REFERENCES dbo.Seat (AuditoriumId, [Row], [Number])
)
GO

CREATE UNIQUE INDEX FX_dbo_Reservation_ScreeningId_SeatId ON dbo.Reservation
(ScreeningId, AuditoriumId, SeatRow, SeatNumber) WHERE CancelDate IS NULL
GO
