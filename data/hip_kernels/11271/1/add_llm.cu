#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *x, float *y)
{
    // Compute global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid-strided loop

    // Use grid-stride loop for efficient memory access and more workload distribution
    for (; i < n; i += stride)
    {
        y[i] = x[i] + y[i];
    }
}