#include "hip/hip_runtime.h"
#include "includes.h"

// Use __restrict__ to potentially improve memory access optimization
__global__ void Add(const float* __restrict__ d_a, const float* __restrict__ d_b, float* __restrict__ d_c, int N)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if(id < N) // Ensure in-bounds access
    {
        d_c[id] = d_a[id] + d_b[id]; // Perform addition
    }
}