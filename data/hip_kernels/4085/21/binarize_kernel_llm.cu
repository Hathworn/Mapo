```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    // Ensure index is within bounds, improved memory access pattern
    if (i < n) {
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f;
    }
}