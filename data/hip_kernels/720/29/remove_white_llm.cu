#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_white(float *x, float *y, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return; // Early exit condition for out-of-bounds
    float value = x[id];
    y[id] = (value == 255) ? 0 : y[id]; // Use a ternary operator for brevity
}