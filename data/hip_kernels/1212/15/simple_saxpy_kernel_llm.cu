#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_saxpy_kernel(float *y, const float* x, const float alpha, const float beta)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within data bounds
    if (idx < gridDim.x * blockDim.x)
    {
        y[idx] = alpha * x[idx] + beta;
    }
}