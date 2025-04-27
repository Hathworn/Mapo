#include "hip/hip_runtime.h"
#include "includes.h"
#define inf 9999

__global__ void funct(int n, int k, float* x, int* qx)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    if (ix >= n * n) return; // Early exit for out-of-bounds threads

    int j = ix & (n - 1); // Optimized index computation
    float temp2 = x[ix - j + k] + x[k * n + j];

    if (x[ix] > temp2) {
        x[ix] = temp2;
        qx[ix] = k;
    }

    if (x[ix] == inf) {
        qx[ix] = -2;
    }
}