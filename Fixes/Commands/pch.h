#ifndef PCH_H
#define PCH_H

#define WIN32_LEAN_AND_MEAN 
#include <windows.h>
//main function
void cmdFunc();
//hook function
BOOL Hook(void * pAddr, void * pNAddr, int len = 5);
//variables and game.exe addresses
DWORD cmdChk = 0x632D07;
DWORD cmdRet = 0x4867A6;
DWORD cmdJMP = 0x487532;
DWORD sysMsg = 0x423150;
LPCSTR szClose = "/close";
LPCSTR szMarket = "/market";
LPCSTR szKeeper = "/warehouse";
LPCSTR szRepair = "/repair";
LPCSTR szReroll = "/recreate";
unsigned char maxCnt[] = { 0x90, 0x90 };
unsigned char npcJMP[] = { 0xEB, 0x05 };

#endif