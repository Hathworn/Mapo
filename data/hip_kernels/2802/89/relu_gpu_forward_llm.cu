#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Coalesced access: Use stride pattern for better memory access
    for (int i = tid; i < N; i += gridDim.x * blockDim.x) {
        out[i] = max(0.0f, in[i]);
    }
}