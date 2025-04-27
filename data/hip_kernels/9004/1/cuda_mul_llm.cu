#include "hip/hip_runtime.h"
#include "includes.h"

#define MAT_TYPE double
#define MAT_SIZE 1024
#define N MAT_SIZE
#define N2 MAT_SIZE*MAT_SIZE

#define BLOCK 256
#define THREAD 512

void stopwatch(int);

__global__ void cuda_mul(MAT_TYPE* A, MAT_TYPE* B, MAT_TYPE* C, int w)
{
    // Calculate thread row and column within the matrix
    int tx = blockIdx.x * blockDim.x + threadIdx.x;
    int ty = blockIdx.y * blockDim.y + threadIdx.y;
    int tid = ty * w + tx;

    if (tx < w && ty < w) // Ensure within bounds
    {
        MAT_TYPE v = 0;

        // Use shared memory for efficient data reuse
        __shared__ MAT_TYPE As[THREAD];
        __shared__ MAT_TYPE Bs[THREAD];

        for (int i = 0; i < w; i += BLOCK)
        {
            As[threadIdx.y * blockDim.x + threadIdx.x] = A[ty * w + (i + threadIdx.x)];
            Bs[threadIdx.y * blockDim.x + threadIdx.x] = B[(i + threadIdx.y) * w + tx];

            __syncthreads(); // Synchronize to ensure all data is loaded into shared memory

            for (int j = 0; j < BLOCK && (i + j) < w; ++j)
            {
                v += As[threadIdx.y * blockDim.x + j] * Bs[j * blockDim.x + threadIdx.x];
            }

            __syncthreads(); // Synchronize before loading new data into shared memory
        }

        C[tid] = v;
    }
}