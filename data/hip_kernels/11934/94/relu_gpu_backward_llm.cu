#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition first for early exit
    if (tid >= N) return;

    // Use ternary operator for compactness
    ingrad[tid] = (indata[tid] > 0) ? outgrad[tid] : 0.0f;
}