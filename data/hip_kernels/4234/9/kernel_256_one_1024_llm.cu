#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_256_one_1024(float *A, float *B, float *bnBias, float *bnScale, float *C) {
    int tile = blockIdx.x, part = blockIdx.y, in_channel = threadIdx.x, line = threadIdx.y;
    int ind = line * 256 + in_channel;

    extern __shared__ float shared_[];
    float *weights = shared_ + 256 * 4, *output = weights + 256 * 32, *input = shared_;
    float *bias = output + 4 * 256, *scale = bias + 256;

    // Load data into shared memory
    input[ind] = A[tile * 1024 + ind];
    bias[in_channel] = bnBias[part * 256 + in_channel];
    scale[in_channel] = bnScale[part * 256 + in_channel];
    output[ind] = 0.0f;
    __syncthreads();

    // Loop optimization to improve memory coalescing and access patterns
    for (int k = 0; k < 256; k += 32) {
        for (int i = 0; i < 8; i++) {
            weights[ind + 1024 * i] = B[(k + i * 4 + line) * 1024 + part * 256 + in_channel];
        }
        __syncthreads();

        // Access shared memory efficiently
        float *A_start = input + k;
        float temp_sum = 0.0f;
        for (int p = 0; p < 32; p++) {
            temp_sum += A_start[line * 256 + p] * weights[in_channel + p * 256];
        }
        output[ind] += temp_sum;
        __syncthreads();
    }

    // Write final result to global memory
    float *C_start = C + tile * 4096 + part * 256;
    C_start[line * 1024 + in_channel] = scale[in_channel] * output[ind] + bias[in_channel];
}