#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void floorByScalar(int n, float *a, float b, float *result)
{
    // Cache calculations to reduce repeated operations
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use warp-synchronous instruction if block size is a multiple of warp size
    if (i < n)
    {
        float ai = a[i];        // Load once
        result[i] = ai > b ? ai : b;   // Use conditional to store result
    }
}