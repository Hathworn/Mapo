#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16 // Define BLOCK_SIZE for matrix blocks

__global__ void matMultCUDA(const float* a, int lda, const float* b, int ldb, float* c, int ldc, int n)
{
    __shared__ float matA[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float matB[BLOCK_SIZE][BLOCK_SIZE];
    const int tidc = threadIdx.x;
    const int tidr = threadIdx.y;
    const int bidc = blockIdx.x*BLOCK_SIZE;
    const int bidr = blockIdx.y*BLOCK_SIZE;
    
    float results = 0;
    float comp = 0;
    
    for (int j = 0; j < n; j += BLOCK_SIZE) {
        // Load data into shared memory with coalesced accesses
        matA[tidr][tidc] = a[(tidr + bidr) * lda + tidc + j];
        matB[tidr][tidc] = b[(tidr + j) * ldb + tidc + bidc];

        __syncthreads();

        // Compute in register and reduce warp-level synchronization
        #pragma unroll
        for (int i = 0; i < BLOCK_SIZE; i++) {
            float t, product;
            product = matA[tidr][i] * matB[i][tidc];
            comp -= product;
            t = results - comp;
            comp = (t - results) + comp;
            results = t;
        }

        __syncthreads();
    }
    
    // Write results back to global memory
    c[(tidr + bidr) * ldc + tidc + bidc] = results;
}