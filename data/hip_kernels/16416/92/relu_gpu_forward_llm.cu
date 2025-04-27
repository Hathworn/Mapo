#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;

    // Process multiple elements per thread to improve memory throughput
    for (int i = tid; i < N; i += numThreads) {
        out[i] = in[i] > 0 ? in[i] : 0;
    }
}