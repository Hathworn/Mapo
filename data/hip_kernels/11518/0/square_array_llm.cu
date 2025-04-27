#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop unrolling to improve performance
    int gridSize = blockDim.x * gridDim.x;
    while (idx < N) {
        a[idx] = a[idx] * a[idx];
        idx += gridSize;
    }
}