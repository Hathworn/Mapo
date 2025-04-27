#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void xcorr(float *d_i1, float *d_i2, float *d_icorr, int m1, int n1, int m2, int n2)
{
    // Thread indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Output location indices
    int row_out = blockIdx.y * blockDim.y + ty;
    int col_out = blockIdx.x * blockDim.x + tx;

    // Starting indices for convolution
    int row_st = row_out - (m2 - 1);
    int col_st = col_out - (n2 - 1);

    // Initialize correlation variable
    float corr = 0;

    // Check bounds for output
    if (row_out < m1 + m2 - 1 && col_out < n1 + n2 - 1 && row_out >= 0 && col_out >= 0) 
    {
        // Iterate over the kernel dimensions
        for (int i = 0; i < m2; i++) 
        {
            for (int j = 0; j < n2; j++)
            {
                // Ensure indices are within bounds of image
                int row_idx = row_st + i;
                int col_idx = col_st + j;
                if (row_idx >= 0 && row_idx < m1 && col_idx >= 0 && col_idx < n1) 
                {
                    corr += d_i1[row_idx + col_idx * m1] * d_i2[i + j * m2];
                }
            }
        }
        // Write the computed correlation to the output
        d_icorr[row_out + col_out * (m1 + m2 - 1)] = corr;
    }
}