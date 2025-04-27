#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"
__global__ void deltasOne(float *inputs, float *outputs, float *weights, float *weightsDeltas, int offsetInputImages, int inputSize) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid >= inputSize) return; // Early exit if gid is out of bounds
    
    float sum = 0;
    int offsetDeltas = (inputSize + 1) * gid;
    int offsetInput = inputSize * (gid + offsetInputImages);

    // Initialize weightsDeltas with a single call to memset
    for (int imageIndex = 0; imageIndex <= inputSize; imageIndex++) {
        weightsDeltas[offsetDeltas + imageIndex] = 0;
    }

    // Use a single loop and accumulate
    for (int imageIndex = 0; imageIndex < inputSize; imageIndex++) {
        sum += inputs[offsetInput + imageIndex] * weights[imageIndex];
    }
    sum += weights[inputSize];
    sum = outputs[offsetInputImages + gid] - (sum > 0 ? 1 : 0);

    if (sum != 0) {
        for (int imageIndex = 0; imageIndex < inputSize; imageIndex++) {
            weightsDeltas[offsetDeltas + imageIndex] += sum * inputs[offsetInput + imageIndex];
        }
        weightsDeltas[offsetDeltas + inputSize] += sum;
    }
}