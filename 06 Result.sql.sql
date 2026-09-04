 IF OBJECT_ID('RESULTS', 'U') IS NOT NULL
    DROP TABLE RESULTS;
GO

CREATE TABLE RESULTS
(
    ResultsID INT IDENTITY(1,1) PRIMARY KEY,
    RegistrationID INT NOT NULL UNIQUE,
    FinishTime TIME NULL,
    Position INT NULL,
    Pace NVARCHAR(20) NULL,

    CONSTRAINT FK_RESULTS_REGISTRATION
        FOREIGN KEY (RegistrationID)
        REFERENCES REGISTRATION(RegistrationID)
        ON DELETE CASCADE
);
GO

INSERT INTO RESULTS
    (RegistrationID, FinishTime, Position, Pace)
VALUES
    (1, '08:45:30', 1240, N'6:02/km'),
    (2, '03:15:12', 5400, N'1:47/km'),
    (4, '00:52:40', 310, N'5:16/km');
GO

SELECT * FROM RESULTS;

UPDATE Results 
SET Position = 1240
WHERE RegistrationID = 1

UPDATE Results 
SET Postion = 1240
