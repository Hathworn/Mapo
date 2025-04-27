#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel4(int k, int n, int bias, float* searchPoints, float* referencePoints, float* dist)
{
    // Cache tid to avoid recalculating it repeatedly
    const int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure this thread is within bounds
    if (tid < n) {
        // Use register to store square sum for faster access
        float squareSum = 0;

        // Use constant memory for bias multiplication to enhance memory access speed
        const int baseIndexSearch = k * bias;
        const int baseIndexRef = k * tid;
        
        // Iterate over dimensions using optimized memory access
        for (int i = 0; i < k; i++) {
            float diff = searchPoints[baseIndexSearch + i] - referencePoints[baseIndexRef + i];
            squareSum += diff * diff;
        }
        
        // Store the result in the output array
        dist[bias * n + tid] = squareSum;
    }
}