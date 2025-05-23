#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_input_shortcut_kernel(float *in, int size, float *add, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Flatten blockIdx for 1D access
    if (id < size) { // Change condition to < for better readability
        out[id] = in[id] + add[id];
    }
}