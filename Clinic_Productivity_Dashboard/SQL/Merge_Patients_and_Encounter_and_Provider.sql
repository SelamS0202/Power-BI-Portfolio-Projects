Create view VW_Clinic_Analytics_Data as (
SELECT E.[Id] as E_Id
      ,E.[START] as E_Start
      ,E.[STOP] as E_Stop
      ,E.[PATIENT] as E_Patient
      ,E.[ORGANIZATION] as E_Organization
      ,E.[PROVIDER] as E_Provider
      ,E.[PAYER] as E_Payer
      ,E.[ENCOUNTERCLASS] as E_Encounter_Class
      ,E.[CODE] as E_Code
      ,E.[DESCRIPTION] as E_Description
      ,E.[BASE_ENCOUNTER_COST] as E_Base_Encounter_Cost
      ,E.[TOTAL_CLAIM_COST] as E_Total_Claim_Cost
      ,E.[PAYER_COVERAGE] as E_Payer_Coverage
      ,E.[REASONCODE] as E_Reason_Code
      ,E.[REASONDESCRIPTION] as E_Reason_Description
      ,PT.[Id] as PT_Id
      ,PT.[BIRTHDATE] as PT_Birth_Date
      ,PT.[DEATHDATE] as PT_Death_Date
      ,PT.[SSN] as PT_SSN
      ,PT.[DRIVERS] as PT_Drivers
      ,PT.[PASSPORT] as PT_Passport
      ,PT.[PREFIX] as PT_Prefix
      ,PT.[FIRST] as PT_First
      ,PT.[MIDDLE] as PT_Middle
      ,PT.[LAST] as PT_Last
      ,PT.[SUFFIX] as PT_Suffix
      ,PT.[MAIDEN] as PT_Maiden
      ,PT.[MARITAL] as PT_Marital
      ,PT.[RACE] as PT_Race
      ,PT.[ETHNICITY] as PT_Ethnicity
      ,PT.[GENDER] as PT_Gender
      ,PT.[BIRTHPLACE] as PT_Birth_Place
      ,PT.[ADDRESS] as PT_Address
      ,PT.[CITY] as PT_City
      ,PT.[STATE] as PT_State
      ,PT.[COUNTY] as PT_Country
      ,PT.[FIPS] as PT_Flips
      ,PT.[ZIP] as PT_ZIP
      ,PT.[LAT] as PT_Lat
      ,PT.[LON] as PT_Lon
      ,PT.[HEALTHCARE_EXPENSES] as PT_Healthcare_Expenses
      ,PT.[HEALTHCARE_COVERAGE] as PT_Healthcare_Coverage
      ,PT.[INCOME] as PT_Income
	  ,P.[Id] as P_Id
      ,P.[ORGANIZATION] as P_Organization
      ,P.[NAME] as P_Name
      ,P.[GENDER] as P_Gender
      ,P.[SPECIALITY] as P_Speciality
      ,P.[ADDRESS] as P_Address
      ,P.[CITY] as P_City
      ,P.[STATE] as P_State
      ,P.[ZIP] as P_ZIP
      ,P.[LAT] as P_Lat
      ,P.[LON] as P_Long
      ,P.[ENCOUNTERS] as P_Encounters
      ,P.[PROCEDURES] as P_Procedures
  FROM [Clinic_Data].[dbo].[Staging_Encounters] as E
  Left join [dbo].[Staging_Patients] as PT
  on E.[PATIENT] = PT.[Id]
  Left Join [dbo].[Staging_Providers] as P
  on E.PROVIDER = P.Id
  
  )