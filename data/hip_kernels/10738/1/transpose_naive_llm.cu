#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// parameter describing the size of matrix A
const int rows = 4096;
const int cols = 4096;

const int BLOCK_SIZE = 16;

// transpose shared kernel

// transpose kernel

__global__ void transpose_naive(float* a, float* b) {
    // Calculate global indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate accurate width and height
    int width = gridDim.x * blockDim.x;
    int height = gridDim.y * blockDim.y;

    // Boundary check to ensure no out-of-bounds access
    if (x < width && y < height) {
        b[y * width + x] = a[x * height + y];  // Access pattern optimized for coalesced memory
    }
}