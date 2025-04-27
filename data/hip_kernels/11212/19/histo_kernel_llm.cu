#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {
    // Use a static shared memory size for better performance
    __shared__ unsigned int temp[256];
    
    // Initialize shared memory using single thread
    if (threadIdx.x < 256) {
        temp[threadIdx.x] = 0;
    }
    __syncthreads();
    
    // Calculate the starting index and the offset for processing
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Process buffer in stride pattern
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Update global histogram using data from shared memory
    if (threadIdx.x < 256) {
        atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
    }
}