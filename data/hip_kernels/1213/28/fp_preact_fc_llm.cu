#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fp_preact_fc(float* input, float* preact, float* weight, const int size, const int in_channel, const int out_channel)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int weight_channel = in_channel * out_channel;
    const int N = out_channel * in_channel * size * size;  // number of elements of weight matrix

    for (int n = pos; n < N; n += blockDim.x * gridDim.x) {  // Use a stride loop
        int idx = n;
        const int i_channel = idx % weight_channel;
        idx /= weight_channel;
        const int i_row = idx % size;
        idx /= size;
        const int i_col = idx % size;

        // Pre-compute indices and eliminate redundant calculations
        int weight_idx = (i_channel * size + i_col) * size + i_row;
        int input_idx = ((i_channel % in_channel) * size + i_col) * size + i_row;

        atomicAdd(&preact[i_channel % out_channel], weight[weight_idx] * input[input_idx]);
    }
}