#include "hip/hip_runtime.h"
#include "includes.h"
/* This file is copied from https://github.com/jzbonter/mc-cnn */
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_nonvisible(float *y, int size, int size3)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit early if id is out of bounds
    if (id >= size) return;

    int x = id % size3; // Compute x once and reuse
    if (y[id] >= x) {
        y[id] = 0;
    }
}