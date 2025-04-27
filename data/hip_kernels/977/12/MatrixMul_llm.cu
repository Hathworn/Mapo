```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMul(int *M, int *N, int *P, int width)
{
    int bx = blockIdx.x;
    int by = blockIdx.y;

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    const int tile_size = 16; // tile size

    __shared__ int As[tile_size][tile_size];
    __shared__ int Bs[tile_size][tile_size];

    int aBegin = width * tile_size * by;
    int bBegin = tile_size * bx;

    int Csub = 0;

    // Loop over tiles
    for (int a = aBegin, b = bBegin; a < aBegin + width; a += tile_size, b += tile_size * width)
    {
        // Collaborative loading of tiles into shared memory
        As[ty][tx] = M[a + width * ty + tx];
        Bs[ty][tx] = N[b + width * ty + tx];
        __syncthreads();

        // Compute dot product for one element of the C matrix
        for (int k = 0; k < tile_size; ++k)
        {
            Csub += As[ty][k] * Bs[k][tx];
        }
        __syncthreads();
    }

    // Write the block sub-matrix to global memory
    int c = width * tile_size * by + tile_size * bx;
    P[c + width * ty + tx] = Csub;
}