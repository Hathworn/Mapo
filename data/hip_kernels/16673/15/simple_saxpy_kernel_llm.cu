#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_saxpy_kernel(float *y, const float* x, const float alpha, const float beta)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we are within bounds to avoid out-of-bounds memory access
    if (idx < gridDim.x * blockDim.x) {
        y[idx] = alpha * x[idx] + beta;
    }
}