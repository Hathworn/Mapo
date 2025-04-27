#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index
    int stride = blockDim.x * gridDim.x; // Calculate the stride
    for (int i = tid; i < N; i += stride) { // Loop with a stride to cover all elements
        out[i] = in[i] > 0 ? in[i] : 0; // Apply ReLU operation
    }
}