#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// parameter describing the size of matrix A
const int rows = 4096;
const int cols = 4096;

const int BLOCK_SIZE = 16;

// transpose shared kernel

// transpose kernel

__global__ void transpose_shared(float* a, float* b) {
    __shared__ float result[BLOCK_SIZE][BLOCK_SIZE+1]; // Avoid bank conflict

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int width = gridDim.x * blockDim.x;
    int height = gridDim.y * blockDim.y;

    if (x < height && y < width) {
        result[threadIdx.y][threadIdx.x] = a[y * height + x]; // Swap indices
    }
    __syncthreads();
    if (x < width && y < height) {
        b[y * width + x] = result[threadIdx.x][threadIdx.y]; // Correct indexing
    }
}