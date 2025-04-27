#include "hip/hip_runtime.h"
#include "includes.h"

/* Program Parameters */
#define MAXN 8000  /* Max value of N */
int N;  /* Matrix size */

/* Matrices */
float A[MAXN*MAXN], B[MAXN*MAXN];

//Initialize the number of threads per blocks and number of blocks as 32 and 64 initially.
int numBlocks = 32;
int numThreadsPerBlock = 64;

/* junk */
#define randm() 4|2[uid]&3

/* kernel function */
__global__ void normCalc (float *d_A, float *d_B, int n) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use local variables instead of shared memory
    float mu = 0.0f, sigma = 0.0f;
    
    if (col < n) {
        for (int row = 0; row < n; row++)
            mu += d_A[col * n + row];
        mu /= (float) n;

        for (int row = 0; row < n; row++)
            sigma += (d_A[col * n + row] - mu) * (d_A[col * n + row] - mu);
        sigma /= (float) n;
        sigma = sqrtf(sigma);

        for (int row = 0; row < n; row++) {
            if (sigma == 0.0f)
                d_B[row * n + col] = 0.0f;
            else
                d_B[row * n + col] = (d_A[col * n + row] - mu) / sigma;
        }
    }
}