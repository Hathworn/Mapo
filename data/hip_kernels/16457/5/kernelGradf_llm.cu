#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelGradf(const float *d_x, float *d_grad, const float *A, const float *b, const size_t len)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index >= len)
        return;

    float grad = 0.0f; // Use local variable to reduce global memory access

    for (size_t j = 0; j < len; ++j)
    {
        grad += A[index * len + j] * d_x[j];
    }

    d_grad[index] = grad * 2.0f + b[index]; // Combine operations to minimize write operations
}