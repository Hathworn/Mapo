#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

/*
* Perform a reduction from data of length 'n' to result, where length of result will be 'number of blocks'.
*/
__global__ void cap(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Process only when index is within valid range
    if (i < n)
    {
        // Use ternary operator to select the minimum value
        result[i] = fminf(a[i], b[i]); // Use fminf for potentially better performance
    }
}