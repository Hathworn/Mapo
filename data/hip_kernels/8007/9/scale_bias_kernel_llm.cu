#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate global thread index
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check bounds and apply bias scaling
    if(offset < size) {
        int index = (batch * n + filter) * size + offset; // Precompute index to prevent repetitive calculation
        output[index] *= biases[filter];
    }
}