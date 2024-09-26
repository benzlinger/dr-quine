#include <stdio.h>
#include <string.h>
#include <unistd.h>
int main() {
	int count = 5; char str1[10] = "Sully_"; char str2[2]; char *str3 = ".c";
	if (count <= 0) return(0);
	sprintf(str2, "%d", count);
	strcat(str1, str2);
	strcat(str1, str3);
	FILE *newFile = fopen(str1, "w");
	char *s = "#include <stdio.h>%c#include <string.h>%c#include <unistd.h>%cint main() {%c%cint count = %d; char str1[10] = %cSully_%c; char str2[2]; char *str3 = %c.c%c;%c%cif (count <= 0) return(0);%c%csprintf(str2, %c%c%c%c, count);%c%cstrcat(str1, str2);%c%cstrcat(str1, str3);%c%cFILE *newFile = fopen(str1, %cw%c);%c%cchar *s = %c%s%c;%c%cfprintf(newFile, s, 10, 10, 10, 10, 9, count - 1, 34, 34, 34, 34, 10, 9, 10, 9, 34, 37, 100, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9,   10, 9, 34, 37, 100, 34, 10, 9, 34, 34, 34, 34, 34, 34, 10, 9, 10, 9, 10);%c%cfclose(newFile);%c%cchar *cmd = %c/usr/bin/gcc%c;%c%cchar arg[10];%c%csprintf(arg, %cSully_%c%c.c%c, count -1);%c%cchar *args[] = {%cgcc%c, arg, %c-o%c, %cb.out%c, NULL};%c%cchar *env[] = { NULL };%c%cexecve(cmd, args, env);%c}";
	fprintf(newFile, s, 10, 10, 10, 10, 9, count - 1, 34, 34, 34, 34, 10, 9, 10, 9, 34, 37, 100, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9,   10, 9, 34, 37, 100, 34, 10, 9, 34, 34, 34, 34, 34, 34, 10, 9, 10, 9, 10);
	fclose(newFile);
	char *cmd = "/usr/bin/gcc";
	char arg[10];
	sprintf(arg, "Sully_%d.c", count -1);
	char *args[] = {"gcc", arg, "-o", "b.out", NULL};
	char *env[] = { NULL };
	execve(cmd, args, env);
}