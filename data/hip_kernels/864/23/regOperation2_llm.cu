#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel using registers for temporary storage
__device__ int2 devInt2[10];
__global__ void regOperation() {
    int2 f = devInt2[1];
    devInt2[0] = f; // Use register to store and transfer data efficiently
}

__global__ void regOperation2() {
    int2 f = devInt2[1];
    devInt2[0] = f; // Optimize by handling the entire struct to reduce split accesses
}