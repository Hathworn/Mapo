#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopyToTransDestFast(float* srcStart, float* destStart, unsigned int srcCopyWidth, unsigned int srcCopyHeight, unsigned int srcJumpSize, unsigned int destJumpSize) {
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;

    if (idxX < srcCopyWidth && idxY < srcCopyHeight) { // Ensure only valid threads participate
        const unsigned int srcReadIdx = idxY * srcJumpSize + idxX;
        const unsigned int destWriteIdx = idxX * destJumpSize + idxY;

        __shared__ float smem[COPY_BLOCK_SIZE][COPY_BLOCK_SIZE + 1];

        smem[threadIdx.y][threadIdx.x] = srcStart[srcReadIdx]; // Optimize access by reversing indices
        __syncthreads();

        destStart[destWriteIdx] = smem[threadIdx.x][threadIdx.y]; // Write back using reversed indices
    }
}