#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate the global index using built-in functions
    int i = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;
    
    // Ensure threads that exceed n do not proceed
    if (i < n) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}