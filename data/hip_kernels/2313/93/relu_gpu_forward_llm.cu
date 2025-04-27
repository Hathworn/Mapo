#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Calculate unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop for better utilization
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        out[i] = fmaxf(in[i], 0.0f); // Use intrinsic function for better performance
    }
}