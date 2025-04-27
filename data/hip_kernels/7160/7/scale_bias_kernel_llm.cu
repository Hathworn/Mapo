#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Check if offset is in bounds before accessing memory
    if(offset < size) {
        // Calculate index outside of loop to improve memory access efficiency
        int index = (batch * n + filter) * size + offset;
        output[index] *= biases[filter];
    }
}