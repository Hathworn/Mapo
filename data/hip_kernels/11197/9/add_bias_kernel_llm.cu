#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate the global index for each thread
    int idx = blockIdx.z * gridDim.y * size + blockIdx.y * size + blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds to ensure we are within size limits
    if(idx < n * size) {
        int filter = (idx / size) % n;
        output[idx] += biases[filter];  // Add bias to the appropriate position
    }
}