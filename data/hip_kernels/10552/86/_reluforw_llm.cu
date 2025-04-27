#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _reluforw(int n, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient loop increment using grid-stride loop
    for (; i < n; i += blockDim.x * gridDim.x) {
        if (y[i] < 0) y[i] = 0;
    }
}