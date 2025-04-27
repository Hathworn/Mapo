#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mm_tiled(float *dA, float *dB, float *dC, int DIM, int N, int GPUN) {
    int it = blockIdx.y * 32;
    int jt = blockIdx.x * 32;
    int i = it + threadIdx.y;
    int j = jt + threadIdx.x;
    
    __shared__ float sA[32][32]; 
    __shared__ float sB[32][32];

    if (i * DIM + j < GPUN) {
        float sum = 0.0f;

        // Optimization: Reduce register usage by using variables for indexes
        for (int kt = 0; kt < DIM; kt += 32) {
            int rowA = it + threadIdx.y;
            int colA = kt + threadIdx.x;
            int rowB = kt + threadIdx.y;
            int colB = jt + threadIdx.x;

            // Load data into shared memory
            sA[threadIdx.y][threadIdx.x] = dA[rowA * DIM + colA];
            sB[threadIdx.y][threadIdx.x] = dB[rowB * DIM + colB];
            __syncthreads();

            // Compute using shared memory
            for (int k = 0; k < 32; k++) {
                sum += sA[threadIdx.y][k] * sB[k][threadIdx.x];
            }
            __syncthreads();
        }
        
        dC[i * DIM + j] = sum;
    }
}