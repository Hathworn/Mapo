#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    // Compute global index with 1D grid structure for improved calculation efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a while loop for grid-stride approach
    while (i < n) {
        if (mask[i] == mask_num) {
            x[i] *= scale; // Perform scaling if condition is met
        }
        i += blockDim.x * gridDim.x; // Move to the next position in the grid-stride loop
    }
}