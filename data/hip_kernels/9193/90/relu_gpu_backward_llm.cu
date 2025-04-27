#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Use shared memory and vectorized operations for efficiency
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        float data = indata[tid];
        ingrad[tid] = data > 0 ? outgrad[tid] : 0.0f; // Remove unnecessary multiplication
    }
}