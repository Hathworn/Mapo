#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kMultTransFast(float* a, float* b, float* dest, unsigned int width, unsigned int height, unsigned int bJumpWidth) {
    const unsigned int idxY = blockIdx.y * blockDim.y + threadIdx.y;
    const unsigned int idxX = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int idx = idxY * width + idxX;

    // Use bank conflict-free shared memory access
    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];

    // Calculate the starting position for reading from 'b'
    const unsigned int bBlockReadStart = blockDim.x * blockIdx.x * bJumpWidth + blockIdx.y * blockDim.y;

    // Load data into shared memory
    if (idxX < width && idxY < height) {
        smem[threadIdx.y][threadIdx.x] = b[bBlockReadStart + threadIdx.y * bJumpWidth + threadIdx.x];
    }
    __syncthreads();

    // Perform the element-wise multiplication
    if (idxX < width && idxY < height) {
        dest[idx] = a[idx] * smem[threadIdx.y][threadIdx.x];
    }
}