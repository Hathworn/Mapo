#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better memory access pattern
    for (int index = tid; index < N; index += blockDim.x * gridDim.x) {
        out[index] = in[index] > 0 ? in[index] : 0;
    }
}