#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddTransFast(float* a, float* b, float* dest, unsigned int width, unsigned int height, unsigned int bJumpWidth, float scaleA, float scaleB) {
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int idx = idxY * width + idxX;

    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];

    // Coalesced memory access for reading 'b'
    const unsigned int bBlockReadStart = blockDim.x * blockIdx.x * bJumpWidth + blockIdx.y * blockDim.y;
    const unsigned int bIndex = bBlockReadStart + threadIdx.x * bJumpWidth + threadIdx.y;

    smem[threadIdx.y][threadIdx.x] = b[bIndex];
    __syncthreads();

    // Ensure the kernel does not exceed array bounds
    if (idxX < width && idxY < height) {
        dest[idx] = scaleA * a[idx] + scaleB * smem[threadIdx.y][threadIdx.x];
    }
}