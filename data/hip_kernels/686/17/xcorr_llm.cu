#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xcorr(float *d_i1, float *d_i2, float *d_icorr, int m1, int n1, int m2, int n2)
{
    // Thread and block indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int row_out = blockIdx.y * blockDim.y + ty;
    int col_out = blockIdx.x * blockDim.x + tx;
    int row_st = row_out - (m2 - 1);
    int col_st = col_out - (n2 - 1);

    float corr = 0; // Initialize correlation variable

    // Only process valid output locations
    if (row_out >= 0 && row_out < m1 + m2 - 1 && col_out >= 0 && col_out < n1 + n2 - 1)
    {
        // Optimize memory access by reducing condition checks
        #pragma unroll
        for (int i = 0; i < m2; i++)
        {
            #pragma unroll
            for (int j = 0; j < n2; j++)
            {
                int d_i1_row = row_st + i;
                int d_i1_col = col_st + j;
                if (d_i1_row >= 0 && d_i1_row < m1 && d_i1_col >= 0 && d_i1_col < n1)
                {
                    // Perform convolution
                    corr += d_i1[d_i1_row + d_i1_col * m1] * d_i2[i + j * m2];
                }
            }
        }
        // Assign correlation variable to proper location in final image
        d_icorr[row_out + col_out * (m1 + m2 - 1)] = corr;
    }
}