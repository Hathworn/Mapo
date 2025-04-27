#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, const float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling for better performance, assuming blockDim.x is a multiple of 4
    if (tid < N) {
        out[tid] = in[tid] > 0 ? in[tid] : 0;
    }

    if (tid + blockDim.x < N) {
        out[tid + blockDim.x] = in[tid + blockDim.x] > 0 ? in[tid + blockDim.x] : 0;
    }

    if (tid + 2 * blockDim.x < N) {
        out[tid + 2 * blockDim.x] = in[tid + 2 * blockDim.x] > 0 ? in[tid + 2 * blockDim.x] : 0;
    }

    if (tid + 3 * blockDim.x < N) {
        out[tid + 3 * blockDim.x] = in[tid + 3 * blockDim.x] > 0 ? in[tid + 3 * blockDim.x] : 0;
    }
}