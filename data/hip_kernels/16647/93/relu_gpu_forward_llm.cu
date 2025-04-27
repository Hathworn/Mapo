#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x; // Calculate grid stride
    for (int i = tid; i < N; i += gridSize) { // Loop over elements with stride
        out[i] = in[i] > 0 ? in[i] : 0; // Apply ReLU
    }
}