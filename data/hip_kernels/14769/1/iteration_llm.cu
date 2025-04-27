#include "hip/hip_runtime.h"
#include "includes.h"

const int BLOCK_SIZE_X = 26;
const int BLOCK_SIZE_Y = 26;
const float w1 = 4.0/9.0, w2 = 1.0/9.0, w3 = 1.0/36.0;
const float Amp2 = 0.1, Width = 10, omega = 1;

__global__ void iteration(float* f_d, int ArraySizeX, int ArraySizeY)
{
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x*(BLOCK_SIZE_X-2);
    int by = blockIdx.y*(BLOCK_SIZE_Y-2);
    int x = tx + bx;
    int y = ty + by;
    float n, ux, uy, uxx, uyy, usq, Fx, Fy, Fsq;
    __shared__ float f_sh[BLOCK_SIZE_X][BLOCK_SIZE_Y][9];

    // Load data into shared memory
    #pragma unroll
    for (int i = 0; i < 9; i++)
        f_sh[tx][ty][i] = f_d[x*ArraySizeY*9 + y*9 + i];

    __syncthreads();

    // Compute macroscopic quantities
    n = 0.0f;
    ux = 0.0f;
    uy = 0.0f;
    #pragma unroll
    for (int i = 0; i < 9; i++) {
        n += f_sh[tx][ty][i];
    }
    ux = (f_sh[tx][ty][1] - f_sh[tx][ty][2] + f_sh[tx][ty][5] - f_sh[tx][ty][6] - f_sh[tx][ty][7] + f_sh[tx][ty][8]) / n;
    uy = (f_sh[tx][ty][3] - f_sh[tx][ty][4] + f_sh[tx][ty][5] + f_sh[tx][ty][6] - f_sh[tx][ty][7] - f_sh[tx][ty][8]) / n;
    uxx = ux * ux;
    uyy = uy * uy;
    usq = uxx + uyy;

    // Forcing terms
    Fx = 0;
    Fy = 0;
    Fsq = 0.0f;

    // Perform collision step
    float feq, forceTerm, *f;
    f = f_sh[tx][ty];
    feq = w1 * n * (1.0f - 1.5f * usq);
    funroll
    for (int i = 0; i < 9; i++) {
        forceTerm = (i < 5) ? w2 * (3.0f * Fx * ux + 3.0f * Fy * uy) : w3 * (3.0f * Fx * ux + 3.0f * Fy * uy);
        f[i] += omega * (feq - f[i]) + forceTerm;
    }
    __syncthreads();

    // Perform stream step
    if (tx > 0 && tx < BLOCK_SIZE_X - 1 && ty > 0 && ty < BLOCK_SIZE_Y - 1) {
        f_d[x*ArraySizeY*9 + y*9]   = f[0];
        f_d[x*ArraySizeY*9 + y*9+2] = f_sh[tx+1][ty][2];
        f_d[x*ArraySizeY*9 + y*9+1] = f_sh[tx-1][ty][1];
        f_d[x*ArraySizeY*9 + y*9+4] = f_sh[tx][ty+1][4];
        f_d[x*ArraySizeY*9 + y*9+3] = f_sh[tx][ty-1][3];
        f_d[x*ArraySizeY*9 + y*9+7] = f_sh[tx+1][ty+1][7];
        f_d[x*ArraySizeY*9 + y*9+5] = f_sh[tx-1][ty-1][5];
        f_d[x*ArraySizeY*9 + y*9+6] = f_sh[tx+1][ty-1][6];
        f_d[x*ArraySizeY*9 + y*9+8] = f_sh[tx-1][ty+1][8];
    }
    __syncthreads();

    // Apply periodic boundary conditions
    if (x == 0)
        for (int i = 0; i < 9; i++)
            f_d[x*ArraySizeY*9 + y*9 + i] = f_d[(ArraySizeX-2)*ArraySizeY*9 + y*9 + i];
    if (x == ArraySizeX-1)
        for (int i = 0; i < 9; i++)
            f_d[x*ArraySizeY*9 + y*9 + i] = f_d[ArraySizeY*9 + y*9 + i];
    if (y == 0)
        for (int i = 0; i < 9; i++)
            f_d[x*ArraySizeY*9 + y*9 + i] = f_d[x*ArraySizeY*9 + (ArraySizeY-2)* 9 + i];
    if (y == ArraySizeY-1)
        for (int i = 0; i < 9; i++)
            f_d[x*ArraySizeY*9 + y*9 + i] = f_d[x*ArraySizeY*9 + 9 + i];
}