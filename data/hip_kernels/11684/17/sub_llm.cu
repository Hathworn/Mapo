#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void sub(int n, float *a, float *b, float *result)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds and perform subtraction
    if (i < n)
    {
        result[i] = a[i] - b[i];
    }
    
    // Optimization: Use shared memory for faster access (if needed)
//    __shared__ float shared_a[BLOCK_SIZE];
//    __shared__ float shared_b[BLOCK_SIZE];
//    
//    if (i < n) {
//        shared_a[threadIdx.x] = a[i];
//        shared_b[threadIdx.x] = b[i];
//        __syncthreads();
//        result[i] = shared_a[threadIdx.x] - shared_b[threadIdx.x];
//    }
}