#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd)
{
    // global to line index
    unsigned int ix  = blockIdx.x * blockDim.x + threadIdx.x;

    // shared memory for x dimension
    __shared__ float line[BDIMX + NPAD2];

    // a coefficient related to physical properties
    const float alpha = 0.12f;

    // register for y value
    float yval[9];

    // Initialize y values
    for (int i = 0; i < 8; i++) {
        unsigned int idx  = ix + (iStart + i - 4) * nx;
        yval[i] = g_u2[idx];
    }

    // loop over the y dimension
    for (int iy = iStart; iy < iEnd; iy++)
    {
        // Calculate global idx for current y-level
        unsigned int idx = ix + iy * nx;

        // Load yval[8] asynchronously
        yval[8] = g_u2[idx + (4 * nx)];

        // read halo part
        if (threadIdx.x < NPAD) {
            line[threadIdx.x]  = g_u2[idx - NPAD];
            line[stx + BDIMX]  = g_u2[idx + BDIMX];
        }

        // load the primary argument 
        line[stx] = yval[4];
        __syncthreads();

        // 8th order finite difference operator
        if (ix >= NPAD && ix < nx - NPAD) {
            float tmp = coef[0] * line[stx] * 2.0f;

            #pragma unroll
            for (int d = 1; d <= 4; d++) {
                tmp += coef[d] * (line[stx - d] + line[stx + d]);
            }

            #pragma unroll
            for (int d = 1; d <= 4; d++) {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }
            
            // Update output with new values
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        // shift the array yval for next computation
        #pragma unroll
        for (int i = 0; i < 8; i++) {
            yval[i] = yval[i + 1];
        }

        __syncthreads(); // Ensure all threads have completed before proceeding
    }
}