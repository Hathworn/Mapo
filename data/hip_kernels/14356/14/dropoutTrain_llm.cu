#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"
__global__ void dropoutTrain(const float* arguments, float* dropoutMask, float* results, const float dropoutFraction, const long size) {
    // Calculate global thread index within the grid
    const int index = blockIdx.x + blockIdx.y * gridDim.x + threadIdx.x * gridDim.x * gridDim.y;

    // Ensure the thread operates within the bounds of the data
    if(index < size) {
        // Calculate dropout mask and apply it simultaneously to the results
        dropoutMask[index] = dropoutMask[index] > dropoutFraction;
        results[index] = dropoutMask[index] * arguments[index];
    }
}