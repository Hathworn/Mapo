#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        // Use ternary for direct assignment to optimize control flow
        ingrad[tid] = (indata[tid] > 0) * outgrad[tid];
    }
}