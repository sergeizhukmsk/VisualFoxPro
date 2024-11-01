 
USE RecountCC

DECLARE @IdShift_1 Int, @IdShift_2 Int, @IdShift_3 Int

--SET @IdShift_1 = 21939
--SET @IdShift_2 = 21939
--SET @IdShift_3 = 21939

SELECT @IdShift_1 = MAX(Id) FROM dbo.Shift (READPAST) WHERE IdDepartment = 2 AND IdPart = 1
SELECT @IdShift_2 = MAX(Id) FROM dbo.Shift (READPAST) WHERE IdDepartment = 2 AND IdPart = 2
SELECT @IdShift_3 = MAX(Id) FROM dbo.Shift (READPAST) WHERE IdDepartment = 2 AND IdPart = 3

--DELETE dbo.BudgetKP WHERE Id = 21810778

--UPDATE dbo.BudgetKP SET IdShift = 24392 WHERE Id = 26144554
--UPDATE dbo.BudgetKP SET IdShift = 19072 WHERE IdBudgetHistoryPRK IN (10384107,10384106,10384105)
--UPDATE dbo.BudgetKP SET DtIncome = '20171126' WHERE Id IN (23575114,23575113,23575112,23574608)
--UPDATE dbo.BudgetKP SET IdUser = 850 WHERE Id = 21874190
--UPDATE dbo.BudgetKP SET IdFilial = 16690 WHERE Id = 22280880
--UPDATE dbo.BudgetKP SET TotalSumPRK = 1111100.00 WHERE Id = 25752464
--UPDATE dbo.BudgetKP SET TotalSumKP = TotalSumPRK WHERE Id = 21807439

--UPDATE dbo.BudgetKP SET SuperBudget = 7816050 WHERE Id = 22150265
--UPDATE dbo.BudgetKP SET BudgetNum = '06-009091103' WHERE Id = 22150267
--UPDATE dbo.BudgetKP SET UserFromCbs = 1269 WHERE IdShift = @IdShift_3 AND UserFromCbs = 819
--UPDATE dbo.BudgetKP SET IdBudgetKP_CFT = '3012170100' + RIGHT(RTRIM(LTRIM(STR(Id))), 5) WHERE Id = 23685662

--UPDATE dbo.BudgetKP SET State = 1, SostCbs = 1 WHERE Id = 23011007
--UPDATE dbo.BudgetKP SET State = 4 WHERE Id = 26961336
--UPDATE dbo.BudgetKP SET State = 3 WHERE Id IN (26522873,26521484)
--UPDATE dbo.BudgetKP SET SuperBudget = 0, Flg2Pin = 0 WHERE Id IN (26522873,26521484)
--UPDATE dbo.BudgetKP SET SuperBudget = 0, Flg2Pin = 0 WHERE Id = 26524645
--UPDATE dbo.BudgetKP SET State = 0, TotalSumKP = 0.00 WHERE Id = 25708745
--UPDATE dbo.BudgetKP SET State = 0 WHERE IdShift = @IdShift_3 AND State = 4 AND TotalSumKP = 0 AND IdUser IS NULL AND Flg2Pin = 0
--UPDATE dbo.BudgetKP SET State = 4, StateBis = 4, Ref = NULL, RefBis = NULL, RefDtime = NULL, RefDtimeBis = NULL WHERE Id = 26366773
--UPDATE dbo.BudgetKP SET State = 5, StateBis = 5, Ref = '', RefBis = '', RefDtime = '', RefDtimeBis = '' WHERE Id IN (21925184, 21927149, 21926147)
--UPDATE dbo.BudgetKP SET State = 5, Ref = '68-2808-44230', RefDtime = '20190828', RefBis = '68-2808-44230', RefDtimeBis = '20190828' WHERE Id = 26530601
--UPDATE dbo.BudgetKP SET State = 5, StateBis = 5, Ref = '94-1603-72078', RefBis = '94-1603-72078', RefDtime = '20190316', RefDtimeBis = '20190316' WHERE Id = 25515894
--UPDATE dbo.BudgetKP SET IdUserFirst = IdUser WHERE IdShift = @IdShift_2 AND IdUserFirst IS NULL AND SostCbs = 2


