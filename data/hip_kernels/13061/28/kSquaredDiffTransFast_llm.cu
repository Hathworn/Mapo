```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSquaredDiffTransFast(float* a, float* b, float* dest, unsigned int width, unsigned int bJumpWidth) {
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int idx = idxY * width + idxX;

    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];

    // Calculate a global index for reading b array
    const unsigned int bGlobalIdx = blockDim.x * blockIdx.x * bJumpWidth + blockIdx.y * blockDim.y + threadIdx.y * bJumpWidth + threadIdx.x;

    // Load data into shared memory efficiently
    smem[threadIdx.y][threadIdx.x] = b[bGlobalIdx];
    __syncthreads();

    // Compute squared difference using shared memory
    float diff = a[idx] - smem[threadIdx.y][threadIdx.x];
    dest[idx] = diff * diff;
}