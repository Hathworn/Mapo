#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid stride loop for better utilization
    for (int i = tid; i < size; i += gridDim.x * blockDim.x) {
        // Clamp the input value between min_val and max_val
        out[i] = fminf(fmaxf(in[i], min_val), max_val);
    }
}