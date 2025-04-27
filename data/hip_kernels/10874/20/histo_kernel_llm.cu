#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {
    // Shared memory for atomic operations
    __shared__ unsigned int localHisto[256];
    
    // Initialize shared memory
    if (threadIdx.x < 256) {
        localHisto[threadIdx.x] = 0;
    }
    __syncthreads();
    
    // Calculate the starting index and the offset to the next block that each thread will be processing
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    while (i < size) {
        atomicAdd(&localHisto[buffer[i]], 1);
        i += stride;
    }
    
    __syncthreads();
    
    // Transfer results from shared memory to global memory
    if (threadIdx.x < 256) {
        atomicAdd(&histo[threadIdx.x], localHisto[threadIdx.x]);
    }
}