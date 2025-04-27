#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int batchSize = n * size;  // Precompute batch size

    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Simplified index calculation and conditional check
    if (offset < size) 
    {
        int idx = batch * batchSize + filter * size + offset;
        output[idx] *= biases[filter];
    }
}