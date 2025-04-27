#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSmult_kernel(unsigned int size, const float *x1, const float *x2, float *y)
{
    // Use shared memory for buffering input, improves memory access patterns
    extern __shared__ float sdata[];

    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = index; i < size; i += stride) {
        // Load data into shared memory
        sdata[threadIdx.x] = x1[i] * x2[i];

        __syncthreads(); // Synchronize threads within a block

        // Write the result from shared memory back to global memory
        y[i] = sdata[threadIdx.x];
    }
}