
USE RecountCC

--UPDATE dbo.TSDKasper SET DtBeginInkass = GetDate(), DtEndInkass = GetDate(), DtRecord = GetDate() --WHERE Id IN (349, 348, 289)
--UPDATE dbo.TSDKasper SET DtBeginInkass = GetDate(), DtEndInkass = GetDate(), DtRecord = GetDate() WHERE CONVERT(Char(10), DtRecord, 104) = '07.02.2018' AND InkassType = 1 AND IdRoute = 14
--UPDATE dbo.TSDKasper SET BudgetNum = '23347615' WHERE Id = 348
--UPDATE dbo.TSDKasper SET FlgErr = 0 WHERE CONVERT(Char(10), DtRecord, 104) = '05.02.2018'

--UPDATE dbo.TSDKasper SET QRCode = 'P;'+CONVERT(Char(10),GetDate(),104)+' 10:55'+';'+RTRIM(FilialCode)+';'+RTRIM(BudgetNum)+';%'+RTRIM(FilialCode)+';'+ '@'+'40702810500000002049'+';'+'02'+';'+LTRIM(STR(TotalSum/2, 15, 2))+';%'+RTRIM('36-375')+';'+ '@'+'40821810100000000005'+';'+'11'+';'+LTRIM(STR(TotalSum/2, 15, 2))+';'+'$810'+';' WHERE Id IN (4501,4500,4499,4498,4497,4496)

--UPDATE dbo.TSDKasper SET QRCode = 'P;'+CONVERT(Char(10),GetDate(),104)+' 10:55'+';'+RTRIM(FilialCode)+';'+RTRIM(BudgetNum)+';%'+RTRIM(FilialCode)+';'+ '@'+'30109810955990000001'+';'+'02'+';'+LTRIM(STR(TotalSum, 15, 2))+';'+'$810'+';' WHERE Id IN (3438,3437,3435,3434)

--UPDATE dbo.TSDKasper SET QRCode = 'I;'+CONVERT(Char(10),GetDate(),104)+' 10:55'+';'+RTRIM(FilialCode)+';'+RTRIM(BudgetNum)+';%'+RTRIM(FilialCode)+';'+ '@'+'40702810355990000001'+';'+'02'+';'+LTRIM(STR(1172000.00, 15, 2))+';'+'$810'+';'+'%%'+'84/02;84/04;84/08;84/14;84/15;84/20;84/21;84/26;84/28;84/38;84/47;84/51;84/55;84/57;84/59;84/62;84/63;84/69;84/81;84/82'+';' WHERE Id = 2275

--P;17.02.2018 10:55;36-171;40298695;%36-171;@40702810500000002049;02;30000.00;%36-375;@40821810100000000005;11;30000.00;$810;

--I;13.02.2018 10:55;26-073;84/02;%26-073;@40702810355990000001;02;1172000.00;%%84/02;84/04;84/08;84/14;84/15;84/20;84/21;84/26;84/28;84/38;84/47;84/51;84/55;84/57;84/59;84/62;84/63;84/69;84/81;84/82;

--Эталон
--I;30.12.2019 19:25;47-1110;25230491;%47-1110;@30109810855990000020;02;393000,00;$810;5000,00;43;2;2000,00;12;2;1000,00;141;2;500,00;26;2


