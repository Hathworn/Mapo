#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __word2vecFwd(int nrows, int ncols, int *WA, int *WB, float *A, float *B, float *C) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sA[], sB[];

    // Calculate thread indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (row < nrows && threadIdx.x < ncols) {
        sA[threadIdx.y * ncols + threadIdx.x] = A[row * ncols + threadIdx.x];
        sB[threadIdx.y * ncols + threadIdx.x] = B[row * ncols + threadIdx.x];
    }
    __syncthreads();

    // Compute using shared memory
    if (row < nrows && col < ncols) {
        C[row * ncols + col] = sA[threadIdx.y * ncols + col] + sB[threadIdx.y * ncols + col];
    }
}