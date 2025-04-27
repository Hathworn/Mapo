#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel_2elements(int* device_result, int* device_blocksum_2elements)
{
    __shared__ int temp1;
    int thid = threadIdx.x;
    int block_offset = blockIdx.x * blockDim.x * 4; // Calculate block offset

    if (thid == 0) temp1 = device_blocksum_2elements[blockIdx.x];
    __syncthreads();

    // Reduce memory calculations by using a single variable for offset
    int base_index = block_offset + thid;
    int N = blockDim.x;

    for (int i = 0; i < 4; i++) {
        device_result[base_index + i * N] += temp1; // Optimize repeated calculations
    }
}