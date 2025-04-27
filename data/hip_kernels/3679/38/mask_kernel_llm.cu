#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check index within bounds and mask condition
    if (i < n && mask[i] == mask_num) {
        x[i] = val;
    }
}