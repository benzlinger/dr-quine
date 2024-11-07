#include <stdio.h>
#include <stdlib.h>
#define GET_NAME(buf, name) snprintf(buf, sizeof(buf), name, count);
#define BUILD_CMD(buf, cmd, arg1, arg2) snprintf(buf, sizeof(buf), cmd, arg1, arg2);
#define NL 10
#define TB 9
#define DQ 34

int main()
{
	int count = 5;
	char fname[10]; char ename[7]; char comp_cmd[80]; char exec_cmd[80];
	#ifdef POG
		count--;
	#endif
	GET_NAME(fname, "Sully_%d.c");
	GET_NAME(ename, "Sully%d");
	FILE *c_file = fopen(fname, "w");
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#define GET_NAME(buf, name) snprintf(buf, sizeof(buf), name, count);%1$c#define BUILD_CMD(buf, cmd, arg1, arg2) snprintf(buf, sizeof(buf), cmd, arg1, arg2);%1$c#define NL 10%1$c#define TB 9%1$c#define DQ 34%1$c%1$cint main()%1$c{%1$c%2$cint count = %4$d;%1$c%2$cchar fname[10]; char ename[7]; char comp_cmd[80]; char exec_cmd[80];%1$c%2$c#ifdef POG%1$c%2$c%2$ccount--;%1$c%2$c#endif%1$c%2$cGET_NAME(fname, %3$cSully_%%d.c%3$c);%1$c%2$cGET_NAME(ename, %3$cSully%%d%3$c);%1$c%2$cFILE *c_file = fopen(fname, %3$cw%3$c);%1$c%2$cchar *s = %3$c%5$s%3$c;%1$c%2$cfprintf(c_file, s, NL, TB, DQ, count, s);%1$c%2$cfclose(c_file);%1$c%2$cBUILD_CMD(comp_cmd, %3$cgcc -D POG -Wall -Wextra -Werror %%s -o %%s%3$c, fname, ename);%1$c%2$csystem(comp_cmd);%1$c%2$cBUILD_CMD(exec_cmd, %3$c./%%s%3$c, ename, NULL);%1$c%2$cif (count <= 0) return(0);%1$c%2$csystem(exec_cmd);%1$c}";
	fprintf(c_file, s, NL, TB, DQ, count, s);
	fclose(c_file);
	BUILD_CMD(comp_cmd, "gcc -D POG -Wall -Wextra -Werror %s -o %s", fname, ename);
	system(comp_cmd);
	BUILD_CMD(exec_cmd, "./%s", ename, NULL);
	if (count <= 0) return(0);
	system(exec_cmd);
}