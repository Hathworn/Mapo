#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for inverting array elements.
extern "C"
__global__ void invert(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for each thread
    for (int idx = i; idx < n; idx += stride) {  // Loop over elements with stride
        result[idx] = 1.0f / a[idx];
    }
}