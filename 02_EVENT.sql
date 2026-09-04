
CREATE TABLE EVENT (
    EventID         INT             IDENTITY(1,1) PRIMARY KEY,
    OrganizerID     INT             NOT NULL,
    EventName       NVARCHAR(100)   NOT NULL,
    EventDate       DATE            NOT NULL,
    Location        NVARCHAR(150)   NOT NULL,
    Description     NVARCHAR(MAX)   NULL,
    CONSTRAINT FK_EVENT_EVENT_ORGANIZER
        FOREIGN KEY (OrganizerID) REFERENCES EVENT_ORGANIZER(OrganizerID)
       
);
GO

INSERT INTO EVENT (OrganizerID, EventName, EventDate, Location, Description)
VALUES
(1, N'Comrades Marathon', '2027-06-13', N'Pietermaritzburg to Durban', N'Iconic ultramarathon between Pietermaritzburg and Durban.'),
(2, N'Cape Town Cycle Tour', '2027-03-08', N'Cape Town City Centre', N'Scenic cycling tour around the Cape Peninsula.'),
(1, N'Soweto Marathon', '2026-11-01', N'Soweto', N'Community road running event through the streets of Soweto.');
GO

SELECT * FROM EVENT
