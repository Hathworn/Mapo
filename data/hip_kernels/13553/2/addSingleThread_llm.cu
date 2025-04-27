#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addSingleThread(int n, float *x, float *y)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int stride = gridDim.x * blockDim.x; // Calculate stride

    for (int i = index; i < n; i += stride) // Use stride to process larger arrays
    {
        y[i] = x[i] + y[i];
    }
}