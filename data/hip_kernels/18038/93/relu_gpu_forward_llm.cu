#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling and stride to improve memory access patterns
    for (int i = tid; i < N; i += stride) {
        float input_val = in[i]; // Load once
        out[i] = input_val > 0 ? input_val : 0; // Conditional store
    }
}