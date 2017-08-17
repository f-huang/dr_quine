#include <stdio.h>
/*
	1
*/
static void test(const char *s){printf(s,10,10,9,10,10,10,10,10,9,10,10,34,s,34,10);}
int main(){
/*
	2
*/
char s[]="#include <stdio.h>%c/*%c%c1%c*/%cstatic void test(const char *s){printf(s,10,10,9,10,10,10,10,10,9,10,10,34,s,34,10);}%cint main(){%c/*%c%c2%c*/%cchar s[]=%c%s%c;test(s);}%c";test(s);}
