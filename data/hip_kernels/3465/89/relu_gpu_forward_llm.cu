#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use a loop to process multiple elements per thread if possible
    int stride = gridDim.x * blockDim.x;
    for (int tid = blockIdx.x * blockDim.x + threadIdx.x; tid < N; tid += stride) {
        out[tid] = fmaxf(in[tid], 0.0f); // Use fmaxf for potential performance benefit
    }
}