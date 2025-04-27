#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_arrays_gpu(unsigned int * a, unsigned int * b, int size)
{
    // Use shared memory for efficient data access
    __shared__ unsigned int shared_a;

    // Initialize shared memory only once
    if (threadIdx.x == 0)
        shared_a = a[0];
    
    __syncthreads();

    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Perform the computation and update shared memory
    if (index < size) {
        atomicAdd(&shared_a, b[index]);
    }

    __syncthreads();

    // Update global memory from shared memory
    if (threadIdx.x == 0)
        atomicAdd(&a[0], shared_a - a[0]);
}