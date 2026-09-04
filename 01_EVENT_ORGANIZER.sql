
CREATE DATABASE RaceDayDB;
GO

 
CREATE TABLE EVENT_ORGANIZER (
    OrganizerID     INT             IDENTITY(1,1) PRIMARY KEY,
    Name            NVARCHAR(100)   NOT NULL,
    Email           NVARCHAR(100)   NOT NULL UNIQUE,
    Phone           NVARCHAR(20)    NULL
);
GO

INSERT INTO EVENT_ORGANIZER (Name, Email, Phone)
VALUES
(N'Thabo Nkosi - KZN Athletics Club', N'thabo.nkosi@raceday.co.za', N'0821234567'),
(N'Amanda van der Merwe - Cape Cycling Events', N'amanda.vdm@raceday.co.za', N'0837654321');
GO

SELECT * FROM EVENT_ORGANIZER

DROP TABLE EVENT_ORGANIZER

