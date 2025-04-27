#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer1, long size1, unsigned int *histo1) {

    // Phase 1 ------------------------------------------------------------
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling to optimize memory access within the while loop
    while (i < size1) {
        atomicAdd(&(temp[buffer1[i]]), 1);
        if (i + blockDim.x < size1) atomicAdd(&(temp[buffer1[i + blockDim.x]]), 1);
        if (i + 2 * blockDim.x < size1) atomicAdd(&(temp[buffer1[i + 2 * blockDim.x]]), 1);
        if (i + 3 * blockDim.x < size1) atomicAdd(&(temp[buffer1[i + 3 * blockDim.x]]), 1);
        i += 4 * stride;  // Adjust stride for loop unrolling
    }
    __syncthreads();
    //---------------------------------------------------------------------

    // Phase 2 ------------------------------------------------------------
    atomicAdd(&(histo1[threadIdx.x]), temp[threadIdx.x]);
    //---------------------------------------------------------------------
}