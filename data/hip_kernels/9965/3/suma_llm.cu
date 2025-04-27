#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Use blockIdx.x to manage multiple blocks if needed; avoid atomic if writing to a single memory location per block
    if (threadIdx.x == 0) { // Ensure only one thread performs the addition
        *c = a + b;
    }
}