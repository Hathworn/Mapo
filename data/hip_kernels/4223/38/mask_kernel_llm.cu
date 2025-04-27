#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate index based on 1D block
    int gridSize = blockDim.x * gridDim.x; // Grid stride loop
    while (i < n) {
        if (mask[i] == mask_num) x[i] = val; // Check condition and set value
        i += gridSize; // Move to the next index in the grid stride
    }
}