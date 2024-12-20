#include <stdio.h>
#define NL 10
#define TB 9
#define GRACE() int main(){freopen("Grace_kid.c", "w", stdout);char *s = "#include <stdio.h>%1$c#define NL 10%1$c#define TB 9%1$c#define GRACE() int main(){freopen(%3$cGrace_kid.c%3$c, %3$cw%3$c, stdout);char *s = %3$c%4$s%3$c;printf(s, NL, TB, 34, s);}%1$c/*%1$c%2$ccomment%1$c*/%1$cGRACE()";printf(s, NL, TB, 34, s);}
/*
	comment
*/
GRACE()