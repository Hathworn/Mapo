#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xcorr(float *d_i1, float *d_i2, float *d_icorr, int m1, int n1, int m2, int n2) {
    // Thread indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate global row and column indices
    int row_out = blockIdx.y * blockDim.y + ty;
    int col_out = blockIdx.x * blockDim.x + tx;

    // Starting points for convolution
    int row_st = row_out - (m2 - 1);
    int col_st = col_out - (n2 - 1);

    // Initialize correlation variable
    float corr = 0.0f;

    // Ensure that the output index is within bounds
    if (row_out >= 0 && row_out < m1 + m2 - 1 && col_out >= 0 && col_out < n1 + n2 - 1) {
        // Optimize memory access by collapsing loops into a single statement
        for (int i = 0; i < m2; i++) { 
            for (int j = 0; j < n2; j++) {
                int img1_row = row_st + i;
                int img1_col = col_st + j;
                if (img1_row >= 0 && img1_row < m1 && img1_col >= 0 && img1_col < n1) {
                    // Access and multiply only when within bounds to save branch instructions
                    corr += d_i1[img1_row + img1_col * m1] * d_i2[i + j * m2];
                }
            }
        }
        // Assign the computed correlation value to the output array
        d_icorr[row_out + col_out * (m1 + m2 - 1)] = corr;
    }
}