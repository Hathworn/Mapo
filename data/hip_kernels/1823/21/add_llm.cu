#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int addem(int a, int b) {
    return a + b;
}

__global__ void add(int a, int b, int *c) {
    // Synchronize to ensure all threads reach this point (not necessary for such small computation but good practice for more complex cases)
    __syncthreads();
    // Use thread number 0 to perform the operation for minimal warp divergence
    if (threadIdx.x == 0) {
        *c = addem(a, b);
    }
}