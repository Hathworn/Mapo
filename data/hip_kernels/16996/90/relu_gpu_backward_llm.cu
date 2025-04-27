#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        // Use local variable to optimize memory access
        float in_val = indata[tid];
        float out_grad = outgrad[tid];
        ingrad[tid] = in_val > 0 ? out_grad : 0;
    }
}