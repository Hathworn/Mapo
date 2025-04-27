#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopyToTransDestFast(float* srcStart, float* destStart, unsigned int srcCopyWidth, unsigned int srcCopyHeight, unsigned int srcJumpSize, unsigned int destJumpSize) {
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads outside the bounds.
    if (idxX >= srcCopyWidth || idxY >= srcCopyHeight) return;

    const unsigned int srcReadIdx = idxY * srcJumpSize + idxX;
    const unsigned int destWriteIdx = (blockIdx.x * blockDim.x + threadIdx.y) * destJumpSize + blockIdx.y * blockDim.y + threadIdx.x;
    __shared__ float smem[COPY_BLOCK_SIZE][COPY_BLOCK_SIZE + 1];

    // Load input data into shared memory
    smem[threadIdx.y][threadIdx.x] = srcStart[srcReadIdx];
    __syncthreads();

    // Transpose and write data to destination
    destStart[destWriteIdx] = smem[threadIdx.x][threadIdx.y];
}