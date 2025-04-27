#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSMult_kernel(unsigned int size, float* a, float* b, const float beta, float* result)
{
    // Calculate global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for caching
    extern __shared__ float shared[];

    if (beta != 0.0f) {
        for (unsigned int i = index; i < size; i += stride) {
            // Load data into shared memory
            shared[threadIdx.x] = a[i] * b[i];
            __syncthreads(); // Synchronize threads within the block
            // Write result back to global memory
            result[i] = shared[threadIdx.x] + beta * result[i];
        }
    } else {
        for (unsigned int i = index; i < size; i += stride) {
            // Load data into shared memory
            shared[threadIdx.x] = a[i] * b[i];
            __syncthreads(); // Synchronize threads within the block
            // Write result back to global memory
            result[i] = shared[threadIdx.x];
        }
    }
}