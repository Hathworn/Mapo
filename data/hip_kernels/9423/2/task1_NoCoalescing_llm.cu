#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void task1_NoCoalescing(unsigned const* a, unsigned const* b, unsigned* result, size_t size)
{
    // Use shared memory for better memory access pattern
    extern __shared__ unsigned shared_a[];
    extern __shared__ unsigned shared_b[];

    auto tid = threadIdx.x;
    auto index = blockIdx.x * blockDim.x + tid;

    if (index < size) {
        shared_a[tid] = a[index];
        shared_b[tid] = b[index];
        __syncthreads(); // Synchronize threads to ensure shared memory is ready

        result[index] = shared_a[tid] * shared_b[tid];
    }
}