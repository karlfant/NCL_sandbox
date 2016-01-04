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
					prodD = fopen("produns.hex", "w");

		while(fscanf(alpha, "%x ", &alphadata) != EOF) {
			(fscanf(beta, "%x ", &betadata));
			numA = alphadata;
			numB = betadata;
			intA = numA;
			intB = numB;
			intA = intA & 0xff;
			intB = intB & 0xff;
			prod = intA * intB;
			printf("input: '%d'. '%d'. output '%d'.\n", intA, intB, prod);
			sprintf(prodhex, "%08x", prod); 
			prodhex[8] = '\n';
			prodhex[9] = '\0';
			fwrite(&prodhex, 9, 1, prodD);
		}
		printf("warning: zero items matched.\n");
}

/*
 sprintf(filename, "A%d.dual", i); 

			for (k=0; k<8; k++){
			switch (alphadata[k]){
				case '0': alphadual[2*k] = '5';alphadual[2*k+1] = '5'; break;
			case '1': alphadual[2*k] = '5';alphadual[2*k+1] = '6'; break;
			case '2': alphadual[2*k] = '5';alphadual[2*k+1] = '9'; break;
			case '3': alphadual[2*k] = '5';alphadual[2*k+1] = 'a'; break;
			case '4': alphadual[2*k] = '6';alphadual[2*k+1] = '5'; break;
			case '5': alphadual[2*k] = '6';alphadual[2*k+1] = '6'; break;
			case '6': alphadual[2*k] = '6';alphadual[2*k+1] = '9'; break;
			case '7': alphadual[2*k] = '6';alphadual[2*k+1] = 'a'; break;
			case '8': alphadual[2*k] = '9';alphadual[2*k+1] = '5'; break;
			case '9': alphadual[2*k] = '9';alphadual[2*k+1] = '6'; break;
			case 'a': alphadual[2*k] = '9';alphadual[2*k+1] = '9'; break;
			case 'b': alphadual[2*k] = '9';alphadual[2*k+1] = 'a'; break;
			case 'c': alphadual[2*k] = 'a';alphadual[2*k+1] = '5'; break;
			case 'd': alphadual[2*k] = 'a';alphadual[2*k+1] = '6'; break;
			case 'e': alphadual[2*k] = 'a';alphadual[2*k+1] = '9'; break;
			case 'f': alphadual[2*k] = 'a';alphadual[2*k+1] = 'a'; break;
			}
			}
else{
*/