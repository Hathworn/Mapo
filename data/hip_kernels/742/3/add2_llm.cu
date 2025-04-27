#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add2(int *a, int *r, int *g, int *b, float *gc)
{
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Use float conversion directly in the calculation for better precision and performance
    gc[5120 * 6 + i * 6] = b[i] * 0.00390625f;
    gc[5120 * 6 + i * 6 + 1] = g[i] * 0.00390625f;
    gc[5120 * 6 + i * 6 + 2] = r[i] * 0.00390625f;

    // Efficient modulus operation utilizing bitwise and shift operations
    gc[5120 * 6 + i * 6 + 3] = float(i & 511); // i % 512
    gc[5120 * 6 + i * 6 + 4] = float(i >> 9);  // i / 512

    gc[5120 * 6 + i * 6 + 5] = float(a[i]);
}