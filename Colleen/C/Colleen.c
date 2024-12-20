#include <stdio.h>
/*
	outside comment
*/
void	print()
{
	char*s="#include <stdio.h>%c/*%c%coutside comment%c*/%cvoid%cprint()%c{%c%cchar*s=%c%s%c;%c%cprintf(s,10,10,9,10,10,9,10,10,9,34,s,34,10,9,10,10,9,9,10,10,10,9,10,10,9,10);%c}%cint%c%cmain()%c{%c/*%c%cinside comment%c*/%c%cprint();%c}";
	printf(s,10,10,9,10,10,9,10,10,9,34,s,34,10,9,10,10,9,9,10,10,10,9,10,10,9,10);
}
int		main()
{
/*
	inside comment
*/
	print();
}