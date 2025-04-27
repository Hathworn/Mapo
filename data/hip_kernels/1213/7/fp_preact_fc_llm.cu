#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_preact_fc(float* input, float* preact, float* weight, const int size, const int in_channel, const int out_channel)
{
    // Calculate global thread index
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;

    // Weight matrix size calculations
    const int weight_channel = in_channel * out_channel;
    const int N = out_channel * in_channel * size * size; 

    // Calculate starting and ending indices for threads
    int startIndex = (N * pos) / totalPos;
    int endIndex = (N * (pos + 1)) / totalPos;

    // Loop over assigned elements
    for (int n = startIndex; n < endIndex; ++n) {
        int idx = n;

        // Calculate indices for accessing arrays
        const int i_channel = (idx % weight_channel);
        idx /= weight_channel;
        const int i_row = (idx % size);
        idx /= size;
        const int i_col = (idx % size);

        // Perform atomic addition to preact array
        atomicAdd(&preact[i_channel % out_channel], 
                  weight[(i_channel * size + i_col) * size + i_row] * 
                  input[((i_channel % in_channel) * size + i_col) * size + i_row]);
    }
}