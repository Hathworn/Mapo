#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_hadamard_sum(int N, double *y, double *x, double *w) {
    // Use const memory for block size and grid size to optimize performance.
    const unsigned int blockSize = blockDim.x;
    const unsigned int gridSize = gridDim.x * blockSize;
    unsigned int tid = blockIdx.x * blockSize + threadIdx.x;

    // Unrolling loop for better memory access pattern.
    for (int i = tid; i < N; i += gridSize) {
        y[i] += x[i] * w[i];
    }
}