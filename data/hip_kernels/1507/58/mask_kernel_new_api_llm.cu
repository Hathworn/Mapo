#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask_kernel_new_api(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not go out of bounds
    if (i < n) {
        // Apply mask condition
        if (mask[i] == mask_num) {
            x[i] = val;
        }
    }
}