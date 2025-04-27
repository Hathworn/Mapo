#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute global index
    int gridStride = blockDim.x * gridDim.x;        // Calculate grid stride
    for (; i < n; i += gridStride) {                // Loop with grid stride
        if (mask[i] == mask_num) {                  // Check condition
            x[i] *= scale;                          // Scale if condition is true
        }
    }
}