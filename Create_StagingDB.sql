CREATE DATABASE COVID19;

CREATE TABLE StagingPatients (
 Outcome NVARCHAR(50),
 WeekEnd NVARCHAR(50),
 AgeGroup NVARCHAR(50),
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
 OutcomeBoosted INT,
 AgeGroupMin INT,
 AgeGroupMax INT
);
GO

CREATE TABLE Patients (
 Outcome NVARCHAR(50),
 WeekEnd NVARCHAR(50),
 AgeGroup NVARCHAR(50),
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
 OutcomeBoosted INT,
 AgeGroupMin INT,
 AgeGroupMax INT
);
GO
