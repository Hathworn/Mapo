#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTranspose(float* a, float* dest, int width, int height) {
    const int bx = blockIdx.x * blockDim.x;
    const int by = blockIdx.y * blockDim.y;
    const int tx = bx + threadIdx.x;
    const int ty = by + threadIdx.y;

    __shared__ float smem[ADD_BLOCK_SIZE][ADD_BLOCK_SIZE + 1];

    // Load matrix data into shared memory for coalesced reads
    if (tx < width && ty < height) {
        smem[threadIdx.y][threadIdx.x] = a[ty * width + tx];
    }
    __syncthreads();

    // Store transposed data back into global memory
    if ((by + threadIdx.x) < height && (bx + threadIdx.y) < width) {
        dest[(bx + threadIdx.y) * height + by + threadIdx.x] = smem[threadIdx.x][threadIdx.y];
    }
}