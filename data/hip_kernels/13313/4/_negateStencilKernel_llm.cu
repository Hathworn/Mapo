#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _negateStencilKernel(int* stencil, int size, int* out)
{
    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit condition moved to reduce divergent branches
    if (idx < size) {
        // Use direct calculation to handle the same logic without a ternary operator
        out[idx] = 1 - stencil[idx];
    }
}