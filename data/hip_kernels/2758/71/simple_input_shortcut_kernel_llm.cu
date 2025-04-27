#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_input_shortcut_kernel(float *in, int size, float *add, float *out)
{
    // Calculate global thread index with simplified 1D grid logic
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to allow execution for remaining threads beyond initial range
    int stride = blockDim.x * gridDim.x;
  
    // Loop to cover all elements beyond initial range
    for (; id < size; id += stride) {
        out[id] = in[id] + add[id];  // Perform addition
    }
}