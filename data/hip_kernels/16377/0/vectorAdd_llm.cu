#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const int *a, const int *b, int *c, int N)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Unrolling the loop to improve performance
    int gridStride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += gridStride)
    {
        c[i] = a[i] + b[i];
    }
}