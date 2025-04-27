#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopyToTransDestFast(float* srcStart, float* destStart, unsigned int srcCopyWidth, unsigned int srcCopyHeight, unsigned int srcJumpSize, unsigned int destJumpSize) {
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to avoid out-of-bounds memory access
    if (idxX < srcCopyWidth && idxY < srcCopyHeight) {
        unsigned int srcReadIdx = idxY * srcJumpSize + idxX;
        unsigned int destWriteIdx = idxX * destJumpSize + idxY;
        
        // Use padded shared memory to avoid bank conflicts
        __shared__ float smem[COPY_BLOCK_SIZE][COPY_BLOCK_SIZE + 1];
        
        smem[threadIdx.y][threadIdx.x] = srcStart[srcReadIdx];
        __syncthreads();
        
        destStart[destWriteIdx] = smem[threadIdx.x][threadIdx.y];
    }
}