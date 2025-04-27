#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2dfd_last(float *g_u1, float *g_u2, const int nx, const int iStart, const int iEnd) {
    // global to slice : global grid idx for (x,y) plane
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // smem idx for current point
    unsigned int stx = threadIdx.x + NPAD;
    unsigned int idx = ix + iStart * nx;

    // shared memory for u2 with size [4+16+4]
    __shared__ float tile[BDIMX + NPAD2];

    const float alpha = 0.12f;

    // register for y value
    float yval[9];

    for (int i = 0; i < 8; i++)
        yval[i] = g_u2[idx + (i - 4) * nx];

    // to be used in z loop
    int iskip = NPAD * nx;

    #pragma unroll 9
    for (int iy = iStart; iy < iEnd; iy++) {
        // get front3 here
        yval[8] = g_u2[idx + iskip];

        // Load halo regions into shared memory
        if (threadIdx.x < NPAD) {
            tile[threadIdx.x] = g_u2[idx - NPAD];
            tile[stx + BDIMX] = g_u2[idx + BDIMX];
        }

        tile[stx] = yval[4];
        __syncthreads(); // Synchronize threads within block

        if ((ix >= NPAD) && (ix < nx - NPAD)) {
            // 8rd fd operator
            float tmp = coef[0] * tile[stx] * 2.0f;

            #pragma unroll
            for (int d = 1; d <= 4; d++) {
                tmp += coef[d] * (tile[stx - d] + tile[stx + d]);
            }

            #pragma unroll
            for (int d = 1; d <= 4; d++) {
                tmp += coef[d] * (yval[4 - d] + yval[4 + d]);
            }

            // Modified computation: reduce global memory accesses by using registers
            g_u1[idx] = yval[4] + yval[4] - g_u1[idx] + alpha * tmp;
        }

        #pragma unroll 8
        for (int i = 0; i < 8; i++) {
            yval[i] = yval[i + 1];
        }

        // advancd on global idx
        idx += nx;
        __syncthreads();
    }
}