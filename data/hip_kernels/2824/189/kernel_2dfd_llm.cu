#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stx = threadIdx.x + NPAD;
    unsigned int idx = ix + iStart * nx;

    __shared__ float line[BDIMX + NPAD2];

    const float alpha = 0.12f;
    float yval[9];

    #pragma unroll
    for (int i = 0; i < 8; i++) yval[i] = g_u2[idx + (i - 4) * nx];

    int iskip = NPAD * nx;
    
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // Load next Y value
        yval[8] = g_u2[idx + iskip];

        // Load surrounding X values into shared memory
        if (threadIdx.x < NPAD)
        {
            line[threadIdx.x] = g_u2[idx - NPAD];
            line[stx + BDIMX] = g_u2[idx + BDIMX];
        }
        line[stx] = yval[4];
        __syncthreads();

        // Perform computation only if within bounds
        if ((ix >= NPAD) && (ix < nx - NPAD))
        {
            // Initialize center point computation
            float tmp = coef[0] * line[stx] * 2.0f;

            // Compute contributions from surrounding points in X and Y
            #pragma unroll
            for (int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (line[stx - d] + line[stx + d]);
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Update the output value based on computed value
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Slide Y values down for the next iteration
        #pragma unroll
        for (int i = 0; i < 8; i++)
        {
            yval[i] = yval[i + 1];
        }

        // Advance index for global memory access
        idx += nx;
        __syncthreads();
    }
}