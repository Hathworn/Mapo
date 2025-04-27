#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    // Utilize built-in variables for optimized memory handling
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds to prevent memory overflow
    if(i < n) {
        // Perform addition operation
        a[i] += b[i];
    }
}