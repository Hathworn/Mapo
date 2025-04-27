#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd_last(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    unsigned int ix  = blockIdx.x * blockDim.x + threadIdx.x;

    // Shared memory optimization
    __shared__ float tile[BDIMX + NPAD2];

    // Optimized register usage for yval
    float yval[9];

    const float alpha = 0.12f;
    unsigned int idx  = ix + iStart * nx;
    unsigned int stx = threadIdx.x + NPAD;
    int iskip = NPAD * nx;

    // Load initial values into registers
    for (int i = 0; i < 8; i++) {
        yval[i] = g_u2[idx + (i - 4) * nx];
    }

    // Loop over y dimension
    #pragma unroll 9
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // Prefetch next yval[8] into register
        yval[8] = g_u2[idx + iskip];

        // Load left and right halo into shared memory
        if(threadIdx.x < NPAD)
        {
            tile[threadIdx.x] = g_u2[idx - NPAD];
            tile[stx + BDIMX] = g_u2[idx + BDIMX];
        }

        tile[stx] = yval[4];
        __syncthreads();

        if ((ix >= NPAD) && (ix < nx - NPAD))
        {
            float tmp = coef[0] * tile[stx] * 2.0f;

            // Unroll loop for x-dimension finite difference computation
            #pragma unroll
            for(int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (tile[stx - d] + tile[stx + d]);
            }

            // Unroll loop for y-dimension finite difference computation
            #pragma unroll
            for(int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Update global memory
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Shift y values for next iteration
        #pragma unroll 8
        for (int i = 0; i < 8; i++)
        {
            yval[i] = yval[i + 1];
        }

        // Advance to next index in global memory
        idx += nx;
        __syncthreads();
    }
}