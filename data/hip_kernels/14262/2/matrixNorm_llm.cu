```c
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

/* Optimized kernel function */
__global__ void matrixNorm(float* d_in, float* d_out, float* d_mean, float* d_sd, int N)
{
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Flattened 1D index for 2D matrix
    unsigned int i = idx_y * N + idx_x;

    // Check boundary to ensure threads do not access out of bounds memory
    if (idx_x < N && idx_y < N) {
        if (d_sd[idx_y] == 0.0) {
            d_out[i] = 0.0;
        } else {
            // Use correct index for standard deviation and mean
            d_out[i] = (d_in[i] - d_mean[idx_y]) / d_sd[idx_y];
        }
    }
}