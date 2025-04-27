#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    int baseIdx = (batch * n + filter) * size; // Compute base index once to optimize

    for (int offset = blockIdx.x * blockDim.x + threadIdx.x; offset < size; offset += blockDim.x * gridDim.x) {
        // Use a loop to handle more work per thread and improve memory access efficiency
        output[baseIdx + offset] *= biases[filter];
    }
}