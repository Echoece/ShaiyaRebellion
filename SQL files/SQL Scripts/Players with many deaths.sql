SELECT 
	um.UserID
	,um.UserUID
	,um.UserIp
	,um.Status as 'Account Status'
	,c.CharID
	,c.CharName
	,c.Level
	,c.K1 as 'Kills'
	,c.K2 as 'Deaths'
--	select um.*
FROM 
	[PS_GameData].[dbo].[Chars] c with (nolock)
	inner join PS_UserData.dbo.Users_Master um with (nolock)
		on um.UserUID = c.UserUID
where 
	K2 > 300 -- change how many death your looking for this is 300+
order by 
	K2 desc