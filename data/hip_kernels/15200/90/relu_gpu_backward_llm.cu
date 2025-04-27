#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Vectorized computation 
    if (tid < N) {
        float data = indata[tid];
        float grad = outgrad[tid];
        ingrad[tid] = data > 0 ? grad : 0;
    }
}