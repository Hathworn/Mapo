#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMat(double *A, double *B, double *C, int N)
{
    // Use shared memory to optimize memory access
    __shared__ double Asub[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ double Bsub[BLOCK_SIZE][BLOCK_SIZE];

    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int row = blockDim.y * blockIdx.y + threadIdx.y;

    if (col < N && row < N) {
        // Load data into shared memory for faster access
        Asub[threadIdx.y][threadIdx.x] = A[row * N + col];
        Bsub[threadIdx.y][threadIdx.x] = B[row * N + col];
        __syncthreads(); // Synchronize to ensure shared memory is loaded

        // Compute the sum
        C[row * N + col] = Asub[threadIdx.y][threadIdx.x] + Bsub[threadIdx.y][threadIdx.x];
    }
}
```
