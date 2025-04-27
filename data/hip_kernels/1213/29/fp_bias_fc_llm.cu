#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_bias_fc(float *preact, float *bias, const int n_channel)
{
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check within boundaries before operation
    if (idx < n_channel) {
        preact[idx] += bias[idx]; // Perform bias addition
    }
}