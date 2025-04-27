#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define BLOCKSIZE 32

// Optimized kernel
__global__ void nmfcpy(float *mat, float *matcp, int m, int n) {
    int row = blockIdx.y * blockDim.y + threadIdx.y; // Compute global row index
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Compute global column index
    int idx = row * n + col; // Compute linear index

    if (row < m && col < n) {
        mat[idx] = matcp[idx]; // Perform the copy operation
    }
}