#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for improved efficiency; works for larger datasets
    int stride = blockDim.x * gridDim.x;

    // Loop with stride to cover all elements
    for (; i < n; i += stride) {
        if (mask[i] == mask_num) {
            x[i] = val;
        }
    }
}