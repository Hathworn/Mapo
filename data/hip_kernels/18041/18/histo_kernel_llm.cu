#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {
    // Preload the histogram data into shared memory for faster access
    __shared__ unsigned int local_histo[256]; // Assuming 256 bins for simplicity
    if (threadIdx.x < 256) local_histo[threadIdx.x] = 0; // Initialize shared memory
    
    __syncthreads(); // Ensure all threads have initialized the shared memory

    // Calculate the starting index and the offset to the next block that each thread will be processing
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    while (i < size) {
        atomicAdd(&local_histo[buffer[i]], 1); // Update local histogram
        i += stride;
    }

    __syncthreads(); // Ensure all updates to shared memory are complete

    // Merge results back to global memory
    if (threadIdx.x < 256) atomicAdd(&histo[threadIdx.x], local_histo[threadIdx.x]);
}