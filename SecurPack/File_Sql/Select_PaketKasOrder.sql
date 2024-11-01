
USE RecountCC

DECLARE @IdShift_1 Int, @IdShift_2 Int, @IdShift_3 Int

--SET @IdShift_1 = 20452
--SET @IdShift_2 = 20458
--SET @IdShift_3 = 30093

SELECT @IdShift_1 = MAX(Id) FROM dbo.Shift (READPAST) WHERE IdDepartment = 2 AND IdPart = 1
SELECT @IdShift_2 = MAX(Id) FROM dbo.Shift (READPAST) WHERE IdDepartment = 2 AND IdPart = 2
SELECT @IdShift_3 = MAX(Id) FROM dbo.Shift (READPAST) WHERE IdDepartment = 2 AND IdPart = 3

--DELETE dbo.PaketKasOrder WHERE Id = 26888904
--DELETE dbo.PaketKasOrder WHERE Id IN (26602114,26602113,26602112,26602111,26602077)
--DELETE dbo.PaketKasOrder WHERE IdShift = 10567 AND State < 5 AND BuhSymbol_eko = '33'

--UPDATE dbo.PaketKasOrder SET IdShift = 21021 WHERE IdShift = 21016 AND State = 4 AND Flg_Bic = 0
--UPDATE dbo.PaketKasOrder SET IdShift = 22436 WHERE Id = 21672236
--UPDATE dbo.PaketKasOrder SET IdShift = 22436 WHERE IdShift = 22423 AND Flg_Bic = 0 AND State = 4
--UPDATE dbo.PaketKasOrder SET Acc20 = '30222810555990004672' WHERE Id = 25453207
--UPDATE dbo.PaketKasOrder SET Acc20 = '30222810955990004861' WHERE Id IN (25532191,25530679,25530682)
--UPDATE dbo.PaketKasOrder SET Flg_Bic = 0 WHERE Id IN (25532191,25530679,25530682)
--UPDATE dbo.PaketKasOrder SET BuhSymbol_eko = '13' WHERE Id = 21672236
--UPDATE dbo.PaketKasOrder SET BuhSymbol_eko = BuhSymbol_cln WHERE Id = 21934611
--UPDATE dbo.PaketKasOrder SET Flg_Bic = 0 WHERE Id = 25449010
--UPDATE dbo.PaketKasOrder SET TotalSumPRK = 1111100.00 WHERE Id = 25752464
--UPDATE dbo.PaketKasOrder SET TotalSumKP = 1111100.00 WHERE Id = 25752464
--UPDATE dbo.PaketKasOrder SET Flg_Bic = 0, File_Name_Txt = '' WHERE Id = 26941966
--UPDATE dbo.PaketKasOrder SET Flg_Bic = 1 WHERE Id IN (25810664,25810662,25810658)
--UPDATE dbo.PaketKasOrder SET Flg_Bic = 0 WHERE IdShift = @IdShift_2 AND State = 4 AND Flg_Bic = 1
--UPDATE dbo.PaketKasOrder SET State = 4, Flg_Bic = 0, Ref = NULL, RefDtime = NULL, File_Name_Dat = '', File_Name_Txt = '' WHERE IdShift = 10492 AND State = 4 AND Flg_Bic = 1
--UPDATE dbo.PaketKasOrder SET State = 4, Flg_Bic = 0, Ref = NULL, RefDtime = NULL, File_Name_Dat = '', File_Name_Txt = '' WHERE Id IN (21937077, 21940894) AND BuhSymbol_eko = '11'
--UPDATE dbo.PaketKasOrder SET State = 4, Flg_Bic = 0, Ref = NULL, RefDtime = NULL, File_Name_Dat = '', File_Name_Txt = '' WHERE Id = 21952608 AND BuhSymbol_eko = '11'
--UPDATE dbo.PaketKasOrder SET State = 5, Flg_Bic = 1, Ref = '', RefDtime = '' WHERE Id IN (21925184, 21927149, 21926147)
--UPDATE dbo.PaketKasOrder SET State = 5, Flg_Bic = 1, Ref = '61-0406-81456', RefDtime = '20190604 08:58:30.000' WHERE Id = 26023361
--UPDATE dbo.PaketKasOrder SET State = 5, Flg_Bic = 1, Ref = '9435527_08-INKH_MIHAYLOVA', RefDtime = '20160923' WHERE Id  = 21952608 AND BuhSymbol_eko = '02'
--UPDATE dbo.PaketKasOrder SET IdBudgetKP_CFT = '3012170100' + RIGHT(RTRIM(LTRIM(STR(Id))), 5) WHERE Id = 22665551
--UPDATE dbo.PaketKasOrder SET IdBudgetKP_CFT = '3012170100' + RIGHT(RTRIM(LTRIM(STR(Id))), 5) WHERE IdShift = @IdShift_3 AND LEN(IdBudgetKP_CFT) = 5


