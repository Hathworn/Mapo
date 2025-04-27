#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sequence_gpu(int *d_ptr, int length)
{
    // Use shared memory to minimize global memory access
    __shared__ int shared_mem[256]; // Assume blockDim.x <= 256

    int elemID = blockIdx.x * blockDim.x + threadIdx.x;

    if (elemID < length)
    {
        shared_mem[threadIdx.x] = elemID; // Load data into shared memory
        __syncthreads(); // Synchronize threads within the block
        d_ptr[elemID] = shared_mem[threadIdx.x]; // Store data from shared memory to global memory
    }
}