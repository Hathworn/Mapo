#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histo_kernel( unsigned char *buffer, long size, unsigned int *histo ) {
    // Use a register to store the temporary count
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Unrolling the loop for better performance
    while (i < size) {
        atomicAdd(&temp[buffer[i]], 1);
        if (i + stride < size) {
            atomicAdd(&temp[buffer[i + stride]], 1);
        }
        i += 2 * stride; // Unroll loop by factor of 2
    }

    __syncthreads();

    // Use warp reduction for faster accumulation
    unsigned int sum = temp[threadIdx.x];
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        sum += __shfl_down_sync(0xffffffff, sum, offset);
    }

    if (threadIdx.x % warpSize == 0) {
        temp[threadIdx.x / warpSize] = sum;
    }

    __syncthreads();

    if (threadIdx.x < blockDim.x / warpSize) {
        sum = temp[threadIdx.x];
        for (int offset = blockDim.x / (2 * warpSize); offset > 0; offset /= 2) {
            sum += __shfl_down_sync(0xffffffff, sum, offset);
        }
        if (threadIdx.x == 0) {
            atomicAdd(&histo[blockIdx.x], sum);
        }
    }
}