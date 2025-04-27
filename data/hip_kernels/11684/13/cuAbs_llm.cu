#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

/*
* Perform a reduction from data of length 'size' to result, where the length of result will be 'number of blocks'.
*/
__global__ void cuAbs(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (i < n)
    {
        // Use fast math for absolute value
        result[i] = fabsf(a[i]);
    }
}