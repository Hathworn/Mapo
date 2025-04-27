#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cpy(float *a, float *b, int n) {
    // Use shared memory to reduce global memory access
    extern __shared__ float sharedData[];
    
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid = threadIdx.x;
    
    // Load data into shared memory
    if (i < n) {
        sharedData[tid] = b[i];
    }
    __syncthreads();

    // Write data from shared memory to global memory
    if (i < n) {
        a[i] = sharedData[tid];
    }
}