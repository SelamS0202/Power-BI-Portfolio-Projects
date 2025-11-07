SELECT 
       HR_Emp.[EmployeeNumber]
      ,Dim_Dept.DepartmentID
      ,HR_Emp.[DailyRate]
      ,HR_Emp.[PercentSalaryHike]
      ,HR_Emp.[StandardHours]
      ,HR_Emp.[HourlyRate]
  FROM [HR_Analytics].[dbo].[HR_Emp_Data] as HR_Emp
  INNER JOIN [HR_Analytics].[dbo].[Dim_Department] as Dim_Dept
  on HR_Emp.Department = Dim_Dept.Department
  LEFT JOIN [HR_Analytics].[dbo].[Fact_Emp_Compensation] as Fact_Comp
  on HR_Emp.EmployeeNumber =  Fact_Comp.EmployeeNumber
  and  Dim_Dept.DepartmentID =  Fact_Comp. DepartmentID
  where Fact_Comp.EmployeeNumber IS NULL;

  INSERT INTO [HR_Analytics].[dbo].[Fact_Emp_Compensation](
  [EmployeeNumber],
  DepartmentID,
  [DailyRate],
  [PercentSalaryHike],
  [StandardHours],
  [HourlyRate]
  )
  SELECT 
       HR_Emp.[EmployeeNumber]
      ,Dim_Dept.DepartmentID
      ,HR_Emp.[DailyRate]
      ,HR_Emp.[PercentSalaryHike]
      ,HR_Emp.[StandardHours]
      ,HR_Emp.[HourlyRate]
  FROM [HR_Analytics].[dbo].[HR_Emp_Data] as HR_Emp
  INNER JOIN [HR_Analytics].[dbo].[Dim_Department] as Dim_Dept
  on HR_Emp.Department = Dim_Dept.Department
  LEFT JOIN [HR_Analytics].[dbo].[Fact_Emp_Compensation] as Fact_Comp
  on HR_Emp.EmployeeNumber =  Fact_Comp.EmployeeNumber
  and  Dim_Dept.DepartmentID =  Fact_Comp. DepartmentID
  where Fact_Comp.EmployeeNumber IS NULL;