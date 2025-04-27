#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for processing large arrays
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        if (mask[idx] == mask_num) {
            x[idx] = val;
        }
    }
}