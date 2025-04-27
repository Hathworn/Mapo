#include "hip/hip_runtime.h"
#include "includes.h"

#define HISTOGRAM_LENGTH 256

__global__ void histo_kernel(unsigned char *buffer, unsigned int *histo, long size) {
    __shared__ unsigned int histo_private[HISTOGRAM_LENGTH];

    int tx = threadIdx.x;

    // Initialize shared histogram
    if (tx < HISTOGRAM_LENGTH) 
        histo_private[tx] = 0;

    __syncthreads();

    // Use a stride loop to distribute read tasks among threads
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    while (index < size) {
        atomicAdd(&(histo_private[buffer[index]]), 1);
        index += stride;  // Efficient stride-based iteration for full buffer access
    }

    __syncthreads();

    // Merge shared histogram back to global histogram
    if (tx < HISTOGRAM_LENGTH) 
        atomicAdd(&(histo[tx]), histo_private[tx]);
}