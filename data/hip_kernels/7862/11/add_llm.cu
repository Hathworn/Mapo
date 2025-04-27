#include "hip/hip_runtime.h"
#include "includes.h"

#define WIDTH 1024
#define HEIGHT 1024

__global__ void add(int* a, int* b, int* c)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;

    // Use precomputed values for thread's global positions to avoid repetitive calculations
    int globalIdx = idy * WIDTH + idx;

    if (idx >= WIDTH || idy >= HEIGHT) return;

    // Perform addition using global index to improve memory access efficiency
    c[globalIdx] = a[globalIdx] + b[globalIdx];
}