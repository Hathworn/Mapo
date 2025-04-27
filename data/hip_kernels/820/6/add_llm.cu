#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    int col = 10;
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    int idx = i * col + j; // Calculate index once
    c[idx] = a[idx] + b[idx]; // Access memory efficiently
}