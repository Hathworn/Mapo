```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define Width 1920
#define Height 2520
#define iterations 100

__global__ void convolution_kernel(unsigned char* A, unsigned char* B)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    int x = i - 2 * blockIdx.x - 1;
    int y = j - 2 * blockIdx.y - 1;

    __shared__ unsigned char As[34][34]; // Increase shared memory size for halo

    // Load to shared memory with boundary checks
    if (x < 0) x = 0;
    else if (x >= Width) x = Width - 1;
    if (y < 0) y = 0;
    else if (y >= Height) y = Height - 1;
    As[threadIdx.x + 1][threadIdx.y + 1] = A[Width * y + x];

    // Load halo elements
    if (threadIdx.x == 0 && x > 0) {
        As[0][threadIdx.y + 1] = A[Width * y + (x - 1)];
    }
    if (threadIdx.x == blockDim.x - 1 && x < Width - 1) {
        As[33][threadIdx.y + 1] = A[Width * y + (x + 1)];
    }
    if (threadIdx.y == 0 && y > 0) {
        As[threadIdx.x + 1][0] = A[Width * (y - 1) + x];
    }
    if (threadIdx.y == blockDim.y - 1 && y < Height - 1) {
        As[threadIdx.x + 1][33] = A[Width * (y + 1) + x];
    }

    // Load corners
    if (threadIdx.x == 0 && threadIdx.y == 0 && x > 0 && y > 0) {
        As[0][0] = A[Width * (y - 1) + (x - 1)];
    }
    if (threadIdx.x == blockDim.x - 1 && threadIdx.y == 0 && x < Width - 1 && y > 0) {
        As[33][0] = A[Width * (y - 1) + (x + 1)];
    }
    if (threadIdx.x == 0 && threadIdx.y == blockDim.y - 1 && x > 0 && y < Height - 1) {
        As[0][33] = A[Width * (y + 1) + (x - 1)];
    }
    if (threadIdx.x == blockDim.x - 1 && threadIdx.y == blockDim.y - 1 && x < Width - 1 && y < Height - 1) {
        As[33][33] = A[Width * (y + 1) + (x + 1)];
    }

    __syncthreads();

    // Computations
    if (x > 0 && x < Width - 1 && y > 0 && y < Height - 1) {
        B[Width * y + x] = (As[threadIdx.x][threadIdx.y] +
                            As[threadIdx.x + 1][threadIdx.y - 1] * 2 +
                            As[threadIdx.x + 2][threadIdx.y] +
                            As[threadIdx.x][threadIdx.y + 1] * 2 +
                            As[threadIdx.x + 1][threadIdx.y + 1] * 4 +
                            As[threadIdx.x + 2][threadIdx.y + 1] * 2 +
                            As[threadIdx.x][threadIdx.y + 2] +
                            As[threadIdx.x + 1][threadIdx.y + 2] * 2 +
                            As[threadIdx.x + 2][threadIdx.y + 2]) / 16;
    }
}