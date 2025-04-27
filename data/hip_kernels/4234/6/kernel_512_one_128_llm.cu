#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_512_one_128(float *A, float *B, float *bnBias, float *bnScale, float *C) {
    int tile = blockIdx.x, in_channel = threadIdx.x, line = threadIdx.y;
    int ind = line * 128 + in_channel;

    extern __shared__ float shared_[];

    // Use shared memory efficiently
    float *weights = shared_ + 512 * 4, *output = weights + 128 * 64, *input = shared_;
    float *bias = output + 4 * 128, *scale = bias + 128;

    for (int i = 0; i < 4; i++)
        input[ind + i * 512] = A[tile * 2048 + i * 512 + ind];
    bias[in_channel] = bnBias[in_channel];
    scale[in_channel] = bnScale[in_channel];
    output[ind] = 0.0f;
    __syncthreads();

    // Loop unrolling for better performance
    for (int k = 0; k < 512; k += 64) {
        float *B_start = B + k * 128;
        for (int i = 0; i < 16; i++)
            weights[ind + i * 512] = B_start[i * 512 + ind];
        __syncthreads();

        float *A_start = input + k;
        float acc = 0.0f;
        #pragma unroll 8  // Unroll the loop for increased performance
        for (int p = 0; p < 64; p++) {
            acc += A_start[line * 512 + p] * weights[in_channel + p * 128];
        }
        output[ind] += acc;
        __syncthreads();
    }

    float *C_start = C + tile * 512;
    float res = scale[in_channel] * output[ind] + bias[in_channel];

    // Use max function for better readability and possibly performance improvements
    C_start[ind] = fmaxf(res, 0.0f);
}