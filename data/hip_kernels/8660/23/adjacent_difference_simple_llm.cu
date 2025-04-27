#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adjacent_difference_simple(int *result, int *input)
{
    // Compute this thread's global index
    unsigned int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory to reduce global memory access
    __shared__ int shared_input[blockDim.x];
    if (threadIdx.x < blockDim.x)
    {
        shared_input[threadIdx.x] = input[i];
    }
    __syncthreads();

    // Compute difference only if i > 0
    if (i > 0)
    {
        // Use shared memory to fetch values
        int x_i = shared_input[threadIdx.x];
        int x_i_minus_one = (threadIdx.x == 0) ? input[i - 1] : shared_input[threadIdx.x - 1];

        // Compute the difference using values stored in registers
        result[i] = x_i - x_i_minus_one;
    }
}