#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Use shared memory to minimize global memory access
    __shared__ int temp;
    if (threadIdx.x == 0) { // Ensure only one thread performs the calculation
        temp = a + b;
    }
    __syncthreads(); // Synchronize before reading from shared memory
    if (threadIdx.x == 0) {
        *c = temp;
    }
}