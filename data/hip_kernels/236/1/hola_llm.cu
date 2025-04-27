#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hola()
{
    // Use threadIdx.x to display thread ID as well
    printf("Hola mundo! Soy un thread %d en el bloque %d\n", threadIdx.x, blockIdx.x);
}