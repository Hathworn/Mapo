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

        // Preload the current y[id] value
        float y_id_val = y[id];

        for (int i = 1; x + i < size3; i++) {
            // Use a temporary variable to avoid repetitive memory access
            float y_next_val = y[id + i];
            if (i - y_next_val < -y_id_val) {
                y[id] = 0;
                break;
            }
        }
    }
}