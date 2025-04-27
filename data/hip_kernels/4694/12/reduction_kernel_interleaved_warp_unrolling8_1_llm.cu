#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel_interleaved_warp_unrolling8_1(int *input, int *temp_array, int size)
{
    int tid = threadIdx.x;
    int index = blockDim.x * blockIdx.x * 8 + tid;
    int *i_data = input + blockDim.x * blockIdx.x * 8;

    if ((index + 7 * blockDim.x) < size)
    {
        // Use local variables for reduction to facilitate optimized memory access
        int sum = input[index] + input[index + blockDim.x] + input[index + 2 * blockDim.x]
                + input[index + 3 * blockDim.x] + input[index + 4 * blockDim.x]
                + input[index + 5 * blockDim.x] + input[index + 6 * blockDim.x]
                + input[index + 7 * blockDim.x];

        input[index] = sum;
    }

    __syncthreads();

    // Unroll the loop to optimize inter-thread communication
    for (int offset = blockDim.x / 2; offset >= 64; offset /= 2)
    {
        if (tid < offset)
        {
            i_data[tid] += i_data[tid + offset];
        }
        __syncthreads();
    }

    // Use warp-level operations without __syncthreads for efficiency
    if (tid < 32)
    {
        volatile int *vsmem = i_data;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write the result of this block to the output array
    if (tid == 0)
    {
        temp_array[blockIdx.x] = i_data[0];
    }
}