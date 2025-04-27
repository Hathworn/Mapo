#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideTransFast(float* a, float* b, float* dest, unsigned int width, unsigned int height, unsigned int bJumpWidth) {
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if thread indices exceed bounds.
    if (idxY >= height || idxX >= width) return;

    const unsigned int idx = idxY * width + idxX;

    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];

    const unsigned int bBlockReadStart = blockDim.x * blockIdx.x * bJumpWidth + blockIdx.y * blockDim.y;

    // Load b into shared memory and ensure all threads have loaded the data.
    if (threadIdx.y < bJumpWidth && (bBlockReadStart + threadIdx.y * bJumpWidth + threadIdx.x) < height * bJumpWidth) {
        smem[threadIdx.x][threadIdx.y] = b[bBlockReadStart + threadIdx.y * bJumpWidth + threadIdx.x];
    }
    __syncthreads();

    // Perform division, using shared memory.
    dest[idx] = __fdividef(a[idx], smem[threadIdx.y][threadIdx.x]);
}