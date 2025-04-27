#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_MM(float *a, float *b, float *c, int wA, int wB, int hA)
{
    // global index
    int gidx = blockDim.x * blockIdx.x + threadIdx.x;  // col
    int gidy = blockDim.y * blockIdx.y + threadIdx.y;  // row

    if (gidx < wB && gidy < hA)
    {
        float sum = 0.f;
        // unroll loop for better performance
        for (int k = 0; k < wA; k += 4)
        {
            sum += a[gidy * wA + k] * b[k * wB + gidx];
            sum += a[gidy * wA + k + 1] * b[(k + 1) * wB + gidx];
            sum += a[gidy * wA + k + 2] * b[(k + 2) * wB + gidx];
            sum += a[gidy * wA + k + 3] * b[(k + 3) * wB + gidx];
        }
        c[gidy * wB + gidx] = sum;
    }
}