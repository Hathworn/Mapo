#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate global thread ID
    int idx = blockDim.x * (blockDim.y * blockIdx.z + blockIdx.y) + threadIdx.x;
    
    if (idx < n * size) {
        int filter = idx / size;
        int offset = idx % size;
        int batch = idx / (n * size);

        // Perform scaling operation
        output[idx] *= biases[filter];
    }
}