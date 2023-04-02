---Important
USE AdventureWorks2019
GO

---Determine Next StartDate. Result Order By ASC.

SELECT t.ProductID      
      ,t.StartDate  
	  ,LEAD(t.StartDate, 1,NULL) OVER (PARTITION BY t.ProductID ORDER BY t.StartDate ASC) AS NextStartDate 
      ,t.StandardCost
  FROM Production.ProductCostHistory t




---Determine Previous StartDate. Result Order By DESC.

SELECT t.ProductID
      ,LEAD(t.StartDate, 1,NULL) OVER (PARTITION BY t.ProductID ORDER BY t.StartDate DESC) AS PreviousStartDate 
      ,t.StartDate     
      ,t.StandardCost
  FROM Production.ProductCostHistory t

