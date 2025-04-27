#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_MonoBlock(unsigned char *buffer, long size, unsigned int *histo) {
    __shared__ unsigned int temp[256];

    // Initialize shared memory to zero
    temp[threadIdx.x] = 0;
    __syncthreads();

    // Calculate the index based on grid size for larger arrays
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int offset = gridDim.x * blockDim.x;

    // Loop over the buffer with an increment of the total number of threads
    while (globalIndex < size) {
        atomicAdd(&temp[buffer[globalIndex]], 1);
        globalIndex += offset;
    }

    __syncthreads();

    // Accumulate the results into global histogram
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}