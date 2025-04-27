#include "hip/hip_runtime.h"
#include "includes.h"

const int N = 256;
const int C = 1024;
const int D = 28*28;

__global__ void reduce2(const float* __restrict__ in, float* __restrict__ out) {
    __shared__ float buffer[CUDA_NUM_THREADS];
    const unsigned int tid = threadIdx.x;
    const unsigned int c = blockIdx.x;

    // load and accumulate data to buffer
    float sum = 0.0f;
    for (int i = tid; i < N * D; i += blockDim.x) {
        const unsigned int n = i / D;
        const unsigned int d = i % D;
        const unsigned int index = n * C * D + c * D + d;
        sum += in[index];
    }
    buffer[tid] = sum;
    __syncthreads();

    // perform inter-thread reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            buffer[tid] += buffer[tid + s];
        }
        __syncthreads();
    }

    // write the result to global memory
    if (tid == 0) 
        out[c] = buffer[0] / (N * D);
}