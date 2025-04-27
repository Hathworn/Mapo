#include "hip/hip_runtime.h"
#include "includes.h"

#define N  64

__global__ void matrixMulGPU(int *a, int *b, int *c)
{
    // Utilize shared memory for performance optimization
    __shared__ int shared_a[N][N];
    __shared__ int shared_b[N][N];

    int row = threadIdx.x + blockIdx.x * blockDim.x;
    int col = threadIdx.y + blockIdx.y * blockDim.y;
    int val = 0;

    for (int k = 0; k < N; k += blockDim.x) {
        // Load data into shared memory
        if (row < N && (k + threadIdx.y) < N)
            shared_a[threadIdx.x][threadIdx.y] = a[row * N + k + threadIdx.y];
        
        if (col < N && (k + threadIdx.x) < N)
            shared_b[threadIdx.x][threadIdx.y] = b[(k + threadIdx.x) * N + col];
        
        __syncthreads();

        // Accumulate product results
        for (int n = 0; n < blockDim.x; ++n)
            val += shared_a[threadIdx.x][n] * shared_b[n][threadIdx.y];
        
        __syncthreads();
    }

    if (row < N && col < N)
        c[row * N + col] = val;
}