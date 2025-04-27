#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

/*
* Perform a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void mult(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use registers to minimize memory access latency
        float valA = a[i];
        float valB = b[i];
        result[i] = valA * valB;
    }
}