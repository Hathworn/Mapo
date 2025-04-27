#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_white(float *x, float *y, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride to process more elements

    for (int i = id; i < size; i += stride) { // Use loop to handle larger problem sizes
        if (x[i] == 255.0f) { // Ensure correct float comparison
            y[i] = 0.0f; // Avoid partial write, use float value
        }
    }
}