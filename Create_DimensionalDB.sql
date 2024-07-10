CREATE DATABASE DimensionalDB

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

CREATE TABLE DimWeekEnds
		(
		WeekEndKey INT PRIMARY KEY IDENTITY (1,1),
		WeekEnd DATE,
		Day INT,
		Month INT,
		Year INT
)

CREATE TABLE DimOutcomes
		(
		OutcomeID INT PRIMARY KEY IDENTITY (1,1),
		OutcomeName NVARCHAR(50)
)

CREATE TABLE DimAgeGroups
		(
		AgeGroupKey INT PRIMARY KEY IDENTITY (1,1),
		AgeGroup NVARCHAR(50)
)