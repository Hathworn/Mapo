#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer1, long size1, unsigned int *histo1){
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to optimize atomic operations
    __shared__ unsigned int local_histo[256];
    if (threadIdx.x < 256) {
        local_histo[threadIdx.x] = 0;
    }
    __syncthreads();

    while (i < size1) {
        atomicAdd(&(local_histo[buffer1[i]]), 1);
        i += stride;
    }
    __syncthreads();

    // Write results from shared memory back to global memory
    if (threadIdx.x < 256) {
        atomicAdd(&(histo1[threadIdx.x]), local_histo[threadIdx.x]);
    }
}