#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* a, float* b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        a[i] += b[i]; // Use compound assignment for brevity
    }
}