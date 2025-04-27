#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void scale_mask_kernel(int n, float *x, float mask_num, float *mask, float scale)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D grid and block indexing
    int stride = gridDim.x * blockDim.x;           // Calculate stride for effective processing
    for (; i < n; i += stride) {                   // Loop over elements with stride
        if (mask[i] == mask_num) {                 // Apply mask condition
            x[i] *= scale;                         // Scale the value
        }
    }
}