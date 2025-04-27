#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binaryTestingKernel ( int batchStart, int length, float* predictions, float* targets, int* result) {
    int instanceStart = batchStart + blockIdx.x * length;
    int indexEntry = instanceStart + threadIdx.x;
    
    // Use thread-level parallelism and guard for out-of-bounds
    if (indexEntry < instanceStart + length) {
        float prediction = predictions[indexEntry];
        float target = targets[indexEntry];
        result[indexEntry] = (prediction < 0.5 && target == 0.0) || (prediction >= 0.5 && target == 1.0);
    }
}