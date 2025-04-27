#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addTwoArrays(int *v1, int *v2, int *r, int n)
{
    // Use shared memory for faster access
    __shared__ int s_v1[blockDim.x];
    __shared__ int s_v2[blockDim.x];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (tid < n) {
        // Load data into shared memory 
        s_v1[threadIdx.x] = v1[tid];
        s_v2[threadIdx.x] = v2[tid];
        __syncthreads();

        // Perform addition using shared memory
        r[tid] = s_v1[threadIdx.x] + s_v2[threadIdx.x];
    }
}