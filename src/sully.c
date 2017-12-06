int i = 5;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libgen.h>
#include <fcntl.h>
#include <unistd.h>
#define Quine(x) char s[]=#x;x;
#define Main(x) int main(){ if (i > 0) { x } }
Quine(Main(i=(!strstr(basename(__FILE__),"Sully_")?i:i - 1);char filename1[23];sprintf(filename1, "./Sully_%i.c", i);char filename2[23];sprintf(filename2, "./Sully_%i", i); FILE *file=fopen(filename1, "w"); if(file){fprintf(file, "int i = %i;\n#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n#include <libgen.h>\n#include <fcntl.h>\n#include <unistd.h>\n#define Quine(x) char s[]=#x;x;\n#define Main(x) int main(){ if (i > 0) { x } }\nQuine(%s);\n", i, s); fclose(file);char cmd[64]; sprintf(cmd, "clang -Wall -Werror -Wextra %s -o %s", filename1, filename2); system(cmd);system(filename2);}));
