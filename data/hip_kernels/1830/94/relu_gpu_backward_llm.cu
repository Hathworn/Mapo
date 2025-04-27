#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure tid is within bounds and perform conditional assignment
    if (tid < N) {
        ingrad[tid] = (indata[tid] > 0) ? outgrad[tid] : 0.0f;  // Use float literal for clarity
    }
}