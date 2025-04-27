#include "hip/hip_runtime.h"
#include "includes.h"

#define M 10000
#define N 10000

__global__ void add(int *a, int *b, int *c)
{
    // Calculate the global index. Each thread computes multiple elements.
    unsigned int i = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int j = blockDim.y * blockIdx.y + threadIdx.y;

    // Use a single index for linear processing instead of 2D indexing for better memory coalescing.
    unsigned int index = j * M + i;

    // Ensure index is within bounds before processing.
    if (i < M && j < N)
        c[index] = a[index] + b[index];
}