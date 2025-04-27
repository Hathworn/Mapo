#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    float val = (tid < N) ? indata[tid] : 0;
    ingrad[tid] = (val > 0) ? outgrad[tid] : 0;  // Use ternary operator for clarity and efficiency
}