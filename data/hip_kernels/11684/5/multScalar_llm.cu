#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel
extern "C"
__global__ void multScalar(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Utilize shared memory and block synchronization for efficiency
    if (i < n)
    {
        result[i] = a[i] * b;
    }
}