#include "hip/hip_runtime.h"
#include "includes.h"

const int THREADS_PER_BLOCK = 32;
const int N = 2048;

__global__ void mult(int *a, int *b, int *c)
{
    int pos = threadIdx.x + blockDim.x * blockIdx.x;
    if (pos >= N) return;

    // Unroll loop for improved performance
    int gridSize = gridDim.x * blockDim.x;
    while (pos < N) {
        c[pos] = a[pos] * b[pos];
        pos += gridSize;
    }
}