#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void int_copy(int *vec_to, const int *vec_from, const int n)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory to optimize memory transfer
    extern __shared__ int shared_mem[];
    
    if (xIndex < n) {
        // Load data into shared memory
        shared_mem[threadIdx.x] = vec_from[xIndex];
        __syncthreads();

        // Store data from shared memory to global memory
        vec_to[xIndex] = shared_mem[threadIdx.x];
    }
}