#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer, long size, unsigned int *histo) {
    // Declare and clear shared memory
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    // Calculate starting index and stride
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling for efficiency
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Use one atomic add per thread to update global histogram
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}