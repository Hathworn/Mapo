#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_MM_OPT(float *a, float *b, float *c, int wA, int wB, int hA) 
{
#define blockTile 16

    __shared__ float aBlock[blockTile][blockTile];
    __shared__ float bBlock[blockTile][blockTile];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int gx = blockDim.x * bx + tx;  // column
    int gy = blockDim.y * by + ty;  // row

    int a0 = wA * blockTile * by;
    int aD = blockTile;
    int b0 = blockTile * bx;
    int bD = blockTile * wB;

    float sum = 0.f;

    for (int aI = a0, bI = b0; aI <= a0 + wA - 1; aI += aD, bI += bD) 
    {
        // Load matrices into shared memory and prevent out-of-bounds access
        if (gy < hA && gx < wA) 
        {
            aBlock[ty][tx] = a[aI + ty * wA + tx];
        }
        else 
        {
            aBlock[ty][tx] = 0.0f;
        }

        if (gy < wB && gx < hA) 
        {
            bBlock[ty][tx] = b[bI + ty * wB + tx];
        }
        else 
        {
            bBlock[ty][tx] = 0.0f;
        }

        __syncthreads();

        // Compute partial product
        for (int k = 0; k < blockTile; ++k) 
        {
            sum += aBlock[ty][k] * bBlock[k][tx];
        }
        __syncthreads();
    }

    // Write result to global memory only if indices are valid
    if (gy < hA && gx < wB) 
    {
        c[gy * wB + gx] = sum;
    }
}