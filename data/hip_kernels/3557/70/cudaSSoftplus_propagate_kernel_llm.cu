#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSSoftplus_propagate_kernel(float* x, float* y, unsigned int size)
{
    // Use shared memory for improved memory access efficiency
    __shared__ float sharedMem[1024];
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = index; i < size; i += stride) {
        float val = x[i];
        // Avoid redundant calls to exp() using shared memory
        sharedMem[threadIdx.x] = expf(val);
        __syncthreads();
        y[i] = log1pf(sharedMem[threadIdx.x]); // Use log1p for better precision
    }
}