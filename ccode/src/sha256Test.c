/*
 * Author: Shabbir
 * Desc:   The implementation of the sha256 algorithm
 */

#include "sha256.h"
#include <stdio.h>


int main()
{
    BYTE msg[4] = {0x12, 0X34, 0X56, 0X78};
    LONG msgLen = 0x0000000000000004;
    SHA256(msg,msgLen);
    
    for(int i=0; i<MAXBLOCKS*BLOCKSIZE;i++){
        printf("%02x",digest[i]);
    }

    return 0;
}
