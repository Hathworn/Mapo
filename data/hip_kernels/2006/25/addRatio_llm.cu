#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void addRatio(int n, float *a, float *b, float *c, float *result)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional to ensure accessing valid memory
    if (i < n)
    {
        // Store the result of element-wise computation
        result[i] = a[i] + b[i] / c[i];
    }
}