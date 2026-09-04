# Raceday-database
RaceDay Event Management Database
Overview
RaceDayDB is a relational database designed to manage running,
cycling, and other sporting events. The database stores information
about event organizers, events, event categories, participants,
registrations, results, weather forecasts, and routes.
The project is based on the Entity Relationship Diagram (ERD) supplied
with the assignment.
Objectives
The main objectives of the database are to:

* Store event organizer information.
* Manage event details such as name, date, location, and description.
* Create categories for each event.
* Store participant information.
* Register participants for specific event categories.
* Record participant results after an event.
* Store weather information for events.
* Store route information for events.
* Maintain relationships between tables using primary and foreign
keys.
* Apply constraints to improve data integrity.

Database Technology

* Database Management System: Microsoft SQL Server
* Database Name: `RaceDayDB`
* Language: T-SQL (Transact-SQL)

Database Tables
1. EVENT_ORGANIZER
Stores information about the people or organizations that organize
events.
Primary Key: `OrganizerID`
Fields:

* `OrganizerID`
* `Name`
* `Email`
* `Phone`

The `Email` field is unique so that two organizers cannot use the same
email address.
2. EVENT
Stores the main details of each event.
Primary Key: `EventID`
Foreign Key: `OrganizerID`
Fields:

* `EventID`
* `OrganizerID`
* `EventName`
* `EventDate`
* `Location`
* `Description`

One organizer can manage many events.
3. CATEGORY
Stores the categories available for an event.
Primary Key: `CategoryID`
Foreign Key: `EventID`
Fields:

* `CategoryID`
* `EventID`
* `CategoryName`
* `Distance`
* `MaxParticipants`

Examples include full-distance, half-marathon, 10 km, and cycling
categories.
A unique constraint prevents the same category name from being
duplicated within the same event.
4. PARTICIPANT
Stores information about people who participate in events.
Primary Key: `ParticipantID`
Fields:

* `ParticipantID`
* `FirstName`
* `LastName`
* `Email`
* `Phone`

The participant email address is unique.
5. REGISTRATION
Stores participant registrations and connects participants with events
and categories.
Primary Key: `RegistrationID`
Foreign Keys: `ParticipantID`, `EventID`, `CategoryID`
Fields:

* `RegistrationID`
* `ParticipantID`
* `EventID`
* `CategoryID`
* `RegistrationDate`
* `RegistrationStatus`

The database uses a CHECK constraint to ensure that only these statuses
can be entered.
6. RESULTS
Stores the result of a participant's registration.
Primary Key: `ResultsID`
Foreign Key: `RegistrationID`
Fields:

* `ResultsID`
* `RegistrationID`
* `FinishTime`
* `Position`
* `Pace`

`RegistrationID` is unique in this table. This means one registration
can have zero or one result, matching the ERD relationship.
7. WEATHER
Stores weather information associated with an event.
Primary Key: `WeatherID`
Foreign Key: `EventID`
Fields:

* `WeatherID`
* `EventID`
* `Temperature`
* `Condition`
* `WindSpeed`
* `ForecastDate`

An event can have zero, one, or many weather records.
8. ROUTE
Stores information about routes used by events.
Primary Key: `RouteID`
Foreign Key: `EventID`
Fields:
Primary Keys and Foreign Keys Primary keys uniquely identify records in a table. Foreign keys create links between related tables. Examples:

* `EVENT.OrganizerID` → `EVENT_ORGANIZER.OrganizerID`
* `CATEGORY.EventID` → `EVENT.EventID`
* `REGISTRATION.ParticipantID` → `PARTICIPANT.ParticipantID`
* `REGISTRATION.EventID` → `EVENT.EventID`
* `REGISTRATION.CategoryID` → `CATEGORY.CategoryID`
* `RESULTS.RegistrationID` → `REGISTRATION.RegistrationID`
* `WEATHER.EventID` → `EVENT.EventID`
* `ROUTE.EventID` → `EVENT.EventID`

Database Constraints The project uses several SQL Server constraints to protect data integrity:

* PRIMARY KEY -- uniquely identifies each record.
* FOREIGN KEY -- maintains relationships between tables.
* NOT NULL -- ensures required information is provided.
* UNIQUE -- prevents duplicate values where required.
* CHECK -- restricts registration status to valid values.
* DEFAULT -- automatically supplies values such as registration date and forecast date.
* IDENTITY -- automatically generates numeric primary key values.

Cascade Rules Several relationships use `ON DELETE CASCADE`. This means that when a parent record is deleted, related child records are automatically deleted where appropriate. For example, deleting an event can remove its related categories, weather records, and routes. The registration table uses different delete rules for its event and category relationships to help prevent accidental deletion of related event data. Sample Data The database includes sample data for:

* Event organizers
* Comrades Marathon
* Cape Town Cycle Tour
* Soweto Marathon
* Event categories
* Participants
* Registrations
* Results
* Weather forecasts
* Routes

This sample data can be used to test the relationships and database operations. Project File Structure

```
RaceDay Database
│
├── 01_EVENT_ORGANIZER.sql
├── 02_EVENT.sql
├── 03_CATEGORY.sql
├── 04_PARTICIPANT.sql
├── 05_REGISTRATION.sql
├── 06_RESULTS.sql
├── 07_WEATHER.sql
└── 08_ROUTE.sql

```

Installation and Setup Requirements You need:

* Microsoft SQL Server
* SQL Server Management Studio (SSMS) or another SQL Server-compatible query tool.

Steps

1. Open SQL Server Management Studio.
2. Connect to your SQL Server instance.
3. Open the SQL files in the order shown below.
4. Run each script one at a time.

Recommended Execution Order Run the files in this order:

1. `01_EVENT_ORGANIZER.sql`
2. `02_EVENT.sql`
3. `03_CATEGORY.sql`
4. `04_PARTICIPANT.sql`
5. `05_REGISTRATION.sql`
6. `06_RESULTS.sql`
7. `07_WEATHER.sql`
8. `08_ROUTE.sql`

The order is important because tables contain foreign keys that depend on tables created earlier. Example Queries Display all events

```
USE RaceDayDB;

SELECT *
FROM EVENT;

```

Display participants and their registrations

```
SELECT
    P.FirstName,
    P.LastName,
    R.RegistrationDate,
    R.RegistrationStatus
FROM PARTICIPANT P
JOIN REGISTRATION R
    ON P.ParticipantID = R.ParticipantID;

```

Display events and their categories

```
SELECT
    E.EventName,
    C.CategoryName,
    C.Distance,
    C.MaxParticipants
FROM EVENT E
JOIN CATEGORY C
    ON E.EventID = C.EventID;

```

Display participant results

```
SELECT
    P.FirstName,
    P.LastName,
    E.EventName,
    RST.FinishTime,
    RST.Position,
    RST.Pace
FROM PARTICIPANT P
JOIN REGISTRATION R
    ON P.ParticipantID = R.ParticipantID
JOIN EVENT E
    ON R.EventID = E.EventID
JOIN RESULTS RST
    ON R.RegistrationID = RST.RegistrationID;

```
* `RouteID`
* `EventID`
* `Distance`
* `RouteName`
* `RouteDescription`
