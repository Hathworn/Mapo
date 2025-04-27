#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't exceed array bounds
    if (i < n) {
        // Perform vector addition
        a[i] += b[i];
    }
}