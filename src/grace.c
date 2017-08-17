#include <stdio.h>
#define DEST "Grace_kid.c"
#define Quine(x) char s[]=#x;x;
#define FT(x)int main(){x}
/*
	1
*/
Quine(FT(FILE *file=fopen(DEST,"w");if (file){fprintf(file,"#include <stdio.h>\n#define DEST \"Grace_kid.c\"\n#define Quine(x) char s[]=#x;x;\n#define FT(x)int main(){x}\n/*\n\t1\n*/\nQuine(%s);\n",s);fclose(file);}));
