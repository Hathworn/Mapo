#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_1024_one_256(float *A, float *B, float *bnBias, float *bnScale, float *C) {
    // Calculate indices
    int tile = blockIdx.x, in_channel = threadIdx.x, line = threadIdx.y;
    int ind = line*256 + in_channel;

    // Shared memory declarations
    extern __shared__ float shared_[];
    float *weights = shared_ + 1024*4, *output = weights + 256*16, *input = shared_;
    float *bias = output + 4*256, *scale = bias + 256;

    // Efficiently loading A, biases & scales into shared memory
    for (int i = 0; i < 4; i++) {
        input[ind + i*1024] = A[tile*4096 + i*1024 + ind];
    }
    if (line == 0) {
        bias[in_channel] = bnBias[in_channel];
        scale[in_channel] = bnScale[in_channel];
    }
    
    output[ind] = 0.0f;
    __syncthreads();

    // Compute using shared weights and inputs
    for (int k = 0; k < 1024; k += 16) {
        float *B_start = B + k*256;
        for (int i = 0; i < 4; i++) {
            weights[ind + i*1024] = B_start[i*1024 + ind];
        }
        __syncthreads();

        float *A_start = input + k;
        for (int p = 0; p < 16; p++) {
            // Multiply-accumulate operation (using shared memory efficiently)
            output[ind] += A_start[line*1024 + p] * weights[in_channel + p*256];
        }
        __syncthreads();
    }

    // Write back results with ReLU activation
    if (line == 0) {
        float *C_start = C + tile*1024;
        float res = scale[in_channel] * output[ind] + bias[in_channel];
        C_start[ind] = res > 0 ? res : 0;
    }
}