#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TEST(int n, float* x, float* y) {
    // Use thread index to parallelize calculations, improving efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
        y[i] += x[i];
}