#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction_kernel_complete_unrolling8_1(int * input, int * temp, int size)
{
    int tid = threadIdx.x;
    int index = blockDim.x * blockIdx.x * 8 + threadIdx.x;
    int * i_data = input + blockDim.x * blockIdx.x * 8;
    int sum = 0;

    // Check bounds and perform reduction inline
    if ((index + 7 * blockDim.x) < size) {
        for (int offset = 0; offset < 8; ++offset) {
            sum += input[index + offset * blockDim.x];
        }
        input[index] = sum;
    }
    __syncthreads();

    // Complete unrolling explicitly without branching
    if (blockDim.x >= 1024 && tid < 512) i_data[tid] += i_data[tid + 512];
    __syncthreads();
    if (blockDim.x >= 512 && tid < 256) i_data[tid] += i_data[tid + 256];
    __syncthreads();
    if (blockDim.x >= 256 && tid < 128) i_data[tid] += i_data[tid + 128];
    __syncthreads();
    if (blockDim.x >= 128 && tid < 64) i_data[tid] += i_data[tid + 64];
    __syncthreads();

    // Warp unrolling using volatile to prevent reordering
    if (tid < 32) {
        volatile int * vsmem = i_data;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    if (tid == 0) {
        temp[blockIdx.x] = i_data[0];
    }
}