SELECT
       pak.Id
--      ,bdg.Id
      ,pak.IdBudgetKP_CFT
--      ,bdg.IdBudgetKP_CFT
      ,cln.Checked
      ,pak.IdUser
--      ,usr.UserName
      ,pak.IdFilial
      ,pak.FilialCode
--      ,fil.FilialName
      ,pak.IdOperDate
      ,pak.IdShift
      ,shf.ReportDate
      ,pak.DtRecord
      ,pak.BudgetNum
      ,pak.TotalSumPRK
      ,pak.TotalSumKP
      ,pak.TotalSum_Minus
      ,pak.TotalSum_Plus
      ,pak.TotalSum_Falh
      ,pak.Mst_Colvo
--      ,bdg.Flg2PIN
      ,pak.Flg_Bic
      ,pak.Flg_Kontrol
--      ,bdg.State
      ,pak.State
      ,pak.OrderNumCFT
      ,pak.Ref
      ,pak.RefDtime
      ,pak.Acc20
      ,pak.LizNumCln
      ,pak.BuhSymbol_cln
      ,pak.BuhSymbol_eko
      ,pak.Comment
      ,pak.Comment1
      ,pak.Comment2
      ,pak.Comment3
      ,pak.DateTransfer
      ,pak.INNCln
      ,pak.RegCertNum
      ,pak.RedCertDate
      ,pak.Fio_Kontroler
      ,pak.Pass_Type
      ,pak.Pass_numer
      ,pak.Pass_data
      ,pak.Pass_mesto
      ,pak.File_Name_Txt
  FROM dbo.PaketKasOrder AS pak (READPAST)
  LEFT OUTER JOIN dbo.BudgetKP AS bdg (READPAST) ON pak.Id = bdg.Id
  INNER JOIN dbo.Filial AS fil (READPAST) ON fil.Id = pak.IdFilial
  INNER JOIN dbo.Client AS cln (READPAST) ON cln.Id = fil.IdClient
  INNER JOIN dbo.Shift AS shf (READPAST) ON shf.Id = pak.IdShift
  --INNER JOIN dbo.[User] AS usr (READPAST) ON usr.Id = pak.IdUser
  --INNER JOIN dbo.View_ClientGroupMax_Filial_Bank AS fil (READPAST) ON fil.IdFilial = pak.IdFilial --AND fil.IdClnGroupMax = 1
  WHERE pak.IdShift = @IdShift_3 AND pak.State < 5 AND pak.TotalSumKP > 0.00 --AND pak.Ref IS NULL --pak.Flg_Bic = 0 --AND pak.Comment LIKE '%РН-Москва%'
  --WHERE pak.IdShift = @IdShift_3 AND pak.State = 5 AND pak.TotalSumKP > 0.00 --AND pak.Acc20 = '30109810855990000020'
  --WHERE pak.IdShift = @IdShift_3 AND pak.State = 5 AND pak.TotalSumKP > 0.00 AND pak.BuhSymbol_eko = '33'
  --WHERE cln.ClientName LIKE '%Вейкар%'
  --WHERE pak.IdFilial IN (35363, 35365)  --pak.FilialCode = '91-3526'  --pak.IdFilial = 35365
  --WHERE pak.IdShift = @IdShift_1 AND pak.BudgetNum IN ('36096036','44178324','115','4','53','48','63','11','116')
  --WHERE bdg.IdShift = @IdShift_3 AND bdg.Id IN (24931949,24931683,24931681)
  --WHERE pak.IdShift = @IdShift_3 AND fil.FilialName LIKE '%МОСКОВСКИЙ КРЕДИТНЫЙ БАНК%' AND pak.State < 5
  --WHERE pak.IdShift = @IdShift_3 AND pak.Flg_Bic = 1 AND pak.State = 4
  --WHERE pak.IdShift = @IdShift_3 AND pak.Flg_Bic = 0 AND pak.State = 4
  --WHERE pak.IdShift = @IdShift_3 AND pak.FilialCode = '09-412'
  --WHERE pak.IdShift = @IdShift_3 AND pak.Ref IS NULL
  --WHERE pak.BudgetNum LIKE '%44043411%'
  --WHERE pak.BudgetNum IN ('44043411', '37382645')
  --WHERE pak.IdFilial IN (35362,35364,35366)
  --WHERE pak.FilialCode IN ('91-3523', '91-3527', '91-3519')
  --WHERE pak.FilialCode = '90-2495'
  --WHERE LEN(pak.FilialCode) > 7
  --WHERE pak.Id IN (26888175,26888178,26888177,26888176)
  --WHERE pak.Id = 27018679
  --WHERE fil.FilialName LIKE '%ООО "АПТЕКА-А.в.е"%' --AND LEFT(Acc20, 5) = '40702'  --20208
  --WHERE fil.FilialName LIKE '%МОСКЛИРИНГЦЕНТР%'
  --WHERE pak.Acc20 = pak.LizNumCln
  --WHERE pak.IdShift = @IdShift_3 AND pak.Comment LIKE '%МЕТРО Кэш энд Керри%'
  --WHERE pak.IdShift = @IdShift_3 AND pak.FilialCode LIKE '%11-11-384%'
  --WHERE pak.FilialCode LIKE '%11-11-384%'
  --WHERE pak.IdShift = @IdShift_3 AND pak.BudgetNum = '43561295'
  --WHERE pak.IdShift = @IdShift_3 AND fil.FilialName LIKE '%РН-Москва%' AND pak.State < 5 --AND pak.Id >= 21520761
  --WHERE LEFT(pak.Acc20, 5) = '20208'
  --WHERE pak.IdBudgetKP_CFT = '290319110086694'
  --WHERE fil.FilialCode IN ('06-023', '06-024', '06-026')
  --WHERE fil.FilialCode = '97-614' --AND bdg.WorkType = '1'
  --WHERE pak.BudgetNum IN ('30183340', '30070728', '30193272', '30190727') --AND pak.State < 5 
  --WHERE pak.IdShift = @IdShift_3 AND pak.BudgetNum IN ('24984709', '3152', 'AA039194', '24923528') AND pak.State <= 5  --AND BuhSymbol_eko = '11'
  --WHERE pak.BuhSymbol_eko <> pak.BuhSymbol_cln AND pak.State = 4
  --WHERE pak.IdShift = @IdShift_3 AND pak.BudgetNum LIKE '%25099837%'
  --WHERE pak.BudgetNum LIKE '%06-060%'
  --WHERE pak.IdShift = @IdShift_3 AND pak.Comment LIKE '%МЕТРО%'
  --WHERE pak.IdShift = @IdShift_3 AND pak.State = 4 AND pak.Flg_Bic = 0 AND (fil.FilialName LIKE '%Агроаспект%' OR fil.FilialName LIKE '%Перекрест%' OR fil.FilialName LIKE '%Копейка%' OR fil.FilialName LIKE '%Альтэкс%' OR fil.FilialName LIKE '%Стройинвест%' OR fil.FilialName LIKE '%ЭЛЕГИЯ%' OR fil.FilialName LIKE '%Е5%' OR fil.FilialName LIKE '%Экспресс Ритейл%' OR fil.FilialName LIKE '%Продмикс%' OR fil.FilialName LIKE '%Дэйли Фудс%' OR fil.FilialName LIKE '%Агроторг%' OR fil.FilialName LIKE '%Карусель%') AND fil.FilialName NOT LIKE '%МегаФон%'
  --WHERE pak.File_Name_Txt = 'formdoc_110319_085257_приход_11.txt'
  --WHERE pak.IdBudgetKP_CFT = '250319110064563'
  --ORDER BY pak.RefDtime DESC
  --ORDER BY pak.DtRecord DESC
  --ORDER BY pak.FilialCode ASC, pak.IdShift DESC
  --ORDER BY pak.File_Name_Txt ASC 
  ORDER BY pak.Id DESC

--WHERE pak.IdShift = @IdShift_2 AND pak.State < 5 AND pak.Id NOT IN (SELECT Id FROM BudgetKP (READPAST))

