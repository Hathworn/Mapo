#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void childKernel(unsigned int parentThreadIndex, float* data) {
    // Cache parent index in shared memory for reuse 
    __shared__ unsigned int cacheParentIdx;
    if (threadIdx.x == 0) {
        cacheParentIdx = parentThreadIndex;
    }
    __syncthreads();

    // Efficient arithmetic operation
    data[threadIdx.x] = cacheParentIdx + 0.1f * threadIdx.x;
}