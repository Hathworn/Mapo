#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMulCUDA5(float *C, float *A, float *B, unsigned int n)
{
    // Define the starting and ending row and column for each thread block
    int startRow = blockIdx.y * blockDim.y + threadIdx.y;
    int startCol = blockIdx.x * blockDim.x + threadIdx.x;

    // Load matrices dimensions
    const int tileWidth = blockDim.x;
    const int tileHeight = blockDim.y;

    // Allocate shared memory for A and B tiles
    __shared__ float A_S[32 * 32];
    __shared__ float B_S[32 * 32];

    // Initialize compute register
    float sum = 0.0f;

    // Loop over tiles
    for (int tileIdx = 0; tileIdx < n / tileWidth; ++tileIdx) {
        // Load tile from global memory into shared memory
        int AstartIdx = startRow * n + tileIdx * tileWidth + threadIdx.x;
        int BstartIdx = (tileIdx * tileHeight + threadIdx.y) * n + startCol;

        A_S[threadIdx.y * tileWidth + threadIdx.x] = A[AstartIdx];
        B_S[threadIdx.y * tileWidth + threadIdx.x] = B[BstartIdx];

        // Synchronize all threads to make sure the tile is loaded
        __syncthreads();

        // Compute partial result
        for (int k = 0; k < tileWidth; ++k) {
            sum += A_S[threadIdx.y * tileWidth + k] * B_S[k * tileWidth + threadIdx.x];  
        }

        // Synchronize again to avoid any overlap
        __syncthreads();
    }

    // Write final result to global memory
    C[startRow * n + startCol] = sum;
}