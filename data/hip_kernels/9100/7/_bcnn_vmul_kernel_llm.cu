#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _bcnn_vmul_kernel(int n, float *a, float *b, float *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = blockDim.x * gridDim.x;           // Calculate stride for loop
    for (; i < n; i += stride) {
        y[i] = a[i] * b[i];                        // Process all elements in the range of n
    }
}