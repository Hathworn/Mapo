#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Calculate thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread ID is within bounds and directly set ingrad based on condition
    if (tid < N) {
        ingrad[tid] = (indata[tid] > 0) * outgrad[tid];
    }
}