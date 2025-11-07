SELECT 
       HR_Emp.[EmployeeNumber]
      ,Dim_Dept.DepartmentID
      ,HR_Emp.[PerformanceRating]
      ,HR_Emp.[YearsSinceLastPromotion]
      ,HR_Emp.[YearsInCurrentRole]
      ,HR_Emp.[YearsWithCurrManager]
  FROM [HR_Analytics].[dbo].[HR_Emp_Data] as HR_Emp
  INNER JOIN [HR_Analytics].[dbo].[Dim_Department] as Dim_Dept
  on HR_Emp.Department = Dim_Dept.Department
  LEFT JOIN [HR_Analytics].[dbo].[Fact_Emp_Performance] as Fact_Per
  on HR_Emp.EmployeeNumber =  Fact_Per.EmployeeNumber
  and  Dim_Dept.DepartmentID =  Fact_Per. DepartmentID
  where Fact_Per.EmployeeNumber IS NULL
