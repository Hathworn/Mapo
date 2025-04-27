#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction_unrolling_blocks4(int * input, int * temp, int size)
{
    int tid = threadIdx.x;
    int BLOCK_OFFSET = blockIdx.x * blockDim.x * 4;
    int index = BLOCK_OFFSET + tid;
    int * i_data = input + BLOCK_OFFSET;

    // Unroll and partially compute the sum if within bounds
    int sum = 0;
    if ((index + 3 * blockDim.x) < size)
    {
        sum = input[index] + input[index + blockDim.x]
            + input[index + 2 * blockDim.x] + input[index + 3 * blockDim.x];
    }
    i_data[tid] = sum;

    __syncthreads();

    // Perform reduction in shared memory
    for (int offset = blockDim.x / 2; offset > 0; offset /= 2)
    {
        if (tid < offset)
        {
            i_data[tid] += i_data[tid + offset];
        }
        __syncthreads();
    }

    // Write result for this block to temp
    if (tid == 0)
    {
        temp[blockIdx.x] = i_data[0];
    }
}