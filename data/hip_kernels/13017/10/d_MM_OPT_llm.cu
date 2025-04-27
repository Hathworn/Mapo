#include "hip/hip_runtime.h"
#include "includes.h"

#define blockTile 16

__global__ void d_MM_OPT(float *a, float *b, float *c, int wA, int wB, int hA)
{
    __shared__ float aBlock[blockTile][blockTile];
    __shared__ float bBlock[blockTile][blockTile];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int gx = blockDim.x * bx + tx;  // column
    int gy = blockDim.y * by + ty;  // row

    int a0 = wA * blockTile * by;
    int aZ = a0 + wA - 1;
    int b0 = blockTile * bx;
    int bD = blockTile * wB;
    float sum = 0.f;

    // Loop over tiles and accumulate results asynchronously
    for(int aI = a0, bI = b0; aI <= aZ; aI += blockTile, bI += bD)
    {
        // Optimize memory access using shared memory
        if ((aI + ty * wA + tx) < (wA * hA)) // Check if within bounds
            aBlock[ty][tx] = a[aI + ty * wA + tx];
        else 
            aBlock[ty][tx] = 0;  // Avoid out-of-bound access

        if ((bI + ty * wB + tx) < (hA * wB)) // Check if within bounds
            bBlock[ty][tx] = b[bI + ty * wB + tx];
        else 
            bBlock[ty][tx] = 0;  // Avoid out-of-bound access

        __syncthreads();

        for(int k = 0; k < blockTile; k++)
        {
            sum += aBlock[ty][k] * bBlock[k][tx];
        }
        __syncthreads(); // Ensure all threads have completed the current tile
    }

    if (gx < wB && gy < hA) // Ensure result is within bounds
        c[gy * wB + gx] = sum;
}