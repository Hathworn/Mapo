#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure all threads coalesce on conditional checks
    if (i < n) {
        float mask_val = mask[i]; // Reduce indexing operations
        if (mask_val == mask_num) {
            x[i] = val;
        }
    }
}