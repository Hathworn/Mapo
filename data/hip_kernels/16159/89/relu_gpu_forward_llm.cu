#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through all elements assigned to this thread
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        out[i] = fmaxf(in[i], 0.0f); // Use fmaxf for better performance
    }
}