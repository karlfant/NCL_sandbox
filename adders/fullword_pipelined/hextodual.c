#include <stdio.h>

int main(void)
{
	char alphadata[16], alphadual[32];
	int k;
	FILE *alpha, *alphaD;
	if((alpha = fopen("sum.hex", "r"))==NULL){
		printf("Error: fopen failed.\n");
	}else{
	alphaD = fopen("sum.dual", "w");
	
		while(fscanf(alpha, "%s ", alphadata) != EOF) {
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
			alphadual[17] = '\n';
			printf("input: '%s'.\n output '%s'.\n", alphadata, alphadual);
			fwrite(alphadual, 18, 1, alphaD);
		}
	}		printf("warning: zero items matched.\n");
}
