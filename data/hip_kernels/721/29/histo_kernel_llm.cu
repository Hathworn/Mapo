#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer1, long size1, unsigned int *histo1) {

    // Phase 1: Use shared memory for temporary histogram
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Process each stride, optimizing loop with local reduction
    while (i < size1) {
        atomicAdd(&(temp[buffer1[i]]), 1);
        i += stride;
    }
    __syncthreads();

    // Phase 2: Accumulate local histogram into global histogram
    atomicAdd(&(histo1[threadIdx.x]), temp[threadIdx.x]);
}