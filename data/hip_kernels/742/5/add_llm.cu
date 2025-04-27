#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void add(int *a, int *r, int *g, int *b, float *gc)
{
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    int base_index = 5120 * 6 + i * 6;

    // Repeated constant value replaced with formula
    float inv_256 = 0.00390625f;

    // Use precomputed base index and adjusted formulas
    gc[base_index] = b[i] * inv_256;
    gc[base_index + 1] = g[i] * inv_256;
    gc[base_index + 2] = r[i] * inv_256;

    // Simplified modulo and division calculations
    gc[base_index + 3] = float(i & 511);  // i % 512 optimized using bitwise AND
    gc[base_index + 4] = float(i >> 9);   // i / 512 optimized using bitwise shift

    // Direct assignment for last element
    gc[base_index + 5] = float(a[i]);
}