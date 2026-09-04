 
CREATE TABLE ROUTE (
    RouteID         INT             IDENTITY(1,1) PRIMARY KEY,
    EventID         INT             NOT NULL FOREGIN KEY,
    Distance        DECIMAL(5,2)    NOT NULL,
    RouteName       NVARCHAR(100)   NOT NULL,
    RouteDescription NVARCHAR(MAX)  NULL,
    CONSTRAINT FK_ROUTE_EVENT
        FOREIGN KEY (EventID) REFERENCES EVENT(EventID)
        ON DELETE CASCADE
);
GO

INSERT INTO ROUTE (EventID, Distance, RouteName, RouteDescription)
VALUES
(1, 87.00, N'Up Run Route', N'Pietermaritzburg to Durban via Polly Shortts and Fields Hill.'),
(2, 109.00, N'Peninsula Loop', N'Cape Town city through Chapman''s Peak to the Atlantic seaboard.'),
(3, 21.10, N'Soweto Heritage Route', N'Loop through Soweto passing key heritage sites.');
GO

SELECT * FROM ROUTE

DELETE FROM ROUTE 
WHERE EventID = 3 

DELETE FROM ROUTE
WHERE RouteName = Soweto
