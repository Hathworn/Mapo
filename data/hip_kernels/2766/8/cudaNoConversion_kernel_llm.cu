#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaNoConversion_kernel(float * data, float * tickOutputsTraces, float * tickOutputsTracesLearning, float scaling, unsigned int inputDimX, unsigned int inputDimY, unsigned int inputDimZ)
{
    const unsigned int inputSize = inputDimX * inputDimY * inputDimZ;
    const unsigned int batchOffset = blockIdx.x * inputSize;
    const unsigned int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process entire data set by utilizing all threads efficiently
    for (unsigned int idx = globalIdx; idx < inputSize; idx += gridDim.x * blockDim.x) {
        float value = data[idx + batchOffset];
        tickOutputsTraces[idx + batchOffset] = scaling * value;
        tickOutputsTracesLearning[idx + batchOffset] += scaling * value;
    }
}