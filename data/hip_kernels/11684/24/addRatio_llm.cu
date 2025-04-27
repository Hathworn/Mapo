#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Perform a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void addRatio(int n, float *a, float *b, float *c, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by checking if 'i' is within range before accessing arrays
    if (i < n)
    {
        // Perform addition and division in separate operations for better readability
        float divisionResult = b[i] / c[i];
        result[i] = a[i] + divisionResult;
    }
}