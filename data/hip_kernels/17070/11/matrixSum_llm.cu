#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(int* a, int* b, int* c, int size)
{
    // Compute global thread position
    int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform addition if within bounds
    if (pos < size * size) {
        c[pos] = a[pos] + b[pos];
    }
}