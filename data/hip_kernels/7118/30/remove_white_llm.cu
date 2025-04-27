#include "hip/hip_runtime.h"
#include "includes.h"
/* This file is copied from https://github.com/jzbonter/mc-cnn */
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_white(float *x, float *y, int size)
{
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within bounds to prevent accessing out of bounds memory
    if (id >= size) return;

    // Replace white color value (255) with zero
    if (x[id] == 255.0f) {
        y[id] = 0.0f;
    }
}