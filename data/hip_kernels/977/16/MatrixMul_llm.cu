#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(int *M, int *N, int *P, int width)
{
    int bx = blockIdx.x;
    int by = blockIdx.y;

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    const int tile_size = 16;

    __shared__ int As[tile_size][tile_size];
    __shared__ int Bs[tile_size][tile_size];

    int aBegin = width * tile_size * by;
    int aEnd   = aBegin + width - 1;
    int aStep  = tile_size;

    int bBegin = tile_size * bx;
    int bStep  = tile_size * width;

    int Csub = 0;

    for (int a = aBegin, b = bBegin; a <= aEnd; a += aStep, b += bStep)
    {
        // Improved memory coalescing by maintaining proper stride
        As[ty][tx] = M[a + width * ty + tx];
        Bs[ty][tx] = N[b + width * ty + tx];
        __syncthreads();

        // No Bank Conflict and improved readability
        for (int k = 0; k < tile_size; ++k)
        {
            Csub += As[ty][k] * Bs[k][tx];
        }
        __syncthreads();
    }

    int c = width * tile_size * by + tile_size * bx;
    P[c + width * ty + tx] = Csub;
}