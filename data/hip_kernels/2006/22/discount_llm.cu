#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Perfom a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void discount(int n, float *a, float *b, float p, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that 'i' is within bounds
    if (i < n) 
    {
        // Combine multiply and addition operation in a single line to optimize performance
        float prod = b[i] * p;
        float fma = __fmaf_rn(prod, 1.0f, 1.0f);
        result[i] = a[i] / fma;
    }
}