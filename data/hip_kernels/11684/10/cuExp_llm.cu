#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"
__global__ void cuExp(int n, float *a, float *result)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate over data with a stride to use all available threads
    for (int index = i; index < n; index += blockDim.x * gridDim.x)
    {
        result[index] = exp(a[index]);
    }
}