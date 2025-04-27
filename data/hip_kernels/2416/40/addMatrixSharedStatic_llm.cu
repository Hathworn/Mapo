#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addMatrixSharedStatic(int *a, int *b, int *res, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n)
    {
        return;
    }

    int tid = tidx * n + tidy;

    // Load input data into shared memory with stride pattern
    __shared__ int s_a[BLOCK_SIZE][BLOCK_SIZE], s_b[BLOCK_SIZE][BLOCK_SIZE];

    s_a[threadIdx.x][threadIdx.y] = a[tid];
    s_b[threadIdx.x][threadIdx.y] = b[tid];

    // Synchronize to ensure all data is loaded to shared memory
    __syncthreads();

    // Perform calculation and store result 
    int sum = s_a[threadIdx.x][threadIdx.y] + s_b[threadIdx.x][threadIdx.y];
    res[tid] = sum;
}