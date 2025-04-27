#include "hip/hip_runtime.h"
#include "includes.h"

const int N = 256;
const int C = 1024;
const int D = 28*28;

__global__ void reduce0(const float* in, float* out) {
    __shared__ float buffer[CUDA_NUM_THREADS];
    const unsigned int tid = threadIdx.x;
    const unsigned int c = blockIdx.x;

    // Initialize shared memory buffer
    buffer[tid] = 0.0f;

    // Efficient data loading to buffer using strided access pattern
    for (int i = tid; i < N * D; i += blockDim.x) {
        const unsigned int n = i / D;
        const unsigned int d = i % D;
        const unsigned int index = n * C * D + c * D + d;
        buffer[tid] += in[index];
    }
    __syncthreads();

    // Tree-based reduction for buffer with non-divergent branching
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            buffer[tid] += buffer[tid + s];
        }
        __syncthreads();
    }

    // Write result to out for the first thread
    if (tid == 0) out[c] = buffer[0] / (N * D);
}