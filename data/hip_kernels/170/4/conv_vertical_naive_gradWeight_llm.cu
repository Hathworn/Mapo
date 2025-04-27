#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_vertical_naive_gradWeight(const int n, float *y, const float *x, const int kL, const int iC)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to cover the entire array, increasing memory access efficiency
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        y[i] = x[(i/kL) * kL * iC + i];
    }
}