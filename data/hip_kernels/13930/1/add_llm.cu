#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use shared memory to minimize global memory access
    extern __shared__ int sharedMem[];
    int* sharedC = sharedMem;

    // Calculate sum using shared memory
    *sharedC = a + b;

    // Write result back to global memory
    *c = *sharedC;
}