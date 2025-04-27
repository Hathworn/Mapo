#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_2dfd(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    // global to line index
    unsigned int ix  = blockIdx.x * blockDim.x + threadIdx.x;

    // smem idx for current point
    unsigned int stx = threadIdx.x + NPAD;
    unsigned int idx  = ix + iStart * nx;

    // shared memory for x dimension
    __shared__ float line[BDIMX + NPAD2];

    // a coefficient related to physical properties
    const float alpha = 0.12f;

    // register for y value
    float yval[9];

    // Cache initial y values
    for (int i = 0; i < 8; i++) yval[i] = g_u2[idx + (i - 4) * nx];

    // skip for the bottom most y value
    int iskip = NPAD * nx;

    // Loop unrolling and shared memory optimization
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // get yval[8] here for next computation
        yval[8] = g_u2[idx + iskip];

        // Efficient shared memory access
        if(threadIdx.x < NPAD)
        {
            line[threadIdx.x]  = g_u2[idx - NPAD];
            line[stx + BDIMX]  = g_u2[idx + BDIMX];
        }

        line[stx] = yval[4];
        __syncthreads();

        // Boundary check and computation
        if (ix < nx - NPAD)
        {
            // Use registers for temporary variables
            float tmp = coef[0] * line[stx] * 2.0f;

            #pragma unroll
            for(int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (line[stx - d] + line[stx + d]);
            }

            #pragma unroll
            for(int d = 1; d <= 4; d++)
            {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Efficiently update g_u1 with computed values
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // Shift y values for next iteration
        yval[0] = yval[1]; yval[1] = yval[2]; yval[2] = yval[3]; yval[3] = yval[4];
        yval[4] = yval[5]; yval[5] = yval[6]; yval[6] = yval[7]; yval[7] = yval[8];

        // Advance global index
        idx  += nx;
        __syncthreads();
    }
}