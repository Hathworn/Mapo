#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        // Use inline conditional operator to avoid divergence
        out[tid] = fmaxf(in[tid], 0.0f);
    }
}