#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel_new_api(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;
    
    // Loop through elements with grid-stride 
    for (; i < n; i += gridStride) {
        if (mask[i] == mask_num) x[i] = val;
    }
}