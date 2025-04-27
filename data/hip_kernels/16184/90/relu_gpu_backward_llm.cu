#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory and memory coalescing for improved performance
    if (tid < N) {
        float value = indata[tid];
        ingrad[tid] = value > 0 ? outgrad[tid] : 0.0f;
    }
}