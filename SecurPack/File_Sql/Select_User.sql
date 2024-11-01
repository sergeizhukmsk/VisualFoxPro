
USE RecountCC

--DELETE  dbo.[User] WHERE Id = 819

--UPDATE dbo.[User] SET UserPassword = 'Qwerty123' WHERE Id = 2020
--UPDATE dbo.[User] SET IsActive = 1 WHERE Id = 706
--UPDATE dbo.[User] SET IsActive = 0 WHERE Id IN (3725, 3726)
--UPDATE dbo.[User] SET DateRecord = GetDate() WHERE Id IN (3725, 3726)
--UPDATE dbo.[User] SET UserName = 'Семушкин Н.Е.' WHERE Id = 3522
--UPDATE dbo.[User] SET UserId = '30462_2' WHERE Id = 2794
--UPDATE dbo.[User] SET IdPost = 11 WHERE Id = 3088
--UPDATE dbo.[User] SET IdDepartment = 2, MestoCode = 'KTL' WHERE Id = 2773

SELECT usr.Id
      ,usr.IdDepartment
      ,dpt.DepartmentName
      ,usr.IdPost
      ,pst.PostName
      ,usr.UserName
      ,usr.UserId
      ,usr.UserPassword
      --,pst.Code
      ,usr.MestoCode
      ,usr.IsActive
  	  ,usr.DateRecord
--      ,SYSTEM_USER AS LoginUser
  FROM dbo.[User] AS usr
  INNER JOIN dbo.Post AS pst ON pst.Id = usr.IdPost
  INNER JOIN dbo.Department AS dpt ON dpt.Id = usr.IdDepartment
  --WHERE usr.Id = 3712  --1861
  --WHERE usr.Id IN (3091,3119,2829,2873,2873)
  --WHERE usr.IdPost IN (44,56,71)
  --WHERE usr.IdPost = 11
  WHERE usr.UserName LIKE '%Жук С%' --AND usr.MestoCode = 'KTL'
  --WHERE usr.UserName LIKE '%9999%' --AND usr.MestoCode = 'KTL'
  --WHERE usr.MestoCode = 'KTL'
  --WHERE (usr.UserId LIKE '%9296_2%' OR usr.UserId LIKE '%9297_2%')
  --WHERE usr.UserId LIKE '%O5E9STL_3%' --AND usr.IdDepartment IN (42, 42)
  --WHERE usr.UserId LIKE '%61505%'
  --WHERE usr.UserId = '4078' OR usr.UserId = '3020'
  --WHERE LEFT(usr.UserId, 5) = 'O21E9STL_3'
  --WHERE usr.UserId = '6501' --7507
  --WHERE usr.IdDepartment IN (7, 47, 57) AND usr.IdPost = 97 AND usr.MestoCode = 'YAR'
  --WHERE usr.UserId IN ('8732', '8735')
  --WHERE usr.MestoCode = 'YAR' AND usr.IdPost = 1 AND usr.IsActive = 1
  --WHERE usr.UserName LIKE '%Сергеева О%' --AND usr.IdDepartment IN (2, 2)
  --WHERE usr.UserName LIKE '%Румянцева Е%' AND usr.IdPost IN (4, 5, 11)
  --WHERE pst.PostName LIKE '%УРК%' --AND usr.UserId NOT IN ('R5780', 'R5782') AND usr.IsActive = 1
  --WHERE usr.IdDepartment = 25 --AND usr.IdPost = 25
  --WHERE usr.IdDepartment = 21 AND usr.IdPost IN (21, 22)
  --WHERE usr.IdDepartment = 1 AND usr.IsActive = 1 --AND usr.IdPost IN (1, 2, 44, 49, 56, 70, 71)
  --WHERE usr.IdPost IN (12, 93, 94) --AND usr.IsActive = 1  --AND usr.IdDepartment = 13
  --WHERE usr.IdDepartment = 21 AND usr.IdPost IN (22, 84) AND usr.IsActive = 1
  --WHERE usr.IdDepartment IN (47, 47) --AND usr.IdPost = 12
  --WHERE usr.IdPost = 71 AND usr.IsActive = 1 AND usr.IdDepartment = 1
  --WHERE usr.IdPost = 4 AND usr.IsActive = 1 AND usr.UserId LIKE '%KMA%'  --KMA  --OCV
  --WHERE usr.IdDepartment IN (48, 48) AND usr.IdPost = 22 AND usr.IsActive = 1
  --WHERE usr.UserId = 'O2E9STL'
  --WHERE usr.UserId LIKE '%E9STL_3%'
  --WHERE usr.Id = 3657
  --WHERE usr.Id   IN (2036, 2029)
  --WHERE dpt.DepartmentName = 'Отдел сопровождения кассовых операций УР                                                            '
  --ORDER BY usr.Id DESC
  --ORDER BY usr.IdPost, usr.UserName
  --ORDER BY usr.IdDepartment
  --ORDER BY usr.UserName, usr.UserId
  --ORDER BY usr.UserId
  ORDER BY usr.Id DESC
  --ORDER BY usr.IdDepartment desc, usr.IdPost DESC
  
  --UPDATE dbo.User SET DtRecord = CONVERT(Char(30), GetDate() - 20, 21) WHERE Id BETWEEN 1764 AND 2000
  --UPDATE dbo.User SET IdPost = 71 WHERE Id = 1677
  --      ,CONVERT(Char(30), GetDate() - 1700, 21) AS New_DtRecord


--INSERT INTO dbo.[User]
--SELECT
--       IdPost
--      ,IdDepartment
--      ,'' AS UserName
--      ,'9999' AS UserId
--      ,'9999' AS UserPassword
--      ,IsActive
--      ,MestoCode
--      ,GetDate() AS DateRecord
--FROM dbo.[User]
--WHERE Id = 1636








