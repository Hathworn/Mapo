```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AvgCentroidCoordinatesKernel(float *centroidCoordinates, float *pointsWeight, int inputSize, int centroids) {
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread ID calculation

    if (threadId < centroids * 2) {
        float weight = pointsWeight[threadId / 2]; // Load weight only once
        if (weight == 0.00f) {
            centroidCoordinates[threadId] = 0.00f;
        } else {
            centroidCoordinates[threadId] /= weight; // Division with preloaded weight
        }
    }
}