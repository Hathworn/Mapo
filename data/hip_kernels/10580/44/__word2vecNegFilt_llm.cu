#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __word2vecNegFilt(int nrows, int ncols, int nwords, int *WA, int *WB, float *A, float *B, float lrate, float vexp) {
    // Calculate unique index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (idx < nrows * ncols) {
        int row = idx / ncols;
        int col = idx % ncols;

        // Load values to registers to minimize global memory access
        float a_val = A[row * ncols + col];
        int wa_val = WA[row];
        int wb_val = WB[col];

        // Perform computations
        float grad = lrate * a_val * powf((float)(wa_val + wb_val), vexp);

        // Update weight matrices A and B
        A[row * ncols + col] = a_val - grad;
        B[wa_val * ncols + col] += grad;
    }
}