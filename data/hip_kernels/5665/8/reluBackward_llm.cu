#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reluBackward(float* dZ, float* top_diff, float* V, int x, int y) {
    // Calculate global index
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Prefetch index value of V
    float v_index = 0.0f;
    if (index < x * y) {
        v_index = V[index];
    }

    // Perform computation with register optimization
    if (v_index > 0) {
        dZ[index] = top_diff[index];
    } else {
        dZ[index] = 0;
    }
}