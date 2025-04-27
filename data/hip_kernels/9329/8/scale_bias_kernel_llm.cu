#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate global position based on three-dimensional block and thread indices
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check if offset is within range, then process
    if(offset < size) {
        int index = (batch * n + filter) * size + offset; // Combine calculations into single step
        output[index] *= biases[filter];
    }
}