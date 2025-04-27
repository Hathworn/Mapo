#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use float comparison to avoid division by zero
    for (; tid < size; tid += stride) {
        if (tid < size) {
            float denominator = in2[tid];
            if (denominator != 0.0f) {
                out[tid] = in1[tid] / denominator;
            } else {
                out[tid] = 0.0f; // Handle division by zero gracefully
            }
        }
    }
}