#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSinv_kernel(unsigned int size, const float *x, float *y)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimize memory access by using shared memory
    __shared__ float sharedX[blockDim.x]; 

    for (unsigned int i = index; i < size; i += stride) {
        // Load data into shared memory
        sharedX[threadIdx.x] = x[i];

        __syncthreads(); // Ensure all threads have loaded their data

        // Compute reciprocal using shared memory
        y[i] = 1.0f / sharedX[threadIdx.x];

        __syncthreads(); // Ensure computation is finished before next load
    }
}