#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask_kernel_new_api(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate the global thread index more concisely
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Optimize the condition to reduce warp divergence
    if (i < n) {
        float current_mask = mask[i];
        if (current_mask == mask_num) {
            x[i] = val;
        }
    }
}