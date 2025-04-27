#include "hip/hip_runtime.h"
#include "includes.h"

/* Program Parameters */
#define N 8000  /* Matrix size */
int blocks_per_grid = 32;
int threads_per_block = 256;

/* Matrices */
float A[N*N], B[N*N];

/* CUDA arrays */
float *A_d, *B_d;

/* Optimize matrixNorm kernel function */
__global__ void matrixNorm(float* A_dd, float* B_dd, int N_d) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to cache columns to reduce global memory access
    extern __shared__ float shared_col[];

    if (idx < N_d) {
        // Load entire column into shared memory
        for (int row = threadIdx.x; row < N_d; row += blockDim.x) {
            shared_col[row] = A_dd[row * N_d + idx];
        }
        __syncthreads();

        // Compute the mean
        float mu = 0.0;
        for (int row = 0; row < N_d; row++) {
            mu += shared_col[row];
        }
        mu /= N_d;

        // Compute the standard deviation
        float sigma = 0.0;
        for (int row = 0; row < N_d; row++) {
            sigma += powf(shared_col[row] - mu, 2.0);
        }
        sigma /= N_d;
        sigma = sqrt(sigma);

        // Normalize the column
        for (int row = threadIdx.x; row < N_d; row += blockDim.x) {
            B_dd[row * N_d + idx] = (sigma == 0.0) ? 0.0 : ((shared_col[row] - mu) / sigma);
        }
    }
}