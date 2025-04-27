#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd_last(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    // Global index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idx = ix + iStart * nx;
    
    // Shared memory index
    unsigned int stx = threadIdx.x + NPAD;
    
    // Shared memory for u2
    __shared__ float tile[BDIMX + NPAD2];
    
    const float alpha = 0.12f;
    
    // Register for y values
    float yval[9];

    // Preload values into yval
    for (int i = 0; i < 8; i++) yval[i] = g_u2[idx + (i - 4) * nx];
    int iskip = NPAD * nx;

    // Iterate over y dimension
    for (int iy = iStart; iy < iEnd; iy++)
    {
        yval[8] = g_u2[idx + iskip];

        // Load halo and main elements into shared memory
        if (threadIdx.x < NPAD)
        {
            tile[threadIdx.x] = g_u2[idx - NPAD];
            tile[stx + BDIMX] = g_u2[idx + BDIMX];
        }
        
        tile[stx] = yval[4];
        __syncthreads();

        if ((ix >= NPAD) && (ix < nx - NPAD))
        {
            float tmp = coef[0] * tile[stx] * 2.0f;

            // Compute stencil in x direction
            #pragma unroll
            for (int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (tile[stx - d] + tile[stx + d]);
            }

            // Compute stencil in y direction
            #pragma unroll
            for (int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Time update
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Shift down yval for the next iteration
        #pragma unroll 8
        for (int i = 0; i < 8; i++)
        {
            yval[i] = yval[i + 1];
        }

        // Advance global index for next y plane
        idx += nx;
        __syncthreads();
    }
}