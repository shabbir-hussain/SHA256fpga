/*
 * Author :Shabbir Hussain
 * Description: This is a self -contained implementation of the SHA-256 Algorithm
 */

#include "stdint.h"

// CONSTANTS
#define MAXBLOCKS 3
#define BLOCKSIZE 64 //64 Bytes in 512 bits
#define DIGESTSIZE 256

typedef uint8_t BYTE;
typedef uint32_t WORD;
typedef uint64_t LONG;

static const WORD k[64] = {
        0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
        0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
        0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
        0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
        0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
        0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
        0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
        0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
};

//HELPER FUNCTIONS
int pad (BYTE* data, BYTE* msg, LONG msgLen){

    //put msg in buffer
    int i=0;
    while(i<msgLen){
        data[i] = msg[i];
        i++;
    }

    //append pad
    data[i] = 0x80;
    i++;
    
    //add extrapad
    while(i%(488/8)!=0){
        data[i]=0x00;
        i++;
    }

    //append size
    data[i-2] = msgLen & 0xFFFFFFFF00000000;
    data[i-1] = msgLen & 0x00000000FFFFFFFF;
    
    int numBlocks = i/BLOCKSIZE;
    return numBlocks;
}

void outerloop(BYTE* digest, BYTE* data, int numBlocks){

    //init variables
    WORD h0,h2,h3,h4,h5,h6,h7;
    WORD a,b,c,d,e,f,g,h;

    h0 = 0x6a09e667;
    h1 = 0xbb67ae85;
    h2 = 0x3c6ef372;
    h3 = 0xa54ff53a;
    h4 = 0x510e527f;
    h5 = 0x9b05688c;
    h6 = 0x1f83d9ab;
    h7 = 0x5be0cd19;

    for(int i=0;i<numBlocks){
        
    }
}

BYTE gData[MAXBLOCKS*BLOCKSIZE];
BYTE gDigest[BLOCKSIZE];

//HASHING FUNCTION
void SHA256(BYTE* msg, LONG msgLen){

    //Pad the msg
    int numBlocks = pad(gData,msg,msgLen);
    
    outerloop(gDigest,data,numBlocks);

}
