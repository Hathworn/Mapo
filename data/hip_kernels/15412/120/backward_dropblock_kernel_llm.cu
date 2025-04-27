```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_dropblock_kernel(float *pass, float *delta, int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use early exit to improve warp efficiency
    if (index < size) {
        // Reduce branch divergence by inverting the condition
        delta[index] *= (pass[index] != 0);
    }
}