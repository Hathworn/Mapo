#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to accumulate values from y to x
__global__ void cudaDaccumulate_kernel(double* x, int* y, unsigned int size)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Using index within bounds to prevent out-of-bounds access
    for (unsigned int i = index; i < size; i += stride) {
        x[i] += __ldg(&y[i]);  // Use __ldg() for potential cache benefit
    }
}