#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuExp(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use fast math intrinsic for exponentiation
        result[i] = __expf(a[i]);
    }
}