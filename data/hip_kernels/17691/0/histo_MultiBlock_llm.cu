#include "hip/hip_runtime.h"
#include "includes.h"
#define SIZE 2048*1024
#define BLOCKS 1000
#define THREADS 256

__global__ void histo_MultiBlock( unsigned char *buffer, long size, unsigned int *histo ) {

    // Declare shared memory with initial zeroing
    __shared__ unsigned int temp[256];
    if (threadIdx.x < 256) {
        temp[threadIdx.x] = 0;
    }
    __syncthreads();

    // Calculate initial index and stride
    int i = threadIdx.x + blockIdx.x * THREADS;
    int offset = THREADS * BLOCKS;
    
    // Accumulate local histogram in shared memory
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        i += offset;
    }
    __syncthreads();

    // Combine results into the global histogram
    if (threadIdx.x < 256) {
        atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
    }
}