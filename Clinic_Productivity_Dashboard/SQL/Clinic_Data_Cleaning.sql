Create view VW_Clinic_Cleaned_Data as 
with CTE_Drop_Unnecessary_Columns  as (
--1) Drop unnecessary columns  and Rename column names
	SELECT TOP (1000) [E_Id] as Encounter_Id
		  ,[E_Start] as Visit_Date
		  ,[E_Stop] as Visit_End
		  ,[E_Provider] as Provider_Id
		  ,[E_Encounter_Class] as Visit_Type
		  ,[E_Description] as Visit_Type_Description
		  ,[E_Base_Encounter_Cost] as Visit_Cost
		  ,[E_Patient] as Patient_Id
		  ,[PT_Birth_Date] as Patient_Birth_Date
		  ,[PT_First] as Patient_First_Name
		  ,[PT_Last] as Patient_Last_Name
		  ,[PT_Marital] as Patient_Marital_Status
		  ,[PT_Gender] as Patient_Gender
		  ,[PT_City] as Patient_City
		  ,[PT_State] as Patient_State
		  ,[P_Id] as Doctor_Id
		  ,[P_Name] as Doctor_Full_Name
		  ,[P_Gender] as Doctor_Gender
		  ,[P_Speciality] as Doctor_Speciality
		  ,[P_City] as Doctor_City   
	  FROM [Clinic_Data].[dbo].[VW_Clinic_Analytics_Data] 
	  ),
Normalize_columns as(
--2) Format columns
SELECT Encounter_Id
,Provider_Id
, Convert (nvarchar(10), Convert(date,Visit_Date,101), 120) as Visit_Date_YYYYMMDD 
, Convert (nvarchar(10), Convert(date,Visit_End,101), 120) as Visit_End_YYYYMMDD 
--, Year(Convert (nvarchar(10), Convert(date,Visit_Date,101), 120)) as Visit_Year
--, Month(Convert (nvarchar(10), Convert(date,Visit_Date,101), 120)) as Visit_Month
--, Datename(Month,Convert (nvarchar(10), Convert(date,Visit_Date,101), 120)) as Visit_Month_Name
, Datediff(MINUTE, 
		TRY_CONVERT(datetime, Visit_Date),
		TRY_CONVERT(datetime, Visit_End)
		) AS Visit_Duration_Minutes 
,concat( upper (substring (Visit_Type, 1,1)), substring (Visit_Type, 2,len(Visit_Type))) as Visit_Type
,Visit_Type_Description
,round (Visit_Cost,3) as Visit_Cost
,Patient_Id
,Replace(Translate(Patient_First_Name, '0123456789','##########'), '#','') as Patient_First_Name
,Replace(Translate(Patient_Last_Name, '0123456789','##########'), '#','') as Patient_Last_Name
,Case 
when Patient_Marital_Status is null then 'Unknown'
else Patient_Marital_Status
end as Patient_Marital_Status
,Patient_Gender 
,Patient_City
,Patient_State
,Patient_Birth_Date
,Doctor_Id
,Replace(Translate(Doctor_Full_Name, '0123456789','##########'), '#', '') as Doctor_Full_Name
,Doctor_Gender
,( Select STRING_AGG(Upper(left(value,1))+ Lower(substring(value,2,LEN(value))),' ')
From string_split(Doctor_Speciality, ' ')
) Doctor_Speciality
,( Select STRING_AGG(Upper(left(value,1))+ Lower(substring(value,2,LEN(value))),' ')
From string_split(Doctor_City, ' ')
) Doctor_City

FROM CTE_Drop_Unnecessary_Columns
)
SELECT *
FROM Normalize_columns