SELECT tsd.Id
      ,tsd.X
      ,tsd.Branch
      ,fil.FlgRecalc
      ,fil.SuperSumka
      ,cln.Flg2Pin
      ,tsd.IdRoute
      ,tsd.FilialCode
      ,ISNULL(con.IsJKServe, 1) AS IsJKServe
      ,tsd.BudgetNum
      ,tsd.Nominal
      ,tsd.TotalSum
      ,tsd.InkassType
      ,tsd.TypeValueKind
      ,tsd.RouteDate
      ,tsd.DtBeginInkass AS DateStartInkas
      ,tsd.DtEndInkass AS DateInkas
      ,tsd.DtRecord
      ,tsd.QRCode
      ,cln.Account
      ,cln.IncomeAccount
      ,cln.BuhSymbol
      ,tsd.FlgErr
      ,ink.InkassTypeName
      ,tsd.DtBeginInkass  
      ,tsd.DtEndInkass
      ,tsd.InkassGuid
      ,fil.FilialName
  FROM dbo.TSDKasperView AS tsd
  INNER JOIN dbo.InkassTypeTSD AS ink ON ink.IdInkassType = tsd.InkassType
  INNER JOIN dbo.Filial AS fil ON fil.FilialCode = tsd.FilialCode
  INNER JOIN dbo.Client AS cln ON cln.Id = fil.IdClient
  INNER JOIN ClientGroup AS clg (READPAST) ON clg.Id = cln.IdClientGroup
  INNER JOIN [Contract] AS con (READPAST) ON con.Id = clg.IdContract
  --WHERE shf.Status > 0 AND shf.IdDepartment = 21
  --WHERE tsd.IdRoute = 36 AND tsd.FilialCode = '09-410' AND tsd.InkassType = 6
  --WHERE tsd.InkassType = 7
  --WHERE fil.FlgRecalc = 0 --AND tsd.IdRoute NOT IN (SELECT DISTINCT IdRoute FROM dbo.SecurPack_TRN_UI)  --AND tsd.BudgetNum = '26411601'
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND fil.FlgRecalc = 0 --AND tsd.InkassType = 8 --AND tsd.IdRoute = 36 --AND fil.FlgRecalc = 0
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.InkassType = 8 AND tsd.IdRoute = 30
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.IdRoute = 136 --AND tsd.InkassType IN (1, 8) --AND tsd.FilialCode = '09-410'
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.InkassType = 1 AND CHARINDEX(RTRIM(tsd.FilialCode), tsd.BudgetNum) > 0 AND fil.FilialName LIKE '%АШАН%' --AND tsd.IdRoute = 348
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.InkassType = 1 AND fil.FilialName LIKE '%"МОСКОВСКИЙ КРЕДИТНЫЙ БАНК"%' AND fil.SuperSumka = 1  --AND tsd.IdRoute = 348
  WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.InkassType = 1 AND fil.FlgRecalc = 0 --AND con.IsJKServe = 0 --AND tsd.IdRoute = 16
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' --AND tsd.IdRoute IN (6, 26, 32, 58,34,121, 143, 113, 158)
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.IdRoute = 10 AND tsd.BudgetNum LIKE '%43107043%'
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.BudgetNum LIKE '%36620416%'
  --WHERE tsd.BudgetNum LIKE '%0296843%'
  --WHERE tsd.DtEndInkass IS NULL AND tsd.InkassType = 1  --DtEndInkass  --DtBeginInkass
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.InkassType = 1 AND cln.Flg2Pin = 1  AND fil.FlgRecalc = 1 --AND tsd.IdRoute = 166
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.IdRoute IN (80, 127) --AND tsd.InkassType = 1 AND fil.FlgRecalc = 1
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.X = 1 AND tsd.InkassType = 1
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND DAY(tsd.DtRecord) <> DAY(tsd.DtEndInkass)
  --WHERE tsd.Id IN (2153,2108,2106,2156,2155)
  --WHERE tsd.BudgetNum IN ('38317100', '38317103', '38317104')
  --WHERE CONVERT(Char(10), tsd.RouteDate, 104) = '30.12.2019' AND tsd.FilialCode = '50-1041'
  --WHERE tsd.InkassType = 1
  --ORDER BY tsd.Id DESC
  --ORDER BY tsd.BudgetNum ASC
  --ORDER BY tsd.DtRecord DESC
  --ORDER BY tsd.IdRoute ASC, tsd.DtRecord DESC
  ORDER BY tsd.IdRoute ASC, tsd.FilialCode ASC
  --ORDER BY tsd.IdRoute

--P;19.02.2018 10:55;36-132;40296219;%36-132;@40702810500000002049;02;20834.24;%36-632;@40821810100000000005;11;20834.24;$810;
--P;19.02.2018 10:55;36-121;40287318;%36-121;@40702810500000002049;02;5076.71;%36-375;@40821810100000000099;11;5076.71;$810;
--P;19.02.2018 10:55;48-131;909;%48-131;@40702810500000002049;02;137205.00;%36-375;@40821810100000000005;11;137205.00;$810;


