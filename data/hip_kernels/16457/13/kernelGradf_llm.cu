#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGradf(const float *d_x, float *d_grad, float *A, float *b, const size_t len)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index >= len)
        return;

    float temp = 0.0f; // Initialize temporary variable

    // Use shared memory for improved access speed (optimize memory access pattern)
    __shared__ float shared_d_x[1024]; // Assuming blockDim.x <= 1024
    for (size_t j = threadIdx.x; j < len; j += blockDim.x)
    {
        shared_d_x[j] = d_x[j];
    }
    __syncthreads(); // Synchronize threads to ensure shared memory is populated

    for (size_t j = 0; j < len; ++j)
    {
        temp += A[index * len + j] * shared_d_x[j];
    }

    d_grad[index] = temp * 2.0f + b[index]; // Combine operations for better optimization
}