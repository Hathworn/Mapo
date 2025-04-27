#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Efficiently stride across elements using grid-stride loop
    for (; i < n; i += gridDim.x * blockDim.x) {
        if (mask[i] == mask_num) {
            x[i] = val;
        }
    }
}