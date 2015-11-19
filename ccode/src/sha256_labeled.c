extern void __legup_label(char* label);
/*
 * Author: Shabbir
 * Desc:   The implementation of the sha256 algorithm
 */

#include "sha256.h"
#include <stdio.h>


int main()
{
    BYTE msg[3] = "abc";
    LONG msgLen = 3;
    SHA256(msg,msgLen);
    
    printf("\n");
    for(int i=0; i<DIGESTSIZE;i++){
        printf("%04x",gDigest[i]);
    }
    printf("\n");

    /*
    for(int i=0; i<MAXBLOCKS*BLOCKSIZE;i++){
        printf("%02x", gData[i]);
    }
    printf("\n");
    */

    return 0;
}
