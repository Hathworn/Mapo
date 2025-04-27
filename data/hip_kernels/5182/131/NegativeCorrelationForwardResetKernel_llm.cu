```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NegativeCorrelationForwardResetKernel(float* outputPtr, int thisLayerSize) {
    // Calculate global thread index
    int j = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Check bounds and reset value
    if (j < thisLayerSize) {
        outputPtr[j] = 0.0f; // Use 0.0f for clarity and consistency with float type
    }
}