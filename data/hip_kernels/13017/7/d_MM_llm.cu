#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_MM(float *a, float *b, float *c, int wA, int wB, int hA)
{
    // global index
    int gidx = blockDim.x * blockIdx.x + threadIdx.x;  // col
    int gidy = blockDim.y * blockIdx.y + threadIdx.y;  // row

    // Check valid global indices
    if (gidx < wB && gidy < hA)
    {
        float sum = 0.f;
        int aIndex = gidy * wA;
        int bIndex = gidx;
        // Optimize for-loop to minimize index calculation
        for (int k = 0; k < wA; ++k)
        {
            sum += a[aIndex + k] * b[k * wB + bIndex];
        }
        c[gidy * wB + gidx] = sum;
    }
}