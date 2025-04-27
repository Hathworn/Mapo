#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE tileSize

__global__ void MatrixMulVarSharedMemoryKernel(float* M, float* N, float* P, int widthAHeightB, int heightA, int widthB) {
    int Mstart = widthAHeightB * TILE_SIZE * blockIdx.y;
    int Mend = Mstart + widthAHeightB - 1;
    int mstep = TILE_SIZE;
    int Nstart = TILE_SIZE * blockIdx.x;
    int nstep = TILE_SIZE * widthB;
    float temp = 0;

    __shared__ float Ms[TILE_SIZE][TILE_SIZE];
    __shared__ float Ns[TILE_SIZE][TILE_SIZE];

    // optimized: remove branching by using for loop conditions directly
    for (int m = Mstart, n = Nstart; m <= Mend; m += mstep, n += nstep) {
        int mPos = m + widthAHeightB * threadIdx.y + threadIdx.x;
        int nPos = n + widthB * threadIdx.y + threadIdx.x;

        Ms[threadIdx.y][threadIdx.x] = (m <= Mend && mPos < widthAHeightB * heightA) ? M[mPos] : 0.0f;
        Ns[threadIdx.y][threadIdx.x] = (n <= Mend && nPos < widthB * widthAHeightB) ? N[nPos] : 0.0f;
        
        __syncthreads();

        for (int i = 0; i < TILE_SIZE; ++i) {
            temp += Ms[threadIdx.y][i] * Ns[i][threadIdx.x];
        }
        __syncthreads();
    }

    // optimized: single if-statement for P calculation
    int pPos = widthB * TILE_SIZE * blockIdx.y + TILE_SIZE * blockIdx.x + widthB * threadIdx.y + threadIdx.x;
    if (blockIdx.y * TILE_SIZE + threadIdx.y < heightA && blockIdx.x * TILE_SIZE + threadIdx.x < widthB) {
        P[pPos] = temp;
    }
}