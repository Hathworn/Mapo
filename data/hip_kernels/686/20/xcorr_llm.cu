#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xcorr(float *d_i1, float *d_i2, float *d_icorr, int m1, int n1, int m2, int n2)
{
    //grab threadID location
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // get output values based on block and thread locations
    int row_out = blockIdx.y * blockDim.y + ty;
    int col_out = blockIdx.x * blockDim.x + tx;

    // Get starting value for the convolution as dictated by m2 and n2
    int row_st = row_out - (m2 - 1);
    int col_st = col_out - (n2 - 1);

    // correlation variable
    float corr = 0.0f;  // initialize correlation variable

    if (row_out >= 0 && row_out < m1 + m2 - 1 && col_out >= 0 && col_out < n1 + n2 - 1)  // ensure output is within bounds of correlation image
    {
        for (int i = 0; i < m2; i++) 
        {
            for (int j = 0; j < n2; j++)
            {
                int ii = row_st + i;
                int jj = col_st + j;
                // Check bounds and compute correlation
                if (ii >= 0 && ii < m1 && jj >= 0 && jj < n1) 
                {
                    corr += d_i1[ii + jj * m1] * d_i2[i + j * m2];
                }
            }
        }
        d_icorr[row_out + col_out * (m1 + m2 - 1)] = corr;  // assign correlation variable to proper location in final image
    }
}