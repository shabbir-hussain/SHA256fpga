/*
 * Author: Shabbir
 * Desc:   The implementation of the sha256 algorithm
 */

#include "sha256.h"
#include <stdio.h>


int main()
{
    BYTE msg[5] = {0x68, 0X65, 0X6c, 0X6c, 0x6f};
    LONG msgLen = 0x0000000000000005;
    SHA256(msg,msgLen);
    
    for(int i=0; i<DIGESTSIZE;i++){
        printf("%04x",gDigest[i]);
    }
    printf("\n");

    return 0;
}
