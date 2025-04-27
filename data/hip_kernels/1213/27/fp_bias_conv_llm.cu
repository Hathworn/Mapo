#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_bias_conv(float* preact, float* bias, const int size, const int n_channel)
{
    // Calculate the global thread index
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = n_channel * size * size;

    // Optimize loop by reducing index computations
    for (int n = N * pos / totalPos; n < N * (pos + 1) / totalPos; ++n) {
        int idx = n;
        int i_col = idx % size; // Combined row and column calculation
        idx /= size;
        int i_row = idx % size;
        idx /= size;
        int i_channel = idx % n_channel;

        // Linear index calculation for memory access
        preact[(i_channel * size + i_col) * size + i_row] += bias[i_channel];
    }
}