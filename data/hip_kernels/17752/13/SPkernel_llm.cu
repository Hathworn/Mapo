#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SPkernel(int k, int m, int n, float* searchPoints, float* referencePoints, int* indices)
{
    // Calculate global thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if tid is within the range
    if (tid < m) {
        int minIndex = -1;
        float minSquareSum = FLT_MAX; // Initialize to max float value for comparison
        
        // Iterate over all reference points
        for (int nInd = 0; nInd < n; nInd++) {
            float squareSum = 0.0f;
            
            // Compute the square of the differences
            for (int kInd = 0; kInd < k; kInd++) {
                float diff = searchPoints[k * tid + kInd] - referencePoints[k * nInd + kInd];
                squareSum += (diff * diff);
            }
            
            // Update minimum square sum and index
            if (squareSum < minSquareSum) {
                minSquareSum = squareSum;
                minIndex = nInd;
            }
        }
        indices[tid] = minIndex; // Store the index of the nearest reference point
    }
}