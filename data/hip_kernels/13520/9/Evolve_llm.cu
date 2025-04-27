#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Evolve( int *val, int *aux, int n ) {
    int sum = 0, estado;
    const int tx = threadIdx.x + 1, ty = threadIdx.y + 1;
    const int i = blockIdx.y * blockDim.y + threadIdx.y;
    const int j = blockIdx.x * blockDim.x + threadIdx.x;
    const int b2 = BSIZE + 2;
    __shared__ int sdata[b2][b2]; // Changed from float to int to match val and reduce memory use

    // Load center value
    if (i < n && j < n) {
        sdata[ty][tx] = val[i * n + j];
    }

    // Load halo cells
    if (threadIdx.x == 0 && j > 0) 
        sdata[ty][0] = val[i * n + j - 1]; // Left
    if (threadIdx.x == blockDim.x - 1 && j < n - 1) 
        sdata[ty][b2 - 1] = val[i * n + j + 1]; // Right
    if (threadIdx.y == 0 && i > 0) 
        sdata[0][tx] = val[(i - 1) * n + j]; // Up
    if (threadIdx.y == blockDim.y - 1 && i < n - 1) 
        sdata[b2 - 1][tx] = val[(i + 1) * n + j]; // Down

    // Load corners
    if (threadIdx.x == 0 && threadIdx.y == 0 && i > 0 && j > 0)
        sdata[0][0] = val[(i - 1) * n + j - 1]; // Left-Up corner
    if (threadIdx.x == blockDim.x - 1 && threadIdx.y == 0 && i > 0 && j < n - 1)
        sdata[0][b2 - 1] = val[(i - 1) * n + j + 1]; // Right-Up corner
    if (threadIdx.x == 0 && threadIdx.y == blockDim.y - 1 && i < n - 1 && j > 0)
        sdata[b2 - 1][0] = val[(i + 1) * n + j - 1]; // Left-Down corner
    if (threadIdx.x == blockDim.x - 1 && threadIdx.y == blockDim.y - 1 && i < n - 1 && j < n - 1)
        sdata[b2 - 1][b2 - 1] = val[(i + 1) * n + j + 1]; // Right-Down corner

    __syncthreads();

    // Compute new state only for valid global indices
    if (i > 0 && i < n - 1 && j > 0 && j < n - 1) {
        estado = sdata[ty][tx];
        sum = sdata[ty - 1][tx] + sdata[ty - 1][tx + 1] + sdata[ty][tx + 1] +
              sdata[ty + 1][tx + 1] + sdata[ty + 1][tx] + sdata[ty + 1][tx - 1] +
              sdata[ty][tx - 1] + sdata[ty - 1][tx - 1];

        // Determine the state based on the sum
        if (sum == 3) {
            estado = 1;
        } else if ((estado == 1) && (sum < 2 || sum > 3)) {
            estado = 0;
        }
        aux[i * n + j] = estado;
    }
}