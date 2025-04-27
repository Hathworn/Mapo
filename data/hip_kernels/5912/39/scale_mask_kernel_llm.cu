#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate 1D index within the grid
    int stride = gridDim.x * blockDim.x;            // Calculate grid stride

    for (; i < n; i += stride) {                    // Loop over elements with grid stride
        if (mask[i] == mask_num)                    // Conditional check for mask number
            x[i] *= scale;                          // Scale the element if condition is true
    }
}