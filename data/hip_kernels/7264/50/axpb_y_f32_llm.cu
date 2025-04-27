#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpb_y_f32 (float a, float* x, float b, float* y, int len) {
    // Calculate a unique index for each thread in the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within the boundaries of the array
    if (idx < len) {
        float x_val = x[idx]; // Cache x[idx] to improve memory access time
        y[idx] = y[idx] * a * x_val + b; // Simplified arithmetic operation
    }
}