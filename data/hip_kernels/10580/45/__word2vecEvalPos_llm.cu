#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __word2vecEvalPos(int nrows, int ncols, int *W, int *LB, int *UB, float *A, float *B, float *Retval) {
    // Calculate the unique thread index within the grid
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure that the thread only processes valid data
    if (row < nrows) {
        float temp = 0.0f; // Initialize temporary accumulator variable
        int start = LB[row]; // Get lower bound for the current row
        int end = UB[row]; // Get upper bound for the current row
        for (int col = start; col <= end; ++col) { 
            temp += A[row * ncols + col] * B[col]; // Accumulate partial result
        }
        Retval[row] = temp; // Store result
    }
}