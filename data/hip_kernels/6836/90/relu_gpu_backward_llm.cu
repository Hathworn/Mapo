#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use CUDA warp efficiency where possible; unroll loops to minimize divergence
    if (tid < N) {
        float data = indata[tid];
        // Use ternary operator to avoid unnecessary branching
        ingrad[tid] = (data > 0) ? outgrad[tid] : 0;
    }
}