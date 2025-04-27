#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_bias_conv(float* preact, float* bias, const int size, const int n_channel)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;

    const int N = n_channel * size * size;

    // Calculate workload for each thread
    int start = (N * pos) / totalPos;
    int end = (N * (pos + 1)) / totalPos;

    // Use appropriate stride access for coalesced memory access
    for (int n = start; n < end; ++n) {
        int idx = n;
        const int i_channel = (idx / (size * size)) % n_channel;
        const int i_row = (idx / size) % size;
        const int i_col = idx % size;

        // Precompute linear index for memory access
        int preact_idx = (i_channel * size * size) + (i_row * size) + i_col;
        preact[preact_idx] += bias[i_channel];
    }
}