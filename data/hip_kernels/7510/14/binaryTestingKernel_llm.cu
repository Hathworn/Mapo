#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binaryTestingKernel(int batchStart, int length, float* predictions, float* targets, int* result) {
    int withinBatch = blockIdx.x;
    int threadId = threadIdx.x; // Get thread index
    int instanceStart = batchStart + withinBatch * length + threadId; // Offset by thread index
    int stride = blockDim.x; // Calculate stride

    // Use stride to handle multiple elements per thread
    for (int indexEntry = instanceStart; indexEntry < batchStart + (withinBatch + 1) * length; indexEntry += stride) {
        float prediction = predictions[indexEntry];
        float target = targets[indexEntry];

        result[indexEntry] = (prediction < 0.5 && target == 0.0) || (prediction >= 0.5 && target == 1.0);
    }
}