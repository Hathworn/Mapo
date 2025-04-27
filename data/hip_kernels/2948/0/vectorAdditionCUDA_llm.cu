#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

__global__ void vectorAdditionCUDA(const float* a, const float* b, float* c, int n)
{
    int ii = blockDim.x * blockIdx.x + threadIdx.x;
    // Use if condition in a non-divergent manner
    if (ii < n) {
        c[ii] = a[ii] + b[ii];
    }
}