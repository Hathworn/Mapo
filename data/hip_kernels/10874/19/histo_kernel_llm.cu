#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {

    // Declare shared memory as zero-initialized
    __shared__ unsigned int temp[256];

    // Each thread initializes its corresponding location in shared memory
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int bsize = blockDim.x;
    int gsize = gridDim.x;
    temp[tid] = 0;
    __syncthreads();

    // Calculate the global thread index and stride
    int i = tid + bid * bsize;
    int stride = bsize * gsize;

    // Perform atomic additions to the shared memory histogram
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Update the global histogram with values from the shared memory
    atomicAdd(&histo[tid], temp[tid]);
}