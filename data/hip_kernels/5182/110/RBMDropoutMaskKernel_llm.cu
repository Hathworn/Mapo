#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RBMDropoutMaskKernel(float *maskPtr, float dropout, int thisLayerSize) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (index < thisLayerSize) {
        maskPtr[index] = dropout < maskPtr[index]; // Perform computation
    }
}