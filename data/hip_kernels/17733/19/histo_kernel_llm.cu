#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histo_kernel( unsigned char *buffer, long size, unsigned int *histo ) {
    // Use shared memory for histogram to reduce global memory atomic adds
    __shared__ unsigned int localHisto[256];
    int tid = threadIdx.x;

    // Initialize shared histogram
    if (tid < 256) {
        localHisto[tid] = 0;
    }
    __syncthreads();

    // Calculate the starting index and the stride for each thread
    int i = tid + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Accumulate into shared memory histogram
    while (i < size) {
        atomicAdd(&localHisto[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Aggregate shared memory histogram into global memory
    if (tid < 256) {
        atomicAdd(&histo[tid], localHisto[tid]);
    }
}