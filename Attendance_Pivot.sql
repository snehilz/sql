CREATE PROCEDURE GET_ATTENDANCEREPORT   
@STARTDATE DATETIME,  
@ENDDATE DATETIME  
AS BEGIN  
--Now generate the dates between two dates using a Common Table Expression and store the values in one temporary table (#TMP_DATES).
WITH DATERANGE AS  
(  
   SELECT DT =DATEADD(DD,0, @STARTDATE)  
   WHERE DATEADD(DD, 1, @STARTDATE) <= @ENDDATE  
   UNION ALL  
   SELECT DATEADD(DD, 1, DT)  
   FROM DATERANGE  
   WHERE DATEADD(DD, 1, DT) <= @ENDDATE  
)  
SELECT * INTO #TMP_DATES  
FROM DATERANGE   

--Since the report columns (Dates) are dynamic, hence the columns (Dates) are concatenated one by one from the temporary table (#TMP_DATES) and stores the value in a local variable.

DECLARE @COLUMN VARCHAR(MAX)  
SELECT @COLUMN=ISNULL(@COLUMN+',','')+ '['+ CAST(CONVERT(DATE , T.DT) AS VARCHAR) + ']' FROM #TMP_DATES T  

--After the Pivot, some columns may be null if the data (here PRESENT_STATUS) does not exist in the pivot section. Now replace the null values by "N/A".

DECLARE @Columns2 VARCHAR(MAX)  
SET @Columns2 = SUBSTRING((SELECT DISTINCT ',ISNULL(['+ CAST(CONVERT(DATE , DT) as varchar )+'],''N/A'') AS ['+CAST(CONVERT(DATE , DT) as varchar )+']' FROM #TMP_DATES GROUP BY dt FOR XML PATH('')),2,8000)  

--Now declare one local variable to write the dynamic SQL query.

DECLARE @QUERY VARCHAR(MAX)  

--Here a right outer-join is used to show the all dates from the temporary table:

SET @QUERY = 'SELECT NAME, ' + @Columns2 +' FROM   
(  
SELECT A.NAME , B.DT AS DATE, A.PRESENT_STATUS FROM attend A RIGHT OUTER JOIN #TMP_DATES B ON A.DATE=B.DT   
) X  
PIVOT   
(  
MIN([PRESENT_STATUS])  
FOR [DATE] IN (' + @COLUMN + ')  
) P   
WHERE ISNULL(NAME,'''')<>''''  
'  
  
EXEC (@QUERY)  

--Drop the temporary table.

DROP TABLE #TMP_DATES  
  
END  

--Now execute the Stored Procedure.

EXEC dbo.GET_ATTENDANCEREPORT @STARTDATE ='2022-02-01',  
@ENDDATE='2022-03-7'  