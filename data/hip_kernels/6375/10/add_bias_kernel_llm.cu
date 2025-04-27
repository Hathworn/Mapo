#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    
    // Ensure offset calculations are within valid range
    if(offset < size) {
        // Calculate the base index and then add the offset
        int index = (batch * n + filter) * size + offset;
        // Add bias to the corresponding output element
        output[index] += biases[filter];
    }
}