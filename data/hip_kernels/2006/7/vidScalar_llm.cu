#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Perform a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void vidScalar(int n, float *a, float b, float *result)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out-of-bounds
    if (i < n)
    {
        result[i] = b / a[i];
    }
}