SELECT bdg.Id
      ,bdg.IdBudgetKP_CFT
      ,bdg.IdFilial
      ,fil.FilialCode
      ,bdg.IdBudgetHistoryPRK
      ,bdg.SuperBudget
--      ,cln.Id
--      ,cln.Checked
      ,bdg.IdUser
      ,bdg.IdUserFirst
      --,usr.IdDepartment
      --,usr.IdPost
      --,usr.UserName
      --,usr.UserId
      --,usr.MestoCode
      --,usr.IsActive
      ,bdg.BudgetNum
      ,bdg.IdShift
      ,bdg.DtRecord
      ,shf.ReportDate
--      ,cln.Flg2Pin
      ,bdg.Flg2PIN
      ,bdg.TotalSumPRK
      ,bdg.TotalSumKP
--      ,(bdg.TotalSumKP - bdg.TotalSumPRK) AS Razniza
      ,bdg.State
--      ,bdg.StateBis
      ,bdg.WorkType
      ,bdg.SuperQty
      ,bdg.SostCbs
      ,bdg.Ref
      ,bdg.RefDtime
      ,fil.FilialName
--      ,bdg.RefBis
--      ,bdg.RefDtimeBis
      ,bdg.TypeValueKind
      ,bdg.UserToCbs
      ,bdg.DtToCbs
      ,bdg.UserFromCbs
      ,bdg.DtFromCbs
      ,bdg.DtIncome
      ,bdg.DateTransfer
      ,bdg.NumCard
      ,bdg.DtPacketCBS
      ,bdg.Wt_Flag
  FROM dbo.BudgetKP AS bdg (READPAST)
  --INNER JOIN dbo.[User] AS usr (READPAST) ON usr.Id = bdg.IdUser
  --INNER JOIN dbo.Filial AS fil (READPAST) ON fil.Id = bdg.IdFilial
  --INNER JOIN dbo.Client AS cln (READPAST) ON cln.Id = fil.IdClient
  INNER JOIN dbo.Shift AS shf (READPAST) ON shf.Id = bdg.IdShift
  INNER JOIN dbo.View_ClientGroupMax_Filial_Bank AS fil (READPAST) ON fil.IdFilial = bdg.IdFilial --AND fil.IdClnGroupMax = 1
  WHERE bdg.IdShift = @IdShift_3 AND bdg.State < 5 AND bdg.WorkType < '2'--AND bdg.Ref IS NULL --AND LEN(IdBudgetKP_CFT) = 5
  --WHERE bdg.Id = 12863826
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.State < 5 --AND bdg.SostCBS IS NOT NULL
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.WorkType > '0'  --AND (fil.FilialName LIKE '%АШАН%' OR fil.FilialName LIKE '%АТАК%')
  --WHERE bdg.IdShift = @IdShift_3 AND fil.FilialCode IN ('91-6623', '91-9946')
  --WHERE bdg.IdFilial IN (35363, 35365)  --fil.FilialCode = '91-3526'  --bdg.IdFilial = 35365
  --WHERE fil.FilialCode LIKE '%25-2408%' AND MONTH(shf.ReportDate) = 7 AND bdg.BudgetNum LIKE '%M21044%'
  --WHERE fil.FilialCode = '25-6264'
  --WHERE bdg.IdShift = @IdShift_3 AND fil.FilialCode = '25-6260'
  --WHERE bdg.Id = 26530601
  --WHERE bdg.TotalSumKP = 88607.20
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.BudgetNum LIKE '%09-482/92/312%'
  --WHERE bdg.BudgetNum LIKE '%09-502171201%'
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.BudgetNum LIKE '25-6557%'
  --WHERE bdg.Id IN (26957060,26957058)  
  --WHERE bdg.BudgetNum IN ('36167070', '35058537')  --36167070 пин 91-4072; 35058537 пин 91-376
  --WHERE bdg.IdShift = @IdShift_1 AND bdg.BudgetNum IN ('36096036','44178324','115','4','53','48','63','11','116')
  --WHERE bdg.IdShift = @IdShift_3 AND fil.FilialCode LIKE '%91-4415 %'
  --WHERE bdg.IdFilial = 31343
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.SostCBS IS NOT NULL AND bdg.IdUser = 406 --532
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.IdUser = 532  -- AND bdg.SostCBS IS NOT NULL
  --WHERE bdg.Id IN (26522873,26521484)
  --WHERE bdg.IdShift = @IdShift_2 AND bdg.State < 5 AND bdg.WorkType < '2' AND bdg.SostCBS = 2 --AND bdg.SostCBS IS NOT NULL
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.IdUser IS NULL AND bdg.State > 0 --AND bdg.SostCBS IS NULL --AND bdg.Flg2Pin = 0
  --WHERE bdg.IdShift = @IdShift_2 AND fil.FilialName LIKE '%МОСКОВСКИЙ КРЕДИТНЫЙ БАНК%' AND fil.FilialName LIKE '%Shell%' AND NOT fil.FilialName LIKE '%дроп-слот%' --AND bdg.WorkType > 0
  --WHERE fil.FilialName LIKE '%МОСКОВСКИЙ КРЕДИТНЫЙ БАНК%' AND NOT fil.FilialName LIKE '%Shell%' AND NOT fil.FilialName LIKE '%дроп-слот%'
  --WHERE bdg.IdShift = @IdShift_3 AND fil.FilialName LIKE '%Русская телефонная компания%' --AND bdg.State < 4
  --WHERE fil.FilialCode = '09-563' AND bdg.WorkType = '1'
  --WHERE bdg.IdShift = @IdShift_3 AND fil.FilialCode IN ('06-114', '06-115', '06-117')
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.BudgetNum LIKE '%41430481%'
  --WHERE bdg.IdBudgetKP_CFT = '300418310073983'
  --WHERE bdg.SuperBudget = 13024406
  --WHERE SuperBudget IN (8136025,8136022)
  --WHERE bdg.IdShift = 19702 AND fil.FilialName LIKE '%ООО "МК РАЗВИТИЕ"%'  --bdg.BudgetNum IN ('52', '22', '8', '53')
  --WHERE bdg.IdBudgetHistoryPRK = 12863826
  --WHERE bdg.IdBudgetHistoryPRK IN (12893529,12893528,12893527,12893526)
  --WHERE bdg.IdShift = @IdShift_3 AND fil.FilialName LIKE '%МЕТРО Кэш энд Керри%'
  --WHERE fil.FilialName LIKE '%МОСКОВСКИЙ КРЕДИТНЫЙ БАНК%' AND bdg.BudgetNum LIKE '%25-333/361%'
  --WHERE fil.FilialName LIKE '%МООН-Юго-Восток%'
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.State < 5 AND fil.FilialName LIKE '%РН-Москва%' --AND bdg.SuperBudget IN (7528750,7528256)
  --WHERE bdg.IdShift = @IdShift_3 AND (fil.FilialName LIKE '%Агроаспект%' OR fil.FilialName LIKE '%Перекрест%' OR fil.FilialName LIKE '%Копейка%' OR fil.FilialName LIKE '%Альтэкс%' OR fil.FilialName LIKE '%Стройинвест%' OR fil.FilialName LIKE '%ЭЛЕГИЯ%' OR fil.FilialName LIKE '%Е5%' OR fil.FilialName LIKE '%Экспресс Ритейл%' OR fil.FilialName LIKE '%Продмикс%' OR fil.FilialName LIKE '%Дэйли Фудс%' OR fil.FilialName LIKE '%Агроторг%' OR fil.FilialName LIKE '%Карусель%') AND bdg.State < 5 AND bdg.WorkType = '0' --AND YEAR(bdg.DtRecord) = 2018 --AND NOT fil.FilialName LIKE '%МегаФон%'  --AND bdg.SostCbs = 1  --IS NOT NULL
  --WHERE bdg.IdBudgetKP_CFT = '250319110064563'
   ORDER BY bdg.Id DESC
   --ORDER BY bdg.SuperBudget DESC, bdg.BudgetNum DESC
   --ORDER BY bdg.BudgetNum DESC
   --ORDER BY bdg.SuperBudget, bdg.WorkType, bdg.BudgetNum ASC
  
