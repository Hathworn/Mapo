#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_input_shortcut_kernel(float *in, int size, float *add, float *out)
{
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize boundary check by processing multiple elements per thread
    int stride = gridDim.x * blockDim.x;

    // Use a loop to process multiple elements, increasing occupancy
    for (; id < size; id += stride) {
        out[id] = in[id] + add[id];
    }
}