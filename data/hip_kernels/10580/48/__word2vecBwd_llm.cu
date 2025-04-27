#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void __word2vecBwd(int nrows, int ncols, int *WA, int *WB, float *A, float *B, float *C, float lrate) {
    int row = blockIdx.x * blockDim.x + threadIdx.x;  // Compute row based on block and thread indices
    if (row < nrows) {  // Check if row index is within bounds
        int w = WA[row];  // Load WA and WB only once
        int w2 = WB[row];
        float *a = &A[w * ncols];  // Compute offset for A and B
        float *b = &B[w2 * ncols];
        float *c = &C[row * ncols];
        for (int col = 0; col < ncols; ++col) {  // Loop through columns
            float grad = c[col] * lrate;  // Compute gradient multiplied by the learning rate
            atomicAdd(&a[col], grad);  // Atomic addition to prevent data races
            atomicAdd(&b[col], grad);  // Atomic addition to prevent data races
        }
    }
}