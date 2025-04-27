#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    // Calculate global x index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate shared memory index
    unsigned int stx = threadIdx.x + NPAD;
    unsigned int idx = ix + iStart * nx;

    // Shared memory for the x dimension
    __shared__ float line[BDIMX + NPAD2];

    // Coefficient related to physical properties
    const float alpha = 0.12f;

    // Register for y values
    float yval[9];

    // Initialize yval with surrounding values
    #pragma unroll
    for (int i = 0; i < 8; i++) yval[i] = g_u2[idx + (i - 4) * nx];

    int iskip = NPAD * nx;

    #pragma unroll 9
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // Fetch next y value
        yval[8] = g_u2[idx + iskip];

        // Load halo parts into shared memory
        if (threadIdx.x < NPAD)
        {
            line[threadIdx.x] = g_u2[idx - NPAD];
            line[stx + BDIMX] = g_u2[idx + BDIMX];
        }

        line[stx] = yval[4];
        __syncthreads();

        // Apply the finite difference stencil
        if ((ix >= NPAD) && (ix < nx - NPAD))
        {
            // Center point calculated first
            float tmp = coef[0] * line[stx] * 2.0f;

            // Unroll loop for neighboring points
            #pragma unroll
            for (int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (line[stx - d] + line[stx + d]);
            }

            #pragma unroll
            for (int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Update value with time dimension
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Shift yval buffer for next iteration
        #pragma unroll 8
        for (int i = 0; i < 8 ; i++)
        {
            yval[i] = yval[i + 1];
        }

        // Advance to the next global index
        idx += nx;
        __syncthreads();
    }
}