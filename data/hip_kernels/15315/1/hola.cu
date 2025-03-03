#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hola()
{
printf("Hola mundo! Soy un thread en el bloque %d\n", blockIdx.x);
}