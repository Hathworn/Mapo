#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel(int k, int m, int n, float* searchPoints, float* referencePoints, int* indices)
{
    // Calculate thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread is within bounds
    if (tid < m) {
        float minSquareSum = FLT_MAX; // Use maximum float as initial min
        int minIndex = -1;

        // Iterate over all reference points
        for (int nInd = 0; nInd < n; nInd++) {
            float squareSum = 0.0f;

            // Vectorized computation using shared memory may be applied in real scenarios, if applicable
            for (int kInd = 0; kInd < k; kInd++) {
                float diff = searchPoints[k * tid + kInd] - referencePoints[k * nInd + kInd];
                squareSum += (diff * diff);
            }

            // Find minimum distance
            if (squareSum < minSquareSum) {
                minSquareSum = squareSum;
                minIndex = nInd;
            }
        }

        // Store the index of the closest reference point
        indices[tid] = minIndex;
    }
}