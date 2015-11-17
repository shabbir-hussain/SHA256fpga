/*
 * compile with:
 * cc test.c -lcrypto
 */
#include <openssl/sha.h>
#include <stdio.h>
int main(int argc, char **argv)
{
	unsigned char buffer[BUFSIZ];
	SHA256_CTX ctx;
	size_t len;

    buffer[0] = 0x61;
    buffer[1] = 0x62;
    buffer[2] = 0x63;

    len =3;

	SHA256_Init(&ctx);
	do {
		SHA256_Update(&ctx, buffer, len);
	} while (len == BUFSIZ);
	SHA256_Final(buffer, &ctx);
	for (len = 0; len < SHA256_DIGEST_LENGTH; ++len)
		printf("%02x", buffer[len]);
	putchar('\n');
	return 0;
}
