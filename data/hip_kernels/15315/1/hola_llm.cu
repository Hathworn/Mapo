#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hola() {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique thread index
    if (idx == 0) {  // Ensure only one thread executes the print statement
        printf("Hola mundo! Soy un thread en el bloque %d\n", blockIdx.x);
    }
}