#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}


__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Use shared memory to reduce global memory access
    __shared__ float shared_mask;
    if (threadIdx.x == 0) {
        shared_mask = mask_num;
    }
    __syncthreads();

    // Check bounds and perform operation
    if (i < n && mask[i] == shared_mask) {
        x[i] = shared_mask;
    }
}