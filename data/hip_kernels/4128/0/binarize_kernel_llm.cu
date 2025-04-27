```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements per thread using stride loop
    int stride = blockDim.x * gridDim.x;
    while (i < n) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
        i += stride;
    }
}