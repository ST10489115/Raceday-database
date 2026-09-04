 
CREATE TABLE WEATHER (
    WeatherID       INT             IDENTITY(1,1) PRIMARY KEY,
    EventID         INT             NOT NULL FOREGIN KEY ,
    Temperature     DECIMAL(4,1)    NULL,
    Condition       NVARCHAR(50)    NULL,
    WindSpeed       DECIMAL(5,2)    NULL,
    ForecastDate    DATE            NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    CONSTRAINT FK_WEATHER_EVENT
        FOREIGN KEY (EventID) REFERENCES EVENT(EventID)
        ON DELETE CASCADE
);
GO

INSERT INTO WEATHER (EventID, Temperature, Condition, WindSpeed, ForecastDate)
VALUES
(1, 14.5, N'Partly Cloudy', 12.0, '2027-06-13'),
(2, 19.0, N'Sunny', 22.5, '2027-03-08'),
(3, 16.0, N'Clear', 8.0, '2026-11-01');
(4,20.6, N'Overcoast, 10.0, '2026-06-21);
GO

SELECT * FROM WEATHER

DROP FROM Weather 
WHERE Temperature = 19.0 
