#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate the global index once outside the if condition
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    // Use globalIndex to eliminate separate calculation of offset
    if(globalIndex < size) 
    {
        int outputIndex = (batch * n + filter) * size + globalIndex; // Compute index
        output[outputIndex] *= biases[filter]; // Apply bias
    }
}