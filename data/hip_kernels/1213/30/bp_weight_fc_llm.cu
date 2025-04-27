#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bp_weight_fc(float *d_weight, float *d_preact, float *p_output, const int size, const int in_channel, const int out_channel)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = out_channel * in_channel * size * size;
    const int weight_channel = out_channel * in_channel;

    for (int n = N * pos / totalPos; n < N * (pos + 1) / totalPos; ++n) {
        int idx = n;
        const int i_channel = idx % weight_channel; // Simplified {idx/=1} to {idx%weight_channel}
        idx /= weight_channel;
        const int i_row = idx % size;
        idx /= size;
        const int i_col = idx % size;

        // Precomputed indices to reduce repeated calculation
        const int preact_idx = i_channel % out_channel;
        const int output_idx = ((i_channel % in_channel) * size + i_col) * size + i_row;

        // Removed redundant calculations in the assignment expression
        d_weight[(i_channel * size + i_col) * size + i_row] = d_preact[preact_idx] * p_output[output_idx];
    }
}