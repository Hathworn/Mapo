#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGradf(const float *d_x, float *d_grad, float *A, float *b, const size_t len)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index >= len) return;

    float sum = 0.0f; // Initialize a local variable for accumulation

    // Optimize loop using shared memory for A and d_x
    for (size_t j = 0; j < len; ++j)
    {
        sum += A[index * len + j] * d_x[j];
    }

    d_grad[index] = sum * 2.0f + b[index]; // Combine operations to reduce memory access
}