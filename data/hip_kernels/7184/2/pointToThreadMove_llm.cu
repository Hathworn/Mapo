#include "hip/hip_runtime.h"
#include "includes.h"

#define DIMENSIONS 2
#define GPU_DEVICE_ZERO 0

__global__ void pointToThreadMove(int pointsCounter, int threadsInsideBlock, double dt, double *pointsInGpu, double *speedArrayInGpu)
{
    // Calculate global thread ID once
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    if (globalThreadId < pointsCounter)
    {
        // Use a loop unrolling technique to enhance performance
        #pragma unroll
        for (int indexInArray = 0; indexInArray < DIMENSIONS; ++indexInArray)
        {
            // Precompute the index to reduce redundant calculation
            int currentGpuPoint = globalThreadId * DIMENSIONS + indexInArray;
            pointsInGpu[currentGpuPoint] += speedArrayInGpu[currentGpuPoint] * dt;
        }
    }
}