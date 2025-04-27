```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    // Calculate the global index for each thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread operates within bounds
    if (tid < N) {
        // Perform backward pass of ReLU
        ingrad[tid] = (indata[tid] > 0) * outgrad[tid];
    }
}