select * from HR_Analytics;

select COUNT(EmpID) from HR_Analytics;

select COUNT(Attrition) AS Attrition from HR_Analytics where Attrition = 1;

select (COUNT(CASE WHEN attrition=1 THEN 1 END)*100)/COUNT(*) AS Attrition_Percentage from HR_Analytics;

select AVG(Age) from HR_Analytics;

select AVG(MonthlyIncome) from HR_Analytics;

select AVG(YearsatCompany) from HR_Analytics;