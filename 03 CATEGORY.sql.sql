 
CREATE TABLE CATEGORY (
    CategoryID      INT             IDENTITY(1,1) PRIMARY KEY,
    EventID         INT             NOT NULL FOREGIN KEY,
    CategoryName    NVARCHAR(50)    NOT NULL,
    Distance        DECIMAL(5,2)    NOT NULL,
    MaxParticipants INT             NOT NULL DEFAULT 500,
    CONSTRAINT FK_CATEGORY_EVENT
        FOREIGN KEY (EventID) REFERENCES EVENT(EventID)
        ON DELETE CASCADE,
    CONSTRAINT UQ_CATEGORY_EventCategoryName
        UNIQUE (EventID, CategoryName)
);
GO

INSERT INTO CATEGORY (EventID, CategoryName, Distance, MaxParticipants)
VALUES
(1, N'Up Run - Full', 87.00, 20000),
(1, N'Novice', 87.00, 5000),
(2, N'Cycle Tour 109km', 109.00, 35000),
(2, N'Mini Cycle 42km', 42.00, 10000),
(3, N'Half Marathon', 21.10, 8000),
(3, N'10km Fun Run', 10.00, 6000);
GO

SELECT * FROM CATEGORY;

DELETE FROM Category 
WHERE EventID = 3
