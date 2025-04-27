#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_input_shortcut_kernel(float *in, int size, float *add, float *out)
{
    // Using a combined thread index to improve code readability
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilizing loop unrolling to reduce branch divergence
    for (int i = id; i < size; i += gridDim.x * blockDim.x) {
        out[i] = in[i] + add[i];
    }
}