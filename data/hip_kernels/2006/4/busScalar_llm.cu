#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" __global__ void busScalar(int n, float *a, float b, float *result)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform operation if index is within bounds
    if (i < n)
    {
        result[i] = b - a[i]; // Simplify operation order
    }
}