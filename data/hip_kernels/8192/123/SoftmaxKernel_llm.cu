#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SoftmaxKernel(float *outputPtr, float expSum, int layerSize) {
    // Calculate global thread index using 2D grid for better dimensionality 
    int i = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // If the global index is within bounds, normalize the softmax values
    if (i < layerSize) {
        outputPtr[i] /= expSum;
    }
}