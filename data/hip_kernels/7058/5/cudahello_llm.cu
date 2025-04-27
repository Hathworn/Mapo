#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudahello() {
    // Calculate global thread index for detailed identification
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hola Mundo! Soy el hilo global %d (hilo local %d del bloque %d)\n", globalThreadId, threadIdx.x, blockIdx.x);
}