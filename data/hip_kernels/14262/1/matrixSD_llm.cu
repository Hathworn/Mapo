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

/* Prototype */
/* ------------------ Cuda Code --------------------- */

/* returns a seed for srand based on the time */
__global__ void matrixSD(float* d_in, float* d_mean, float* d_sd, int N)
{
    extern __shared__ float sdata1[];

    // Calculate global indices
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y;

    unsigned int tid = threadIdx.y;
    unsigned int i = idx_y * N + idx_x;
    
    // Initialize shared memory for current block
    if (idx_x < N && idx_y < N) // Boundary check to ensure threads do not access out-of-bounds memory
    {
        sdata1[tid] = powf(d_in[i] - d_mean[blockIdx.x], 2.0);
    }
    else
    {
        sdata1[tid] = 0.0f; // Assign zero if out of range to prevent incorrect reduction
    }
    __syncthreads();

    // Parallel reduction in shared memory with boundary check
    for (unsigned int s = 1; s < blockDim.y; s *= 2)
    {
        if (tid % (2 * s) == 0 && (tid + s) < blockDim.y)
        {
            sdata1[tid] += sdata1[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        d_sd[blockIdx.x] = sqrtf(sdata1[0] / (float)N);
    }
}