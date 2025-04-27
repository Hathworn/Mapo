#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_bias_fc(float *preact, float *bias, const int n_channel)
{
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index does not exceed the number of channels
    if (idx < n_channel) {
        // Add bias to the corresponding preact element
        preact[idx] += bias[idx];
    }
}