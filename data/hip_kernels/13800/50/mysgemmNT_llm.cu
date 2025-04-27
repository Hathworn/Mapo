#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mysgemmNT(const float *A, int lda, const float *B, int ldb, float *C, int ldc, int k, float alpha, float beta)
{
    // Use shared memory to optimize memory access patterns for A and B
    __shared__ float Asub[32][32]; 
    __shared__ float Bsub[32][32]; 

    float c = 0.0f;
    int m = blockIdx.x * blockDim.x + threadIdx.x;
    int n = blockIdx.y * blockDim.y + threadIdx.y;

    for (int i = 0; i < k; i += 32) {
        // Load data into shared memory tile
        Asub[threadIdx.y][threadIdx.x] = A[m + (i + threadIdx.y) * lda];
        Bsub[threadIdx.y][threadIdx.x] = B[n + (i + threadIdx.x) * ldb];
        __syncthreads();
 
        // Use shared memory to compute tiles
        for (int j = 0; j < 32; ++j) {
            c += Asub[threadIdx.y][j] * Bsub[j][threadIdx.x];
        }
        __syncthreads();
    }

    // Write the final result to the global memory C
    C[m + n * ldc] = C[m + n * ldc] * beta + alpha * c;
}