#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __dds0(int nrows, int ncols, float *A, float *B, int *Cir, int *Cjc, float *P) {
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (idx >= nrows * ncols) return;

    // Compute row and column indices
    int row = idx / ncols;
    int col = idx % ncols;
    
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sharedMem[];

    // Perform operations
    sharedMem[threadIdx.x] = A[idx] * B[col] + P[Cjc[col] + Cir[row]];

    // Write the result back to global memory
    A[idx] = sharedMem[threadIdx.x];
}