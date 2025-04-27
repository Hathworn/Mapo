#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    // Calculate index using standard formula
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use conditional operator to limit out-of-bound access
    if(i < n) {
        a[i] += b[i]; // Simplified in-place addition
    }
}