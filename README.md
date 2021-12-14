# Most important commands

## ---Cache config---
-Tamaño de la palabra de memoria = 8 bits (ancho de palabra)

-Número de bits de direcciones de memoria = 12 (2^12 KiB tamaño)

-Caché unificada (un solo nivel)

-Número de bloques de caché = 16

-Número de palabras por bloque = 4 (memoria principal)

-Correspondencia asociativa por conjuntos de 16 vías

-Algoritmo de reemplazo LRU

-Algoritmo de escritura write-back

-Bit D a 1 -> reemplazo memoria (bloque de la izq)
-Bit D a 0 -> reemplazo en caché (bloque de caché)

## --Real Cache analysys--

```
-sudo apt install nasm <- ensamblador para Linux

-sudo nice -n -2 ./bandwidth32 --fastest <- (nice se utiliza para ejecutar el benchmark a 
mayor prioridad para que no interfieran los servicios del sistema.)

-gcc program.c -o program <- compila y enlaza

-time ./3-3loc1 <- ejecuta
```

### Valgrind

-Abreviaturas que utiliza cachegrind para mostrar los resultados son:

* I: instrucción.

* D: datos (rd: lectura, wr: escritura).

* I1: caché L1 de instrucciones.

* D1: caché L1 de datos.

* LL: resto de cachés de la jerarquía (L2, L3).

* LLi: accesos a instrucción en el resto de cachés de la jerarquía.

* LLd: accesos a datos en el resto de cachés de la jerarquía.

```
valgrind --tool=cachegrind ./program <- Simula la traza de accesos a memoria del programa 
```

## --Organización de la memoria de las tareas en GNU/Linux--

-Estas son algunas de las áreas de memoria que pueden distinguirse:

* Código estático. Incluye todo el código de la tarea presente en su archivo ejecutable. No incluye por tanto el código de las bibliotecas con las que enlaza en tiempo de ejecución, denominadas bibliotecas de enlace dinámico. En el caso de la figura 2, se corresponde con el rango de memoria asociado al archivo 3-4maps-1 con atributos r-xp.

* Datos estáticos. Se corresponden con las constantes y variables globales de la tarea, también definidas en el archivo ejecutable. En el caso de la figura 2 se corresponde con los rangos de memoria asociados al archivo 3-4maps-1 con atributos r--p para constantes y rw-p para variables.

* Pila (stack). Entre otras cosas, almacena las variables locales de la tarea así como las direcciones de retorno de las funciones. La ubicación de la pila en los sistemas operativos Linux no la fijan las herramientas de desarrollo. La ubicación es aleatoria y la fija el sistema operativo durante la carga de la tarea para dificultar los ataques por desbordamiento de la pila. (a esta técnica de seguridad se la conoce como Address Space Layout Randomization (ASLR) y se puede encontrar más información en ASLR). En el caso de la figura 2 se corresponde con el rango de memoria marcado como [stack].

* Montón o montículo (heap). Es un área reservada para memoria solicitada dinámicamente. Para reservar memoria en el montón se emplea típicamente la función malloc() de C. En el caso del programa 3-4maps-1 no existe montón.

* Bibliotecas de enlace dinámico. El ejecutable de la tarea contiene código que hace de interfaz con las bibliotecas dinámicas. El enlace con estas bibliotecas se hace en tiempo de carga (cuando se lanza el programa) o en tiempo de ejecución. En este último caso se habla de carga dinámica, lo cual permite generar el ejecutable sin que siquiera existan las bibliotecas, descubrirlas en tiempo de ejecución, cargarlas y finalmente descargarlas cuando no hacen falta.

Las bibliotecas dinámicas en Linux tienen típicamente la extensión .so. 

* VDSO (Virtual Dynamic Shared Object). Se trata de una pequeña zona de memoria que contiene una librería dinámica, la cual permite implementar de forma muy eficiente llamadas a servicios que no requieren privilegios para ser ejecutados, evitando la sobrecarga de los cambios de contexto entre la tarea y Linux. Por ejemplo, servicios para obtener la hora o las características de la CPU.

* VVAR (Virtual Dynamic Shared Object). Zona de memoria de sólo lectura, compartida con el sistema operativo, que contiene datos a los que acceden las rutinas almacenadas en el área VDSO.

```
more /proc/"INTRODUCE PID"/maps <- muestra los rangos de memoria

gcc -static program.c -o program <- compila y enlaza usando bibliotecas estáticas un programa

ls -l program1 program2 <- compara los tamaños de dos programas en bytes

ls -l  --block-size= K program1 program2 <- compara los tamaños de dos programas 
(NOTA: poner program* para mismos programas con distinta numeración)

```

## --Análisis del espacio de direcciones de una tarea--

* Variable globales
* Variables locales
* Funciones

### SIEMPRE COMPROBAR EL STATUS DE LINMEM

```
systemctl status linmem <- comprueba el estado

cd /usr/src/atc/linmem

sudo make clean

sudo make install <- lo instala
```

```
gcc program.c 3-4print-pte.c -o 3-4print-vm -lmem <- compila y enlaza de forma conjunta usando linmem

gcc -Wall program.c 3-4print-pte.c -o 3-4proclinux-1 -lmem <- La opción -Wall hace que se muestren todos los avisos de compilación. 
Si todo va bien, se genera un archivo ejecutable de nombre 3-4proclinux-1

```

## --El servicio mmap de POSIX--
* Permite solicitar memoria dentro del sistema operativo Linux

```
gcc -Wall 3-4proclinux-2.c 3-4print-pte.c -o 3-4proclinux-2 -lrt -lmem <- la opción -lrt especifica el enlazado con la biblioteca de tiempo real, 
en la cual están definidas las funciones shm_open() y shm_unlink().

```

## --La tabla de páginas en GNU/Linux-- 

```
sudo cat /proc/iomem <- El archivo iomem contiene las direcciones físicas asignadas a diferentes elementos del sistema

```



```
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <atc/linmem.h>

// Vector size
const uint16_t N = 1948;

int main(void) {
	unsigned int first_page = 1;
	unsigned int last_page = 0;
	unsigned int page = 0;
	unsigned int pte = 0;
	void * virtual_addr;
	double vector[N];

	memset(vector, 0, sizeof(vector));
	printf("\nVector address: %.8Xh\n", (unsigned int)vector);

	// TODO: compute first and last page numbers
	 last_page = (unsigned int) (&vector[N]) >> 12;
	 first_page = (unsigned int) (&vector[0]) >> 12;

	// Print page and frame numbers
	printf("Vector pages: ");
	for (page = first_page; page <= last_page; page++) {
		// Print page number
		printf("%.5Xh ", page);

		// Virtual address within the current page (offset 0)
		virtual_addr = (void *)(page << 12);

		// TODO: get PTE of the current page
		if (get_pte(virtual_addr, &pte)) {
			perror("Linmem module error");
			return -1;
		}

		// Check page is present in memory
		if (pte & 0x1) {
			// Print frame number
			printf("(%.5Xh) ", pte >> 12);
		}
		else {
			printf("(no page) ");
		}
	}

	// Print PTE flags for variable N
	if (get_pte((void *)&N, &pte)) {
		perror("Linmem module error");
		return -1;
	}
	printf("\nFlags of N page: %.3Xh\n\n", pte & 0xFFF);

	return 0;
}
```

### Para la última parte: funciones extra...

```
#include <"libreria a usar">
#include "3-4print-pte.h" <- incluir la funcion a usar
print_virtual_physical_pte(print_virtual_physical_pte, "Function\n"
                                                           "----------\n"); <- llamar a la función a usar
```
