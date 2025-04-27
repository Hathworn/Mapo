#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void oneMinusTanh(float* out, float* in, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check conditions to avoid redundant computations
    if (id < size) {
        float val = in[id];
        // Precompute 1 - val for efficiency
        out[id] = 1 - val;
    }
}