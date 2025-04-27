#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

/*
* Perform a reduction from data of length 'size' to result, 
* where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void cuAbs(int n, float *a, float *result)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within the bounds
    if (i < n)
    {
        // Use fabsf for floating-point absolute value
        result[i] = fabsf(a[i]);
    }
}