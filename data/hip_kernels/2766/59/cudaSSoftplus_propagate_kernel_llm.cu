#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSoftplus_propagate_kernel(float* x, float* y, unsigned int size)
{
    // Calculate global index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over the data using stride calculations for even data distribution amongst threads
    const unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned int i = index; i < size; i += stride) {
        // Perform computation with conditional check to avoid unnecessary computation
        float exp_val = exp(x[i]);
        y[i] = exp_val > 0.0f ? log1pf(exp_val) : log1pf(0.0f + exp_val);
    }
}