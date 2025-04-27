#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate the stride for loop unrolling
    for (int i = tid; i < N; i += stride) { // Unroll with stride to leverage memory access
        float value = in[i];
        out[i] = value > 0 ? value : 0;
    }
}