#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread work is within bounds
    if (tid < N) {
        // Use ternary operation for concise writing
        ingrad[tid] = (indata[tid] > 0) ? outgrad[tid] : 0.0f;
    }
}