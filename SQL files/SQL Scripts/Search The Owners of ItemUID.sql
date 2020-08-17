SELECT
   UserUID
   ,UserID
   ,c.CharID
   ,CharName
   ,Level
   ,Family
   ,Job
   ,Type
   ,TypeID
   ,Bag
   ,Count
   ,ItemUID
   ,Craftname
   ,Maketime
   ,LoginStatus
FROM [PS_GameData].[dbo].[CharItems] m
inner join [PS_GameData].[dbo].[Chars] c
on m.[CharID] = c.[CharID]
     WHERE 
     ItemUID in ( SELECT
     ItemUID
     FROM 
     PS_GameData.dbo.CharItems
     where 
     ItemUID= 'xxxx') -- ItemUID here in ''
GROUP BY
    UserUID
   ,UserID
   ,c.CharID
   ,CharName
   ,Level
   ,Family
   ,Job
   ,Type
   ,TypeID
   ,Bag
   ,Count
   ,ItemUID
   ,Craftname
   ,Maketime
   ,LoginStatus