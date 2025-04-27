#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGradf(const float *d_x, float *d_grad, float *A, float *b, const size_t len)
{
    // Calculate global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if index exceeds bounds
    if (index >= len)
        return;

    float sum = 0.0f;

    // Use shared memory to optimize access to A
    extern __shared__ float shared_x[];
    shared_x[threadIdx.x] = d_x[threadIdx.x];
    __syncthreads();

    for (size_t j = 0; j < len; ++j)
    {
        sum += A[index * len + j] * shared_x[j];
    }

    // Directly store the result in global memory
    d_grad[index] = 2.0f * sum + b[index];
}