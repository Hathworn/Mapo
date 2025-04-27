#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __word2vecEvalNeg(int nrows, int ncols, int *WA, int *WB, float *A, float *B, float *Retval) {
    // Calculate unique thread identifier
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    if (row < nrows) {
        float sum = 0.0f;
        // Optimize memory access pattern by using shared memory
        __shared__ float sharedA[256];  
        __shared__ float sharedB[256];

        for (int col = 0; col < ncols; col += 256) {
            int idx = col + threadIdx.x;
            if (idx < ncols) {
                sharedA[threadIdx.x] = A[row * ncols + idx];
                sharedB[threadIdx.x] = B[idx];
            }
            __syncthreads();

            for (int i = 0; i < 256; ++i) {
                if (col + i < ncols) {
                    sum += sharedA[i] * sharedB[i];
                }
            }
            __syncthreads();
        }
        Retval[row] = sum;
    }
}