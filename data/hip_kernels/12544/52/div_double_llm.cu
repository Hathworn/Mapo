#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void div_double(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Unrolling loop for potential efficiency
    int gridSize = blockDim.x * gridDim.x;
    while (i < n) {
        sum[i] = a[i] / b[i];
        i += gridSize;
    }
}