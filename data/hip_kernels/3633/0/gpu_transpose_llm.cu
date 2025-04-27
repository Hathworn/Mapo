#include "hip/hip_runtime.h"
#include "includes.h"
int row = 0;
int col = 0;
using namespace std;

__global__ void gpu_transpose(float *dst, float *A, int col, int row) {
    // Calculate row and column indices directly
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds
    if (x < col && y < row) {
        // Swap the elements
        dst[y * col + x] = A[x * row + y];
    }
}