#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mysgemmNT(const float *A, int lda, const float *B, int ldb, float* C, int ldc, int k, float alpha, float beta) {
    // Partial results
    float c[TILE_N] = {0.0f};
    int mid = threadIdx.y * blockDim.x + threadIdx.x; // Flattened id
    int m = blockIdx.x * TILE_M + mid;
    int n = blockIdx.y * TILE_N + threadIdx.x;
    
    // Use shared memory to store tile of B
    __shared__ float b_s[TILE_TB_HEIGHT][TILE_N];

    for (int i = 0; i < k; i += TILE_TB_HEIGHT) {
        // Load the tile of B into shared memory
        if (n < TILE_N) { 
            b_s[threadIdx.y][threadIdx.x] = B[n + (i+threadIdx.y)*ldb];
        }
        __syncthreads();

        // Compute partial results
        for (int j = 0; j < TILE_TB_HEIGHT; j++) {
            float a = (m < TILE_M) ? A[m + (i+j)*lda] : 0.0f; // Avoid out of bounds
            for (int kk = 0; kk < TILE_N; kk++) {
                c[kk] += a * b_s[j][kk];
            }
        }
        __syncthreads();
    }

    // Write results back with bounds checks
    if (m < TILE_M) {
        int t = ldc * blockIdx.y * TILE_N + m;
        for (int i = 0; i < TILE_N; i++) {
            if ((t+i*ldc) < ldc) { // Ensure within C matrix bounds
                C[t+i*ldc] = C[t+i*ldc] * beta + alpha * c[i];
            }
        }
    }
}