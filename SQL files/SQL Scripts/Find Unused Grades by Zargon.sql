create table #a (num int)
declare @i int
set @i=0
while @i < 999
begin
 set @i=@i+1
 if not exists (select * from ps_gamedefs.dbo.items where grade = @i)
 insert #a select @i
end
select * from #a