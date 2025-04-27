#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    if (offset >= size) return; // Early exit if offset is out of bounds
    
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Use of register variable to reduce redundant calculations
    float bias = biases[filter];
    
    // Calculate and update output in a single step
    int index = (batch * n + filter) * size + offset;
    output[index] *= bias;
}