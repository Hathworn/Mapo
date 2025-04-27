#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_white(float *x, float *y, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index
    if (id >= size) return;

    // Use conditional operator for compactness
    y[id] = (x[id] == 255) ? 0 : y[id];
}