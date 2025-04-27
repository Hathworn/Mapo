#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addTwoArraysSharedDynamic(int *v1, int *v2, int *r, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize: Only proceed if tid is within bounds
    if (tid < n)
    {
        extern __shared__ int arrays[];
        int *s_v1 = arrays;
        int *s_v2 = &s_v1[blockDim.x]; // Reduced shared memory usage
        s_v1[threadIdx.x] = v1[tid];  // Use threadIdx.x for shared memory indexing
        s_v2[threadIdx.x] = v2[tid];

        // Perform addition using shared memory
        r[tid] = s_v1[threadIdx.x] + s_v2[threadIdx.x];
    }
}