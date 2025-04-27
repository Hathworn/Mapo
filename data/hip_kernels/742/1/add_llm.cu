#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *r, int *g, int *b, float *gc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Precompute base index for gc to reduce repetitive calculations
    int baseIdx = 5120 * 6 + i * 6;

    // Use multiplication for bitwise shifts
    gc[baseIdx    ] = b[i] * 0.00390625;
    gc[baseIdx + 1] = g[i] * 0.00390625;
    gc[baseIdx + 2] = r[i] * 0.00390625;

    // Optimize modulus and division with bitwise operations
    gc[baseIdx + 3] = float(i & 511); // Equivalent to: i % 512
    gc[baseIdx + 4] = float(i >> 9);  // Equivalent to: i / 512
    gc[baseIdx + 5] = float(a[i]);
}