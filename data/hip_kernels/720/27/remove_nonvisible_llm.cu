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
        int x = id % size3;
        float id_val = y[id];  // Load the value into a register for faster access
        if (id_val >= x) {
            y[id] = 0;
        }
    }
}