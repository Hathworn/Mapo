#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_weight_fc(float *d_weight, float *d_preact, float *p_output, const int size, const int in_channel, const int out_channel)
{
    // Calculate global thread ID
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate total number of threads
    const int totalThreads = blockDim.x * gridDim.x;

    // Pre-calculate channel size for weights
    const int weight_channel = out_channel * in_channel;
    
    // Calculate total number of elements
    const int N = out_channel * in_channel * size * size;

    // Iterate over workload distributed among threads
    for (int n = N * tid / totalThreads; n < N * (tid + 1) / totalThreads; ++n) {
        int idx = n;
        // Compute indices for accessing weights and inputs
        const int i_channel = ((idx /= 1) % weight_channel);
        const int i_row = ((idx /= weight_channel) % size);
        const int i_col = ((idx /= size) % size);

        // Access and update weight
        d_weight[(i_channel * size + i_col) * size + i_row] = 
            d_preact[i_channel % out_channel] * 
            p_output[((i_channel % in_channel) * size + i_col) * size + i_row];
    }
}