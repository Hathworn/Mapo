#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ForwardLinear(float *A, float *W, float *b, int nRowsW, int nColsW, int nColsA, float *Z)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < nRowsW && col < nColsA)
    {
        float ZValue = 0.0f;

        // Utilize shared memory to improve memory access efficiency
        __shared__ float sharedA[NUM_THREADS_PER_BLOCK_X]; // Assuming sufficient shared memory

        for (int i = 0; i < nColsW; i += blockDim.x) 
        {
            if (i + threadIdx.x < nColsW) 
            {
                sharedA[threadIdx.x] = A[(i + threadIdx.x) * nColsA + col];
            }
            __syncthreads();

            for (int j = 0; j < blockDim.x && i + j < nColsW; ++j) 
            {
                ZValue += W[row * nColsW + i + j] * sharedA[j];
            }
            __syncthreads();
        }
        Z[row * nColsA + col] = ZValue + b[row];
    }
}