#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global index using blockIdx, blockDim, and threadIdx
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop by using a stride
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Apply mask condition and set value
        if (mask[i] == mask_num) {
            x[i] = val;
        }
    }
}