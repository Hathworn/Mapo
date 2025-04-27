#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subScalar(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by ensuring only valid threads perform operations
    if (i < n)
    {
        result[i] = a[i] - b;
    }
}