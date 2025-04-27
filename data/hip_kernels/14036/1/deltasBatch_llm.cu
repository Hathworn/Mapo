#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"
__global__ void deltasBatch(float *inputs, float *outputs, float *weights, float *weightsDeltas, int noInputs, int inputSize) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0;
    int offsetDeltas = (inputSize + 1) * gid;
    int offsetInput = noInputs * inputSize * gid;
    int offsetOutputs = noInputs * gid;

    // Initialize weightsDeltas to zero using one thread per element
    for (int imageIndex = threadIdx.x; imageIndex <= inputSize; imageIndex += blockDim.x) {
        weightsDeltas[offsetDeltas + imageIndex] = 0;
    }
    __syncthreads(); // Ensure all initializations are complete

    for (int i = 0; i < noInputs; i++) {
        sum = 0;
        // Optimize weighted sum calculation by using a single loop
        for (int imageIndex = 0; imageIndex < inputSize; imageIndex++) {
            sum += inputs[offsetInput + i * inputSize + imageIndex] * weights[imageIndex];
        }
        sum += weights[inputSize];
        sum = (sum > 0) ? 1 : 0; // Simplified ternary operation
        sum = outputs[offsetOutputs + i] - sum;

        if (sum != 0) {
            // Update weightsDeltas using strided access pattern
            for (int imageIndex = threadIdx.x; imageIndex < inputSize; imageIndex += blockDim.x) {
                atomicAdd(&weightsDeltas[offsetDeltas + imageIndex], sum * inputs[offsetInput + i * inputSize + imageIndex]);
            }
            if (threadIdx.x == 0) {
                atomicAdd(&weightsDeltas[offsetDeltas + inputSize], sum);
            }
        }
    }
}