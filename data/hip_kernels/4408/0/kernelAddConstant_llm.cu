#include "hip/hip_runtime.h"
#include "includes.h"

// a simple kernel that increments each array element by b
__global__ void kernelAddConstant(int *g_a, const int b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the index is within bounds for safe access
    if (idx < gridDim.x * blockDim.x) {
        g_a[idx] += b;
    }
}