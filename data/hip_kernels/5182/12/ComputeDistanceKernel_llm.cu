#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeDistanceKernel(float *symbolVectors, float *inputVector, float *distance, int symbolSize, int symbols) {
    // Calculate a unique index for each thread
    int symbolId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (symbolId < symbols) {
        float sum = 0.0f;

        // Use shared memory to optimize access time
        __shared__ float sharedInputVector[1024]; // Assuming symbolSize isn't larger than 1024
        if (threadIdx.x < symbolSize) {
            sharedInputVector[threadIdx.x] = inputVector[threadIdx.x];
        }
        __syncthreads();

        // Main computation using shared memory
        for (int i = 0; i < symbolSize; i++) {
            sum += symbolVectors[symbolId * symbolSize + i] * sharedInputVector[i];
        }

        // Storing result
        distance[symbolId] = sum;
    }
}