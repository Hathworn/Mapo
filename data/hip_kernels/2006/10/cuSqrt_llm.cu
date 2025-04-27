#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to compute square roots of array elements
extern "C"
__global__ void cuSqrt(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use fast math for optimization
        result[i] = __fsqrt_rn(a[i]);
    }
}