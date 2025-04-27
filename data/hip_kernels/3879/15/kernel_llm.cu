#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(const uint *__restrict__ a, const uint *__restrict__ b, const uint length, uint *c)
{
    // Load data into shared memory to improve memory efficiency
    extern __shared__ uint shared_a[];
    extern __shared__ uint shared_b[];

    uint tid = (blockIdx.x * blockDim.x) + threadIdx.x;
    uint stride = blockDim.x * gridDim.x;

    // Each thread loads its part of the input arrays into shared memory
    if (tid < length) {
        shared_a[threadIdx.x] = a[tid];
        shared_b[threadIdx.x] = b[tid];
    }
    __syncthreads();  // Synchronize to ensure shared memory is properly loaded

    // Perform computation using shared memory
    while (tid < length) {
        c[tid] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
        tid += stride;
    }
}