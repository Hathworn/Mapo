#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inputKernel(float *x, int N)
{
    int idx = blockIdx.y * blockDim.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x; // Optimize index calculation

    if (idx < N)
        x[idx] += (float)idx; // Simplify addition operation
}