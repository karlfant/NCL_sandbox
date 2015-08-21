#include <stdio.h>

int main(void)
{
	char alphadata[16], alphadual[33][3], alphaout[2];
	int k, j;
	FILE *alpha;
	FILE *alphaD0, *alphaD1, *alphaD2, *alphaD3, *alphaD4, *alphaD5, *alphaD6, *alphaD7, *alphaD8, *alphaD9, *alphaD10, *alphaD11, *alphaD12, *alphaD13, *alphaD14, *alphaD15;
	FILE *alphaD16, *alphaD17, *alphaD18, *alphaD19, *alphaD20, *alphaD21, *alphaD22, *alphaD23, *alphaD24, *alphaD25, *alphaD26, *alphaD27, *alphaD28, *alphaD29, *alphaD30, *alphaD31;
	if((alpha = fopen("beta.hex", "r"))==NULL){
		printf("Error: fopen failed.\n");
	}else{
		alphaD0 = fopen("B0.dual", "w");
		alphaD1 = fopen("B1.dual", "w");
		alphaD2 = fopen("B2.dual", "w");
		alphaD3 = fopen("B3.dual", "w");
		alphaD4 = fopen("B4.dual", "w");
		alphaD5 = fopen("B5.dual", "w");
		alphaD6 = fopen("B6.dual", "w");
		alphaD7 = fopen("B7.dual", "w");
		alphaD8 = fopen("B8.dual", "w");
		alphaD9 = fopen("B9.dual", "w");
		alphaD10 = fopen("B10.dual", "w");
		alphaD11 = fopen("B11.dual", "w");
		alphaD12 = fopen("B12.dual", "w");
		alphaD13 = fopen("B13.dual", "w");
		alphaD14 = fopen("B14.dual", "w");
		alphaD15 = fopen("B15.dual", "w");
		alphaD16 = fopen("B16.dual", "w");
		alphaD17 = fopen("B17.dual", "w");
		alphaD18 = fopen("B18.dual", "w");
		alphaD19 = fopen("B19.dual", "w");
		alphaD20 = fopen("B20.dual", "w");
		alphaD21 = fopen("B21.dual", "w");
		alphaD22 = fopen("B22.dual", "w");
		alphaD23 = fopen("B23.dual", "w");
		alphaD24 = fopen("B24.dual", "w");
		alphaD25 = fopen("B25.dual", "w");
		alphaD26 = fopen("B26.dual", "w");
		alphaD27 = fopen("B27.dual", "w");
		alphaD28 = fopen("B28.dual", "w");
		alphaD29 = fopen("B29.dual", "w");
		alphaD30 = fopen("B30.dual", "w");
		alphaD31 = fopen("B31.dual", "w");
	
		while(fscanf(alpha, "%s ", alphadata) != EOF) {
			for (k=0; k<8; k++){
			switch (alphadata[k]){
				case '0': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '1'; break;
				case '1': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '2'; break;
				case '2': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '1'; break;
				case '3': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '2'; break;
				case '4': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '1'; break;
				case '5': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '2'; break;
				case '6': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '1'; break;
				case '7': alphadual[4*k][0] = '1';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '2'; break;
				case '8': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '1'; break;
				case '9': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '2'; break;
				case 'a': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '1'; break;
				case 'b': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '1'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '2'; break;
				case 'c': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '1'; break;
				case 'd': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '1';alphadual[4*k+3][0] = '2'; break;
				case 'e': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '1'; break;
				case 'f': alphadual[4*k][0] = '2';alphadual[4*k+1][0] = '2'; alphadual[4*k+2][0] = '2';alphadual[4*k+3][0] = '2'; break;
			}
			}
			for (j=0; j<32; j++){
				alphadual[j][1] = '\n';
				alphadual[j][2] = '\0';
			}
			int check;
			check = 2;
			fwrite(alphadual[31], 2, 1, alphaD0);
			fwrite(alphadual[30], 2, 1, alphaD1);
			fwrite(alphadual[29], 2, 1, alphaD2);
			fwrite(alphadual[28], 2, 1, alphaD3);
			fwrite(alphadual[27], 2, 1, alphaD4);
			fwrite(alphadual[26], 2, 1, alphaD5);
			fwrite(alphadual[25], 2, 1, alphaD6);
			fwrite(alphadual[24], 2, 1, alphaD7);
			fwrite(alphadual[23], 2, 1, alphaD8);
			fwrite(alphadual[22], 2, 1, alphaD9);
			fwrite(alphadual[21], 2, 1, alphaD10);
			fwrite(alphadual[20], 2, 1, alphaD11);
			fwrite(alphadual[19], 2, 1, alphaD12);
			fwrite(alphadual[18], 2, 1, alphaD13);
			fwrite(alphadual[17], 2, 1, alphaD14);
			fwrite(alphadual[16], 2, 1, alphaD15);
			fwrite(alphadual[15], 2, 1, alphaD16);
			fwrite(alphadual[14], 2, 1, alphaD17);
			fwrite(alphadual[13], 2, 1, alphaD18);
			fwrite(alphadual[12], 2, 1, alphaD19);
			fwrite(alphadual[11], 2, 1, alphaD20);
			fwrite(alphadual[10], 2, 1, alphaD21);
			fwrite(alphadual[9], 2, 1, alphaD22);
			fwrite(alphadual[8], 2, 1, alphaD23);
			fwrite(alphadual[7], 2, 1, alphaD24);
			fwrite(alphadual[6], 2, 1, alphaD25);
			fwrite(alphadual[5], 2, 1, alphaD26);
			fwrite(alphadual[4], 2, 1, alphaD27);
			fwrite(alphadual[3], 2, 1, alphaD28);
			fwrite(alphadual[2], 2, 1, alphaD29);
			fwrite(alphadual[1], 2, 1, alphaD30);
			fwrite(alphadual[0], 2, 1, alphaD31);
	}
	}
		printf("warning: zero items matched.\n");
}
