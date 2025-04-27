#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll if condition to potentially reduce warp divergence
    if (tid < N) {
        // Optimize with a conditional assignment
        ingrad[tid] = indata[tid] > 0 ? outgrad[tid] : 0.0f;
    }
}