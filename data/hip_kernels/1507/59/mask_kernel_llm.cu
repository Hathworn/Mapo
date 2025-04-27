#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask)
{
    // Use flattened grid and block indices for optimal thread mapping
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary condition before accessing global memory
    if (i < n && mask[i] == mask_num)
    {
        // Efficient memory write by reducing condition checks
        x[i] = mask_num;
    }
}