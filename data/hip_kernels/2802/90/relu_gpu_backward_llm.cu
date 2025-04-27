#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize condition check and assignment using ternary operator directly
    if (tid < N) {
        float in_val = indata[tid];
        ingrad[tid] = (in_val > 0.0f) * outgrad[tid]; // Use boolean multiplication for condition
    }
}