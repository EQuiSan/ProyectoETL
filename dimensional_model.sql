-- Truncar y crear las tablas si no existen
IF OBJECT_ID('FactPatients', 'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE FactPatients;
END

IF OBJECT_ID('DimWeekEnds', 'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE DimWeekEnds;
END

IF OBJECT_ID('DimOutcomes', 'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE DimOutcomes;
END

IF OBJECT_ID('DimAgeGroups', 'U') IS NOT NULL
BEGIN
    TRUNCATE TABLE DimAgeGroups;
END


--Crear Tablas Dimensionales
IF OBJECT_ID('DimOutcomes', 'U') IS NULL
	BEGIN
		CREATE TABLE DimOutcomes
		(
		OutcomeID INT PRIMARY KEY IDENTITY (1,1),
		OutcomeName NVARCHAR(50)
		)
	END

IF OBJECT_ID('DimWeekEnds', 'U') IS NULL
	BEGIN
		CREATE TABLE DimWeekEnds
		(
		WeekEndKey INT PRIMARY KEY IDENTITY (1,1),
		WeekEnd DATE,
		Day INT,
		Month INT,
		Year INT
		)
	END

IF OBJECT_ID('DimAgeGroups', 'U') IS NULL
	BEGIN
		CREATE TABLE DimAgeGroups
		(
		AgeGroupKey INT PRIMARY KEY IDENTITY (1,1),
		AgeGroup NVARCHAR(50)
		)
		END

IF OBJECT_ID('FactPatients', 'U') IS NULL
	BEGIN
		CREATE TABLE FactPatients
		(
		OutcomeID INT,
		WeekEndKey INT,
		AgeGroupKey INT,
		UnvaccinatedRate FLOAT,
		VaccinatedRate FLOAT,
		BoostedRate FLOAT,
		CrudeVaccinatedRatio FLOAT,
		CrudeBoostedRatio FLOAT,
		AgeAdjustedUnvaccinatedRate FLOAT,
		AgeAdjustedVaccinatedRate FLOAT,
		AgeAdjustedBoostedRate FLOAT,
		AgeAdjustedVaccinatedRatio FLOAT,
		AgeAdjustedBoostedRatio FLOAT,
		PopulationUnvaccinated INT,
		PopulationVaccinated INT,
		PopulationBoosted INT,
		OutcomeUnvaccinated INT,
		OutcomeVaccinated INT,
		OutcomeBoosted INT
)
END

--Insertar datos transformados a la BD Dimensional

INSERT INTO DimWeekEnds (WeekEnd, Year, Month, Day)
SELECT DISTINCT Weekend, 
	datepart(year,Weekend), 
	datepart(month,Weekend),
	datepart(day,Weekend) FROM ETLDB.dbo.Patients;

INSERT INTO DimOutcomes (OutcomeName)
SELECT DISTINCT Outcome FROM ETLDB.dbo.Patients;

INSERT INTO DimAgeGroups (AgeGroup)
SELECT DISTINCT AgeGroup FROM ETLDB.dbo.Patients;

INSERT INTO FactPatients 
(OutcomeID, WeekEndKey, AgeGroupKey, UnvaccinatedRate, VaccinatedRate, BoostedRate, 
CrudeVaccinatedRatio, CrudeBoostedRatio, AgeAdjustedUnvaccinatedRate, AgeAdjustedVaccinatedRate,
AgeAdjustedBoostedRate, AgeAdjustedVaccinatedRatio, AgeAdjustedBoostedRatio, PopulationUnvaccinated,
PopulationVaccinated, PopulationBoosted, OutcomeUnvaccinated, OutcomeVaccinated, OutcomeBoosted)
SELECT 
		O.OutcomeID,
		W.WeekEndKey,
		A.AgeGroupKey,
		P.UnvaccinatedRate,
		P.VaccinatedRate,
		P.BoostedRate,
		P.CrudeVaccinatedRatio,
		P.CrudeBoostedRatio,
		P.AgeAdjustedUnvaccinatedRate,
		P.AgeAdjustedVaccinatedRate,
		P.AgeAdjustedBoostedRate,
		P.AgeAdjustedVaccinatedRatio,
		P.AgeAdjustedBoostedRatio,
		P.PopulationUnvaccinated,
		P.PopulationVaccinated,
		P.PopulationBoosted,
		P.OutcomeUnvaccinated,
		P.OutcomeVaccinated,
		P.OutcomeBoosted
FROM ETLDB.dbo.Patients AS P
JOIN DimOutcomes AS O ON P.Outcome = O.OutcomeName
JOIN DimWeekEnds AS W ON P.Weekend = W.WeekEnd
JOIN DimAgeGroups AS A ON P.AgeGroup = A.AgeGroup

SELECT * FROM dbo.FactPatients