#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* __restrict__ a, const float* __restrict__ b, int n)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use warp-synchronous programming when possible
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        a[idx] += b[idx]; // Perform addition
    }
}