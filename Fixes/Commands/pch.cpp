#include "pch.h"

/*
pointer addresses
0090D1D4 - gm status
11 = status 0
5 = status 80
4 = status 64
3 = status 48
2 = status 32
1 = status 16
009144E4 - window id
0091AD40 - npc type id
0091AD44 - npc type
009144F0 - npc icon
022AB7B8 - npc name
*/

/*
message arguments
0F = orange
10 = red
11 = red
12 = yellow
13 = green
14 = purple
15 = light blue
16 = light yellow
posts as notice
17 = white
18 = yellow
post in chat box
19+ = white
0E- = white
*/

//asm hook for new user commands
__declspec(naked) void cmdHook()
{
	_asm 
	{
		push 0x6 //push string length
		push szClose //push cmd string
		push edi
		call cmdChk //check text input
		add esp,0xC
		test eax,eax //test the result
		jne _market
		//gives them the option to close window
		mov dword ptr ds:[0x9144E4],0x0 //close
		jmp cmdJMP
		_market:
		push 0x7
		push szMarket
		push edi
		call cmdChk
		add esp,0xC
		test eax,eax
		jne _keeper
		//fail if a window is already open
		cmp dword ptr ds:[0x9144E4],0x0
		jne _cmdFail
		//use a market npc without items
		mov dword ptr ds:[0x91AD44],0x1 //type
		mov dword ptr ds:[0x91AD40],0x12C //type id
		mov dword ptr ds:[0x9144F0],-0x1 //icon
		mov dword ptr ds:[0x22AB7B8],0x0 //name
		mov dword ptr ds:[0x9144E4],0x65 //market
		jmp cmdJMP
		_keeper:
		push 0xA
		push szKeeper
		push edi
		call cmdChk
		add esp,0xC
		test eax,eax
		jne _repair
		cmp dword ptr ds:[0x9144E4],0x0
		jne _cmdFail
		mov dword ptr ds:[0x91AD44],0x6 //type	
		mov dword ptr ds:[0x91AD40],0x1D //type id
		mov dword ptr ds:[0x9144F0],-0x1 //icon
		mov dword ptr ds:[0x22AB7B8],0x0 //name
		mov dword ptr ds:[0x9144E4],0x67 //warehouse
		jmp cmdJMP
		_repair:
		push 0x7
		push szRepair
		push edi
		call cmdChk
		add esp,0xC
		test eax,eax
		jne _reroll
		cmp dword ptr ds:[0x9144E4],0x0
		jne _cmdFail
		mov dword ptr ds:[0x91AD44],0x3 //type
		mov dword ptr ds:[0x91AD40],0x28 //type id
		mov dword ptr ds:[0x9144F0],-0x1 //icon
		mov dword ptr ds:[0x22AB7B8],0x0 //name
		mov dword ptr ds:[0x9144E4],0x66 //blacksmith
		jmp cmdJMP
		_reroll:
		push 0x9
		push szReroll
		push edi
		call cmdChk
		add esp,0xC
		test eax,eax
		jne _cmdExit
		cmp dword ptr ds:[0x9144E4],0x0
		jne _cmdFail
		mov dword ptr ds:[0x91AD44],0x1 //type
		mov dword ptr ds:[0x91AD40],0xF8 //type id
		mov dword ptr ds:[0x9144F0],-0x1 //icon
		mov dword ptr ds:[0x22AB7B8],0x0 //name
		mov dword ptr ds:[0x9144E4],0x79 //recreation
		jmp cmdJMP
		//original code
		_cmdExit:
		push 0x13D4 // /return line in sysmsg-uni.txt
		jmp cmdRet
		//send a notice
		_cmdFail:
		push 0xC
		push 0x326 //sysmsg-uni.txt line
		push 0x1F //message argument
		call sysMsg //send the notice
		add esp,0xC
		jmp cmdJMP
	}
}

//main function
void cmdFunc() {
	Hook((void*)0x4867A1, cmdHook, 5);
	//automatically max item stack for fast sales
	memcpy((void*)0x42E131, maxCnt, sizeof(maxCnt));
	//ignores a function result (bug workaround)
	memcpy((void*)0x444129, npcJMP, sizeof(npcJMP));
}