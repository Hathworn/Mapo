#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for efficient global memory access
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (mask[i] == mask_num) {
            x[i] = mask_num;
        }
    }
}