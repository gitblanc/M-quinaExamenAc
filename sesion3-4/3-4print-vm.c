#include <stdio.h>

#include "3-4print-pte.h"

int main(void)
{
//Este fichero simplemente utiliza la función print_virtual_physical_pte() para imprimir la información
// de una dirección virtual. El prototipo de esta función está en 3-4print-pte.h y su implementación
// en 3-4print-pte.c
	int local = 0xABCDEF01;

	print_virtual_physical_pte(&local, "Local variable\n-----------------");

	printf("\n---- Press [ENTER] to continue");
	getchar();

	return 0;
}
