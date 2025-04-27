#include "hip/hip_runtime.h"
#include "includes.h"
/* This file is copied from https://github.com/jzbonter/mc-cnn */
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void rho(float *x, int size, float lambda)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds and compute result
    if (id < size) {
        // Prefetch value to register for reuse
        float value = x[id];
        x[id] = 1 - exp(-value / lambda);
    }
}