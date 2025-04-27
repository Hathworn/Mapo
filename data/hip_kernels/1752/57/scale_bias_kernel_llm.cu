#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate the global index
    int idx = blockIdx.z * n * size + blockIdx.y * size + blockDim.x * blockIdx.x + threadIdx.x;
    
    // Perform operation only if within bounds
    if(idx < n * size) {
        output[idx] *= biases[blockIdx.y];
    }
}