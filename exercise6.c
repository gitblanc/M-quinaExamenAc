#include <stdio.h>
#include <string.h>

int main()
{
	int  number = 5;
	int *varP = NULL;
	*varP = 5;
	memcpy(varP, &number, sizeof(int) );
	printf("P: %ld\n", (long) varP);
}

