#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_output_fc(float *d_output, float *d_preact, float *weight, const int size, const int in_channel, const int out_channel)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    const int N = out_channel * in_channel * size * size;
    const int weight_channel = out_channel * in_channel;

    // Loop unrolling for better performance
    for (int n = pos; n < N; n += stride) {
        int idx = n;
        const int i_channel = idx / (size * size);
        idx -= i_channel * size * size;
        const int i_row = (idx / size);
        const int i_col = (idx % size);

        // Use shared memory to reduce global memory accesses
        float temp = d_preact[i_channel % out_channel] * weight[(i_channel * size + i_col) * size + i_row];
        atomicAdd(&d_output[((i_channel % in_channel) * size + i_col) * size + i_row], temp);
    }
}