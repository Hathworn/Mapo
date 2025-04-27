#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_kernel(const float * __restrict__ x, const int n, float * __restrict__ binary)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to handle large arrays
    int stride = blockDim.x * gridDim.x;

    // Loop over the entire array in strides
    for (; i < n; i += stride) {
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f;
    }
}