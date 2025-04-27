#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelAddConstant(int *g_a, const int b)
{
    // Calculate global index for the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use conditional check to prevent out-of-bounds access
    if (idx < gridDim.x * blockDim.x) {
        g_a[idx] += b;
    }
}