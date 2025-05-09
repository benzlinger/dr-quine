#include <stdio.h>
/*
	outside comment
*/
void print() {
	char *s = "#include <stdio.h>%2$c/*%2$c%1$coutside comment%2$c*/%2$cvoid print() {%2$c%1$cchar *s = %3$c%4$s%3$c;%2$c%1$cprintf(s, 9, 10, 34, s);%2$c}%2$cint main() {%2$c/*%2$c%1$cinside comment%2$c*/%2$c%1$cprint();%2$c}";
	printf(s, 9, 10, 34, s);
}
int main() {
/*
	inside comment
*/
	print();
}