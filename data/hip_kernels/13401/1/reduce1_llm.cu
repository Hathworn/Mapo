#include "hip/hip_runtime.h"
#include "includes.h"

const int N = 256;
const int C = 1024;
const int D = 28*28;

__global__ void reduce1(const float* in, float* out) {
    extern __shared__ float buffer[];
    const unsigned int tid = threadIdx.x;
    const unsigned int c = blockIdx.x;
    float sum = 0.0f;

    // Load and accumulate data to buffer
    for (int i = tid; i < N * D; i += blockDim.x) {
        const unsigned int n = i / D;
        const unsigned int d = i % D;
        const unsigned int index = n * C * D + c * D + d;
        sum += in[index];
    }
    buffer[tid] = sum;
    __syncthreads();

    // Optimized tree reduction with stride halving
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {  // Reduce bank conflicts with stride halving
            buffer[tid] += buffer[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0) out[c] = buffer[0] / (N * D);
}