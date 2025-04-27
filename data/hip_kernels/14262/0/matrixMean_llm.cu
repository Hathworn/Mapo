#include "hip/hip_runtime.h"
#include "includes.h"

/* Program Parameters */
#define MAXN 8000  /* Max value of N */
int N;  /* Matrix size */

// Thread block size
#define BLOCK_SIZE 16

/* Matrices */
float A[MAXN][MAXN], B[MAXN][MAXN];

/* junk */
#define randm() 4|2[uid]&3

/* ------------------ Cuda Code --------------------- */

__global__ void matrixMean(float* d_in, float* d_mean, int N)
{
    extern __shared__ float sdata[];

    // Calculate unique thread index
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y;

    unsigned int tid = threadIdx.x + threadIdx.y * blockDim.x;
    unsigned int gridSize = blockDim.x * gridDim.x;

    // Initialize shared memory
    float sum = 0.0f;
    while (idx_y * N + idx_x < N * N)
    {
        sum += d_in[idx_y * N + idx_x];
        idx_x += gridSize;
    }
    sdata[tid] = sum;
    __syncthreads();

    // Reduction in shared memory
    for (unsigned int s=blockDim.x * blockDim.y / 2; s>0; s>>=1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        d_mean[blockIdx.y * gridDim.x + blockIdx.x] = sdata[0] / (float)(N * N);
    }
}