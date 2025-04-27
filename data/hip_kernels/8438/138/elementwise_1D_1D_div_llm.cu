#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Thread index for processing
    while (tid < size) {
        // Perform safe division
        out[tid] = in2[tid] != 0.0f ? in1[tid] / in2[tid] : 0.0f;
        tid += stride; // Move to the next element processed by this thread
    }
}