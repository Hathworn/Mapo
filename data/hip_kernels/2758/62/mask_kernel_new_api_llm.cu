#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel_new_api(int n, float *x, float mask_num, float *mask, float val)
{
    // Compute global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop for better utilization
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (mask[i] == mask_num) {
            x[i] = val;
        }
    }
}