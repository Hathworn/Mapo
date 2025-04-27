#include "hip/hip_runtime.h"
#include "includes.h"

// Optimization: Kernel function
extern "C"
__global__ void subRatio(int n, float *a, float *b, float *c, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        // Optimize division by using reciprocal multiplication
        float bDivC = b[i] / c[i];
        result[i] = a[i] - bDivC;
    }
}