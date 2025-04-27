```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop

    for (; i < n; i += stride) { // Use stride loop for better utilization
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}