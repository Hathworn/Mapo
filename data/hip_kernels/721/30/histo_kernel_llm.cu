#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void histo_kernel(unsigned char *buffer1, long size1, unsigned int *histo1) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory for intermediate histogram
    __shared__ unsigned int local_histo[256];
    if (threadIdx.x < 256) local_histo[threadIdx.x] = 0;
    __syncthreads();

    // Each thread updates local histogram
    while (i < size1) {
        atomicAdd(&(local_histo[buffer1[i]]), 1);
        i += stride;
    }
    __syncthreads();

    // Accumulate local histograms into the global histogram
    if (threadIdx.x < 256) {
        atomicAdd(&(histo1[threadIdx.x]), local_histo[threadIdx.x]);
    }
}