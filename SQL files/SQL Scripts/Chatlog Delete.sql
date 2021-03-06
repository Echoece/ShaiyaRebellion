

/* When you run this - the Scripts shows the month deleted and then deletes the chat entries for that month */

SELECT top 1 LEFT(ChatTime,3) as 'ChatlogMonth deleted'
FROM [PS_Chatlog].[dbo].[ChatLog] with (nolock)
order by row asc
go

  
delete 
FROM [PS_Chatlog].[dbo].[ChatLog] 
where	left(ChatTime,3) in (	SELECT top 1 LEFT(ChatTime,3)
								FROM [PS_Chatlog].[dbo].[ChatLog] with (nolock)
								order by row asc
								)
		and left(ChatTime,3) not in (	SELECT top 1 LEFT(ChatTime,3)
										FROM [PS_Chatlog].[dbo].[ChatLog] with (nolock)
										order by row desc
										)
go