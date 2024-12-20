#include <stdio.h>
#define NL 10
#define TB 9
#define DQ 34
/*
	outside comment
*/
void print() {
	char *s = "#include <stdio.h>%1$c#define NL 10%1$c#define TB 9%1$c#define DQ 34%1$c/*%1$c%2$coutside comment%1$c*/%1$cvoid print() {%1$c%2$cchar *s = %3$c%4$s%3$c;%1$c%2$cprintf(s, NL, TB, DQ, s);%1$c}%1$cint main() {%1$c/*%1$c%2$cinside comment%1$c*/%1$c%2$cprint();%1$c}";
	printf(s, NL, TB, DQ, s);
}
int main() {
/*
	inside comment
*/
	print();
}