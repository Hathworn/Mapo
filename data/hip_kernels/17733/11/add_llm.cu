#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int addem(int a, int b) {
    return a + b;
}

__global__ void add(int a, int b, int *c) {
    // Use a shared variable to store the result to reduce global memory access
    __shared__ int result;
    if (threadIdx.x == 0) {
        result = addem(a, b);
        *c = result;
    }
    __syncthreads();  // Ensure all threads have finished computation
}