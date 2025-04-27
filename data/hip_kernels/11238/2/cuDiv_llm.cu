#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void cuDiv(int n, float *a, float *b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop for better parallelism
    for (; i < n; i += blockDim.x * gridDim.x) 
    {
        result[i] = a[i] / b[i];
    }
}