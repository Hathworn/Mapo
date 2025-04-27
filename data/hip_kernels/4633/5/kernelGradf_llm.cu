#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGradf(const float *d_x, float *d_grad, float *A, float *b, const size_t len)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if index is out of bounds
    if (index >= len)
        return;

    float sum = 0.0f;

    // Use shared memory for improved data locality
    extern __shared__ float shared_x[];
    if (threadIdx.x < len)
    {
        shared_x[threadIdx.x] = d_x[threadIdx.x];
    }
    __syncthreads();

    // Accumulate the dot product
    for (size_t j = 0; j < len; ++j)
    {
        sum += A[index * len + j] * shared_x[j];
    }

    // Perform final gradient calculation
    d_grad[index] = 2.0f * sum + b[index];
}