#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *x, float *y)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle large n
    int stride = gridDim.x * blockDim.x;
    for (int index = i; index < n; index += stride)
    {
        y[index] = x[index] + y[index];
    }
}