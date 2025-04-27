#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultKernel_overlap(float* Ad, float* Bd, float* Cd, int n)
{
    __shared__ float A_shared[TILE_SIZE][TILE_SIZE];
    __shared__ float B_shared[TILE_SIZE][TILE_SIZE];

    int row = blockIdx.y * TILE_SIZE + threadIdx.y;
    int column = blockIdx.x * TILE_SIZE + threadIdx.x;

    // Exit if out of bounds
    if (row >= n || column >= n) {
        return;
    }

    float Celem = 0.0;
    float reg_1 = (row < n && threadIdx.x < TILE_SIZE) ? Ad[row * n + threadIdx.x] : 0.0f;
    float reg_2 = (threadIdx.y < TILE_SIZE && column < n) ? Bd[threadIdx.y * n + column] : 0.0f;

    for (int m = 0; m < (n + TILE_SIZE - 1) / TILE_SIZE; m++) {
        A_shared[threadIdx.y][threadIdx.x] = reg_1;
        B_shared[threadIdx.y][threadIdx.x] = reg_2;

        __syncthreads();

        if (m * TILE_SIZE + threadIdx.x < n && row < n) reg_1 = Ad[row * n + m * TILE_SIZE + threadIdx.x];
        if (m * TILE_SIZE + threadIdx.y < n && column < n) reg_2 = Bd[(m * TILE_SIZE + threadIdx.y) * n + column];

        for (int k = 0; k < TILE_SIZE; k++) {
            Celem += A_shared[threadIdx.y][k] * B_shared[k][threadIdx.x];
        }

        __syncthreads();
    }

    if (row < n && column < n) {
        Cd[row * n + column] = Celem;
    }
}