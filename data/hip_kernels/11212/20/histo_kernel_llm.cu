#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {
    // Use shared memory to reduce atomic operations in global memory
    __shared__ unsigned int local_histo[256];
    
    // Initialize shared memory histogram
    int local_index = threadIdx.x;
    if (local_index < 256) {
        local_histo[local_index] = 0;
    }
    __syncthreads();
    
    // Calculate the starting index and the offset to the next block
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    while (i < size) {
        atomicAdd(&local_histo[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();
    
    // Accumulate results from shared memory to global memory
    if (local_index < 256) {
        atomicAdd(&histo[local_index], local_histo[local_index]);
    }
}