#include <stdio.h>

int main(void)
{
	unsigned int alphadata, betadata;
	
	char prodhex[10];
	int k;
	unsigned int numA, numB;
	unsigned int intA, intB, prod;
	FILE *alpha;
	if((alpha = fopen("alpha.hex", "r"))==NULL){
		printf("Error: fopen failed.\n");
	}		
		FILE *beta;
		if((beta = fopen("beta.hex", "r"))==NULL){
			printf("Error: fopen failed.\n");
		}
					FILE *prodD;
					prodD = fopen("shift.hex", "w");

		while(fscanf(alpha, "%x ", &alphadata) != EOF) {
			(fscanf(beta, "%x ", &betadata));
			numA = alphadata;
			numB = betadata;
			intA = numA;
			intB = numB;
//			intA = intA & 0xff;
			intB = intB & 0x10;
			prod = intA << intB;
			printf("input: '%x'. '%d'. output '%x'.\n", intA, intB, prod);
			sprintf(prodhex, "%08x", prod); 
			prodhex[8] = '\n';
			prodhex[9] = '\0';
			fwrite(&prodhex, 9, 1, prodD);
		}
		printf("warning: zero items matched.\n");
}

