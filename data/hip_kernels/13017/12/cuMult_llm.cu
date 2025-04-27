#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuMult(int *a, int *b, int *c, int wA, int wB, int hA)
{
    // Shared memory for tile of Matrix A and B
    extern __shared__ int sharedMem[];
    int* tileA = sharedMem;
    int* tileB = sharedMem + blockDim.y * wA;

    // Block index
    int blockRow = blockIdx.y * blockDim.y;
    int blockCol = blockIdx.x * blockDim.x;

    // Thread index
    int row = blockRow + threadIdx.y;
    int col = blockCol + threadIdx.x;

    int sum = 0;

    // Loop over tiles of the input in steps of blockDim.x and blockDim.y
    for (int m = 0; m < (wA + blockDim.x - 1) / blockDim.x; ++m) {
        // Load tiles into shared memory
        if (row < hA && m * blockDim.x + threadIdx.x < wA)
            tileA[threadIdx.y * wA + threadIdx.x] = a[row * wA + m * blockDim.x + threadIdx.x];
        else
            tileA[threadIdx.y * wA + threadIdx.x] = 0;
        
        if (col < wB && m * blockDim.y + threadIdx.y < wA)
            tileB[threadIdx.y * wB + threadIdx.x] = b[(m * blockDim.y + threadIdx.y) * wB + col];
        else
            tileB[threadIdx.y * wB + threadIdx.x] = 0;

        __syncthreads();

        // Perform multiplication of the partial tiles
        for (int k = 0; k < blockDim.x; ++k) {
            sum += tileA[threadIdx.y * wA + k] * tileB[k * wB + threadIdx.x];
        }

        __syncthreads();
    }

    // Write back the result
    if (row < hA && col < wB) {
        c[row * wB + col] = sum;
    }
}