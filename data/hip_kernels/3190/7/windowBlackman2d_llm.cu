#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void windowBlackman2d(float* idata, int length, int height)
{
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    int tidy = threadIdx.y + blockIdx.y * blockDim.y;

    // Check if the thread is within bounds
    if (tidx < length && tidy < height)
    {
        // Pre-calculate factors for performance
        float factor_tidy = 2 * PI_F * tidy / (height - 1);
        float factor_tidx = 2 * PI_F * tidx / (length - 1);

        // Calculate Blackman window coefficients
        float cos_term_tidy = cos(factor_tidy);
        float sin_term_tidy = sin(2 * factor_tidy);
        float cos_term_tidx = cos(factor_tidx);
        float sin_term_tidx = sin(2 * factor_tidx);

        // Apply the 2D window function
        idata[tidy * length + tidx] = (0.74 / 2 * -0.5 * cos_term_tidy + 0.16 / 2 * sin_term_tidy)
                                    * (0.74 / 2 * -0.5 * cos_term_tidx + 0.16 / 2 * sin_term_tidx);
    }
}