#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd_last(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    // Compute global x index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute shared memory index and global memory index for starting point
    unsigned int stx = threadIdx.x + NPAD;
    unsigned int idx = ix + iStart * nx;

    // Shared memory buffer with padding for stencil computation
    __shared__ float tile[BDIMX + NPAD2];

    const float alpha = 0.12f;

    // Registers to hold y-dimension values for stencil computation
    float yval[9];

    // Load initial values into yval array
    #pragma unroll
    for (int i = 0; i < 8; i++) yval[i] = g_u2[idx + (i - 4) * nx];

    // Precompute index offset for y-dimension loop
    int iskip = NPAD * nx;

    // Loop over y-dimension in the global grid
    #pragma unroll 9
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // Load next y value
        yval[8] = g_u2[idx + iskip];

        // Load boundary values into shared memory using thread synchronization
        if(threadIdx.x < NPAD)
        {
            tile[threadIdx.x] = g_u2[idx - NPAD];
            tile[stx + BDIMX] = g_u2[idx + BDIMX];
        }
        
        // Main data loaded into shared memory
        tile[stx] = yval[4];
        
        // Synchronize to ensure all data is loaded
        __syncthreads();

        // Ensure within proper bounds before computation
        if (ix >= NPAD && ix < nx - NPAD)
        {
            // Implement 8-th order finite difference stencil
            float tmp = coef[0] * tile[stx] * 2.0f;

            #pragma unroll
            for(int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (tile[stx - d] + tile[stx + d]);
            }

            #pragma unroll
            for(int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Update time dimension
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Shift y-values up for next iteration
        #pragma unroll 8
        for (int i = 0; i < 8; i++)
        {
            yval[i] = yval[i + 1];
        }

        // Advance to next row in global index
        idx += nx;
        
        // Synchronization to prevent race conditions
        __syncthreads();
    }
}