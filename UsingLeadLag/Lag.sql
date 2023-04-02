---Important
USE AdventureWorks2019
GO

---Determine Previous StartDate. Result Order By ASC.

SELECT t.ProductID
      ,LAG(t.StartDate, 1,NULL) OVER (PARTITION BY t.ProductID ORDER BY t.StartDate ASC) AS PreviousStartDate 
      ,t.StartDate     
      ,t.StandardCost
  FROM Production.ProductCostHistory t


---Determine Next StartDate. Result Order By DESC.

SELECT t.ProductID      
      ,t.StartDate  
	  ,LAG(t.StartDate, 1,NULL) OVER (PARTITION BY t.ProductID ORDER BY t.StartDate DESC) AS NextStartDate 
      ,t.StandardCost
  FROM Production.ProductCostHistory t
