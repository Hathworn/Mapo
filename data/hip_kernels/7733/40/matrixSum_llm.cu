#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(const double * M1, const double * M2, double * Msum, double alpha, double beta, int rows, int cols)
{
    // Utilize shared memory for faster access
    __shared__ double sharedM1[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ double sharedM2[BLOCK_SIZE][BLOCK_SIZE];

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < rows && col < cols) {
        // Load data into shared memory
        sharedM1[threadIdx.x][threadIdx.y] = M1[row + col * rows];
        sharedM2[threadIdx.x][threadIdx.y] = M2[row + col * rows];

        __syncthreads(); // Ensure all threads have loaded their data

        // Compute using shared memory
        Msum[row + col * rows] = alpha * sharedM1[threadIdx.x][threadIdx.y] + beta * sharedM2[threadIdx.x][threadIdx.y];
    }
}
```
