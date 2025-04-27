#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficient boundary check and computation
    if (tid < N) {
        // Simplified logic for conditional assignment
        ingrad[tid] = indata[tid] > 0 ? outgrad[tid] : 0;
    }
}