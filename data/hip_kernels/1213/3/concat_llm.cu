#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void concat(float* output, float* input1, float* input2, float* input3, float* input4, const int size, const int in_channel1, const int in_channel2, const int in_channel3, const int in_channel4)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int out_channel = in_channel1 + in_channel2 + in_channel3 + in_channel4;  // # of channel for output
    const int N = size * size;  // total elements per channel

    // Use dynamic boundary check to optimize performance
    if (pos < N * out_channel) {  
        const int n = pos / N; // Determine channel index
        const int idx = pos % N; // Determine position in channel
        const int row = idx / size;
        const int col = idx % size;

        // Efficiently map input based on dynamic channel index
        if (n < in_channel1) {  
            output[pos] = input1[pos];
        } else if (n < in_channel1 + in_channel2) {  
            output[pos] = input2[pos - in_channel1 * N];
        } else if (n < in_channel1 + in_channel2 + in_channel3) {  
            output[pos] = input3[pos - (in_channel1 + in_channel2) * N];
        } else {  
            output[pos] = input4[pos - (in_channel1 + in_channel2 + in_channel3) * N];
        }
    }
}