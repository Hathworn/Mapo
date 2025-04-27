#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_interleaved_unrolling_blocks8_1(int * input, int * temp, int size)
{
    int tid = threadIdx.x;
    
    // element index for this thread
    int index = blockDim.x * blockIdx.x * 8 + threadIdx.x;
    
    // local data pointer
    int * i_data = input + blockDim.x * blockIdx.x * 8;

    // Unrolling optimization: combine multiple load operations
    if ((index + 7 * blockDim.x) < size)
    {
        int sum = 0;
        sum += input[index];
        sum += input[index + blockDim.x];
        sum += input[index + 2 * blockDim.x];
        sum += input[index + 3 * blockDim.x];
        sum += input[index + 4 * blockDim.x];
        sum += input[index + 5 * blockDim.x];
        sum += input[index + 6 * blockDim.x];
        sum += input[index + 7 * blockDim.x];

        input[index] = sum;
    }
    
    __syncthreads();
    
    // Parallel reduction using interleaved addressing
    for (int offset = blockDim.x / 2; offset > 0; offset /= 2)
    {
        if (tid < offset)
        {
            i_data[tid] += i_data[tid + offset];
        }
        __syncthreads();
    }
    
    if (tid == 0)
    {
        temp[blockIdx.x] = i_data[0];
    }
}