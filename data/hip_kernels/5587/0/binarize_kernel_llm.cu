#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Optimize thread index calculation and reduce global memory accesses
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        binary[i] = (x[i] >= 0.0f) ? 1.0f : -1.0f;
    }
}