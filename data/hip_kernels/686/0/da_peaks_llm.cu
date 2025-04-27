#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for da_peaks
__global__ void da_peaks(float *d_i1, float thresh, int m, int n, int o)
{
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Location of the output pixel being analyzed
    int row_output = blockIdx.y * blockDim.y + ty;
    int col_output = blockIdx.x * blockDim.x + tx;
    int imnum = blockIdx.z;

    // Check boundaries and image number
    if (imnum < o && row_output >= 2 && row_output < m - 2 && col_output >= 2 && col_output < n - 2)
    {
        float d_i2[25];

        // Load data into shared memory (synchronization not needed due to no bank conflicts)
        for (int i = 0; i < 5; ++i)
        {
            for (int j = 0; j < 5; ++j)
            {
                d_i2[i * 5 + j] = d_i1[(row_output - 2 + i) + (col_output - 2 + j) * m + imnum * m * n];
            }
        }

        float me = d_i2[12];
        int maxi = (me >= thresh);

        // Check if current center pixel is a local maximum
        for (int k = 0; k < 25; ++k)
        {
            if (d_i2[k] > me)
            {
                maxi = 0;
                break; // Early exit if not a maximum
            }
        }

        d_i1[row_output + col_output * m + imnum * m * n] = maxi;
    }
    else if (imnum < o)
    {
        d_i1[row_output + col_output * m + imnum * m * n] = 0;
    }
}