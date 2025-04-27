#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    // Calculate the global index
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Shared memory index for current point
    unsigned int stx = threadIdx.x + NPAD;
    unsigned int idx = ix + iStart * nx;

    // Shared memory for x dimension
    __shared__ float line[BDIMX + NPAD2];

    // A coefficient related to physical properties
    const float alpha = 0.12f;

    // Register array for y values
    float yval[9];

    // Prefetch initial data
    for (int i = 0; i < 8; i++) yval[i] = g_u2[idx + (i - 4) * nx];

    // Skip index for the bottommost y value
    int iskip = NPAD * nx;

    // Loop over the y-dimension
    #pragma unroll 9
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // Fetch the next yval
        yval[8] = g_u2[idx + iskip];

        // Update shared memory with halo and current row
        if(threadIdx.x < NPAD)
        {
            line[threadIdx.x] = g_u2[idx - NPAD];
            line[stx + BDIMX] = g_u2[idx + BDIMX];
        }
        line[stx] = yval[4];
        __syncthreads();

        // 8-point finite difference operator
        if (ix >= NPAD && ix < nx - NPAD)
        {
            // Calculate center point contribution
            float tmp = coef[0] * line[stx] * 2.0f;

            // Calculate spatial contributions
            #pragma unroll
            for(int d = 1; d <= 4; d++) 
            {
                tmp += coef[d] * (line[stx - d] + line[stx + d]);
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Update result in global memory
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Shift yvals up for next iteration
        #pragma unroll 8
        for (int i = 0; i < 8; i++)
        {
            yval[i] = yval[i + 1];
        }

        // Advance global index
        idx += nx;
        __syncthreads();
    }
}