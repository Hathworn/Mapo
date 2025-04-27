#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling to process multiple elements per thread
    while (tid < N) {
        out[tid] = in[tid] > 0 ? in[tid] : 0;
        tid += blockDim.x * gridDim.x;
    }
}