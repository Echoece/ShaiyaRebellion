/*	This script fucks up the peoples payout if they broke your law but sold anyway 
	That also means it takes money out of the game	*/
update a
set a.ReturnMoney = 40000000
-- SELECT *
FROM [PS_GameData].[dbo].[MarketCharResultMoney] a
where MarketID in (	SELECT 
	m.MarketID
FROM [PS_GameData].[dbo].[Market] m
	inner join PS_GameData.dbo._CreatedChars c
		on m.[CharID] = c.[CharID]
	inner join [PS_GameData].[dbo].[MarketItems] mi
		on m.MarketID = mi.MarketID
where 
	right(mi.Craftname,2) in ('00','') 
	and mi.Gem1 = 0
	and mi.Gem2 = 0
	and mi.Gem3 = 0
	and mi.Gem4 = 0
	and mi.Gem5 = 0
	and mi.Gem6 = 0
	and cast(m.MinMoney as float) > 150000000 * cast (mi.Count as float)
						)
Go

/* This Script changes stuff for sale */

update a
set MinMoney = 40000000
	,DirectMoney = 40000000
--	,TenderMoney = 40000000
--	SELECT *
FROM [PS_GameData].[dbo].[Market] a
where MarketID in (	SELECT 
						m.MarketID
					FROM [PS_GameData].[dbo].[Market] m
						inner join PS_GameData.dbo._CreatedChars c
							on m.[CharID] = c.[CharID]
						inner join [PS_GameData].[dbo].[MarketItems] mi
							on m.MarketID = mi.MarketID
					where 
						right(mi.Craftname,2) in ('00','') 
						and mi.Gem1 = 0
						and mi.Gem2 = 0
						and mi.Gem3 = 0
						and mi.Gem4 = 0
						and mi.Gem5 = 0
						and mi.Gem6 = 0
						and cast(m.MinMoney as float) > 150000000 * cast (mi.Count as float)
						)
Go