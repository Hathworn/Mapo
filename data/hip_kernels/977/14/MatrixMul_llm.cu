#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(int *M, int *N, int *P, int width)
{
    __shared__ int M_shared[blockDim.y][blockDim.x]; // Shared memory for M
    __shared__ int N_shared[blockDim.y][blockDim.x]; // Shared memory for N

    int accu = 0;

    // Block index
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // Thread index
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int i = by * blockDim.y + ty;
    int j = bx * blockDim.x + tx;

    for (int kk = 0; kk < width; kk += blockDim.x) // Iterating in chunks
    {
        // Load M and N into shared memory
        M_shared[ty][tx] = M[i * width + (kk + tx)];
        N_shared[ty][tx] = N[(kk + ty) * width + j];

        __syncthreads(); // Synchronize threads

        for (int k = 0; k < blockDim.x; k++)
        {
            accu += M_shared[ty][k] * N_shared[k][tx];
        }

        __syncthreads(); // Synchronize threads for next iteration
    }

    P[i * width + j] = accu; // Store the result
}