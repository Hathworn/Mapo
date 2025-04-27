#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_nonvisible(float *y, int size, int size3)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        // Calculate x more efficiently with integer division and remainder
        int x = id % size3;
        float value = y[id]; // Cache the value to avoid repeated memory access
        if (value >= x) {
            y[id] = 0;
        }
    }
}