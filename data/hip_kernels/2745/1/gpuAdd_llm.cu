#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void gpuAdd(int d_a, int d_b, int *d_c) {
    // Use shared memory for better performance
    __shared__ int temp;
    if (threadIdx.x == 0) {
        temp = d_a + d_b;
    }
    __syncthreads();
    if (threadIdx.x == 0) {
        *d_c = temp;
    }
}