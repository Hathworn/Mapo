#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread ID is within bounds and perform computation
    if (tid < N) {
        float input_value = indata[tid];
        float output_gradient = outgrad[tid];
        ingrad[tid] = (input_value > 0) ? output_gradient : 0.0f;
    }
}