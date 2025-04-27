#include "hip/hip_runtime.h"
#include "includes.h"

const int BLOCK_SIZE_X = 26;
const int BLOCK_SIZE_Y = 26;
const float w1 = 4.0/9.0, w2 = 1.0/9.0, w3 = 1.0/36.0;
const float Amp2 = 0.1, Width = 10, omega = 1;

__global__ void Denrho(float* u_d, float* f_d, int ArraySizeX, int ArraySizeY)
{
    // Use shared memory to reduce global memory access
    __shared__ float f_shared[BLOCK_SIZE_X][BLOCK_SIZE_Y][9];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x*(BLOCK_SIZE_X-2);
    int by = blockIdx.y*(BLOCK_SIZE_Y-2);
    int x = tx + bx;
    int y = ty + by;

    // Load data into shared memory
    if (x < ArraySizeX && y < ArraySizeY) {
        for (int i = 0; i < 9; i++) {
            f_shared[tx][ty][i] = f_d[x*ArraySizeY*9 + y*9 + i];
        }
    }
    __syncthreads();

    // Aggregate the results using shared memory
    if (x < ArraySizeX && y < ArraySizeY) {
        float sum = 0;
        for (int i = 0; i < 9; i++) {
            sum += f_shared[tx][ty][i];
        }
        u_d[x*ArraySizeY + y] = sum;
    }
}