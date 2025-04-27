#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NegativeCorrelationForwardSumKernel(float* inputPtr, float* outputPtr, int thisLayerSize) {
// j: current layer neuron id
int j = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

if (j < thisLayerSize) {
    outputPtr[j] += inputPtr[j]; // Use atomic operations if necessary for concurrent writes
}
}