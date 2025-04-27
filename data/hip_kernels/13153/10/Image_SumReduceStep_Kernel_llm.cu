#include "hip/hip_runtime.h"
#include "includes.h"

// Define a macro for handling warp-level reduction
#define WARP_SIZE 32

__global__ void Image_SumReduceStep_Kernel(int* devBufIn, int* devBufOut, int lastBlockSize)
{
    __shared__ int sharedMem[512];
    int globalIdx = 512 * blockIdx.x + threadIdx.x;
    int localIdx = threadIdx.x;

    // Initialize shared memory to zero
    sharedMem[localIdx] = (localIdx < 256 && blockIdx.x == gridDim.x - 1 && localIdx >= lastBlockSize) ? 0 : devBufIn[globalIdx];
    sharedMem[localIdx + 256] = (localIdx < 256 && blockIdx.x == gridDim.x - 1 && localIdx + 256 >= lastBlockSize) ? 0 : devBufIn[globalIdx + 256];

    __syncthreads();

    // Reduce using a single shared memory array, avoiding switching
    for (int stride = 256; stride > WARP_SIZE; stride >>= 1) {
        if (localIdx < stride / 2) {
            sharedMem[localIdx] += sharedMem[localIdx + stride / 2];
        }
        __syncthreads();
    }

    // Warp-level reduction
    if (localIdx < WARP_SIZE) {
        for (int stride = WARP_SIZE; stride > 0; stride >>= 1) {
            sharedMem[localIdx] += sharedMem[localIdx + stride];
            __syncthreads();
        }
    }

    // Write final result to global memory
    if (localIdx == 0) {
        devBufOut[blockIdx.x] = sharedMem[0];
    }
}