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

Possible registration statuses are:

* `Pending`
* `Confirmed`
* `Cancelled`

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

* `RouteID`
* `EventID`
* `Distance`
* `RouteName`
* `RouteDescription`
