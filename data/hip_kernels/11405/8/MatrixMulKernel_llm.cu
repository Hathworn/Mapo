#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(int *d_x, int *d_y, int *d_z, int Block_Width, int M, int N) {

    // Calculate row and column indexes
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize variable for summation
    int kernelSum = 0;

    // Check bounds
    if (row < N && col < N) {
        // Loop unrolling for faster computation; assumes Block_Width is a multiple of 4
        for (int i = 0; i < Block_Width; i += 4) {
            #pragma unroll
            for (int j = 0; j < 4; ++j) {
                kernelSum += d_x[col * Block_Width + (i + j)] * d_y[(i + j) * Block_Width + row];
            }
        }
        d_z[row * Block_Width + col] = kernelSum;
    }
}