#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int addem(int a, int b) {
    return a + b;
}

__global__ void add(int a, int b, int *c) {
    // Use shared memory for intermediate storage to optimize memory access
    extern __shared__ int shared_mem[];
    int index = threadIdx.x;
    shared_mem[index] = addem(a, b);

    // Use a single thread to store the result back to global memory
    if (index == 0) {
        *c = shared_mem[0];
    }
}