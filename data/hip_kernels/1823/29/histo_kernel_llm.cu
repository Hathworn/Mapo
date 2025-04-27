```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {
    // Shared memory for thread-local histogram
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    // Calculate global thread index and stride
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Accumulate local histogram
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Accumulate global histogram
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}