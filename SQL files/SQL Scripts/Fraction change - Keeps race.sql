
select *
into #char
from [PS_GameData].dbo.Chars 
where CharName = 'xxx'  -- Insert Player name between the ' '

select *
into #umg
FROM [PS_GameData].[dbo].[UserMaxGrow] a
where UserUID in (select UserUid from #char)

update a
set a.Country = 0
FROM [PS_GameData].[dbo].[UserMaxGrow] a
	inner join #umg b on b.UserUID = a. UserUID
where b.Country = 1

update a
set a.Country = 1
FROM [PS_GameData].[dbo].[UserMaxGrow] a
	inner join #umg b on b.UserUID = a. UserUID
where b.Country = 0

-- select * from #char
-- select * from #umg

update a
set PosX = 61.100
	,PosY = 1.892
	,Posz = 67.142
	,Map = 42
from [PS_GameData].dbo.Chars a
where a.UserUID in (select UserUID from #char)

/*
select *
from [PS_GameData].dbo.Chars a
where a.UserUID in (select UserUID from #char)
*/

drop table #char
drop table #umg

