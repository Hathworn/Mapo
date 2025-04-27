#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __word2vecPos(int nrows, int ncols, int *W, int *LB, int *UB, float *A, float *B, float lrate) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index >= nrows) return;

    // Load relevant row
    int row = W[index];

    // Iterate over range defined by LB and UB
    for (int col = LB[index]; col < UB[index]; col++) {
        // Compute and update A and B matrices using lrate
        float temp = A[row * ncols + col] * B[col];
        A[row * ncols + col] += lrate * temp;
        B[col] -= lrate * temp;
    }
}