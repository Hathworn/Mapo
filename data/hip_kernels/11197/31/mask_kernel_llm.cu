#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Calculate the global thread ID more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop to handle scenarios where grid size isn't a multiple of n
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Simplified condition check and assignment
        if (mask[i] == mask_num) {
            x[i] = mask_num;
        }
    }
}