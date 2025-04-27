#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixSum(int* a, int* b, int* c, int size)
{
    int pos = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread position
    if (pos < size * size) {
        c[pos] = a[pos] + b[pos];
    }
}