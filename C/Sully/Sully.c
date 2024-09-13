#include <stdio.h>
#include <mach-o/dyld.h>
#include <limits.h>
int i = 0;
int main(){
	if(i < 5)
		i += 1;
    return 0;
}