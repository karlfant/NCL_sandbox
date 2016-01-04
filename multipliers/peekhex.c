#include <stdio.h>

int main(void)
{
	int alphadata, betadata;
	
	char prodhex[10];
	int k;
	signed int numA, numB;
	signed int intA, intB, prod;
	FILE *alpha;
	if((alpha = fopen("prod.hex", "r"))==NULL){
		printf("Error: fopen failed.\n");
	}		

		while(fscanf(alpha, "%x ", &alphadata) != EOF) {
//			numA = alphadata;
			printf("input: '%d'\n", alphadata);
		}
		printf("warning: zero items matched.\n");
}

