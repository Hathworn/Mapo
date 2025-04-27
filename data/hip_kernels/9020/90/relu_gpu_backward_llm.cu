#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use read-only cache for input data
    if (tid < N) {
        float input_val = indata[tid];
        float output_val = outgrad[tid];
        ingrad[tid] = input_val > 0 ? output_val : 0;
    }
}