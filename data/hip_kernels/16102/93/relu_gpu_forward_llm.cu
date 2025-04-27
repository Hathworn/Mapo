#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use a grid-stride loop to optimize for larger arrays
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += stride) {
        out[i] = fmaxf(in[i], 0.0f); // Use fmaxf for more clarity
    }
}