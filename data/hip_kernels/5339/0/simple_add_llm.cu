#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if(i < n) {
        // Perform addition
        a[i] += b[i];
    }
}