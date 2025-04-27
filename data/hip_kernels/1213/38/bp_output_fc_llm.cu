#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bp_output_fc(float *d_output, float *d_preact, float *weight, const int size, const int in_channel, const int out_channel)
{
    // Calculate unique thread index using both block and thread indices
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    const int weight_channel = out_channel * in_channel;
    const int N = weight_channel * size * size;

    // Loop over the assigned range and increment by the total number of threads
    for (int n = idx; n < N; n += blockDim.x * gridDim.x) {
        int index = n;
        // Calculate indices for i_channel, i_row, and i_col
        const int i_channel = index / (size * size);
        const int i_row = (index / size) % size;
        const int i_col = index % size;

        // Use atomic addition to prevent race conditions
        atomicAdd(&d_output[((i_channel % in_channel) * size + i_col) * size + i_row], 
                  d_preact[i_channel % out_channel] * weight[n]);
    }
}