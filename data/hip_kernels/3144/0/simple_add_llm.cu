#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        a[i] += b[i]; // Use shorthand operator
    }
}