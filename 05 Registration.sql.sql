 
CREATE TABLE PARTICIPANT (
    ParticipantID   INT             IDENTITY(1,1) PRIMARY KEY,
    FirstName       NVARCHAR(50)    NOT NULL,
    LastName        NVARCHAR(50)    NOT NULL,
    Email           NVARCHAR(100)   NOT NULL UNIQUE,
    Phone           NVARCHAR(60)    NULL
);
GO

INSERT INTO PARTICIPANT (FirstName, LastName, Email, Phone)
VALUES
(N'Sipho', N'Dlamini', N'sipho.dlamini@example.com', N'0712345678'),
(N'Emma', N'Botha', N'emma.botha@example.com', N'0723456789');
GO

SELECT * FROM  PARTICIPANT

UPDATE ParticipantID 
SET email = 100 
WHERE EmailID = 3
