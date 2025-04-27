#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTranspose(float* a, float* dest, int width, int height) {
    // Calculate global indices
    const int bx = blockIdx.x * blockDim.x;
    const int by = blockIdx.y * blockDim.y;
    const int tx = bx + threadIdx.x;
    const int ty = by + threadIdx.y;

    // Declare shared memory with padding to avoid bank conflicts
    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];
    
    // Load data into shared memory only if within bounds
    if (tx < width && ty < height) {
        smem[threadIdx.y][threadIdx.x] = a[ty * width + tx];
    }
    __syncthreads();

    // Transpose block and write to the destination matrix if within bounds
    if (by + threadIdx.x < height && bx + threadIdx.y < width) {
        dest[(bx + threadIdx.y) * height + (by + threadIdx.x)] = smem[threadIdx.x][threadIdx.y];
    }
}