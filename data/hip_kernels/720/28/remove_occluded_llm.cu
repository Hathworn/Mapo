#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_occluded(float *y, int size, int size3)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        int x = id % size3;
        float current_y = y[id]; // Cache the current y value
        for (int i = 1; x + i < size3; i++) {
            if (i - y[id + i] < -current_y) { // Use cached value
                y[id] = 0; // Mark as occluded
                break;
            }
        }
    }
}