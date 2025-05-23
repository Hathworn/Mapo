#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void decat(float* input, float* output1, float* output2, float* output3, float* output4, const int size, const int out_channel1, const int out_channel2, const int out_channel3, const int out_channel4)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int in_channel = out_channel1 + out_channel2 + out_channel3 + out_channel4;  // # of channel of input
    const int N = size * size;  // total elements per channel

    if (pos < N) {
        // Calculate row and column only once
        const int row = pos / size;
        const int col = pos % size;
        for (int n = 0; n < in_channel; n++) {
            const int idx = (n * size + col) * size + row; // Precalculate index
            if (n < out_channel1) {  // first output
                output1[idx] = input[idx];
            } else if (n < out_channel1 + out_channel2) {  // second output
                output2[(n - out_channel1) * N + pos] = input[idx];
            } else if (n < out_channel1 + out_channel2 + out_channel3) {  // third output
                output3[(n - out_channel1 - out_channel2) * N + pos] = input[idx];
            } else {  // last output
                output4[(n - out_channel1 - out_channel2 - out_channel3) * N + pos] = input[idx];
            }
        }
    }
}