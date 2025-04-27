#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    // Use stride to process all elements with fewer threads
    for (; i < n; i += blockDim.x * gridDim.x * gridDim.y) {
        if (mask[i] == mask_num) {
            x[i] = mask_num;
        }
    }
}