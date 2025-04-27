#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel1(int k, int m, int n, float* searchPoints, float* referencePoints, int* indices)
{
    extern __shared__ float sharedSearchPoints[]; // Use shared memory for search points
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int localTid = threadIdx.x;
    
    // Each block loads a subset of searchPoints into shared memory
    if (tid < m) {
        for (int i = localTid; i < k; i += blockDim.x) {
            sharedSearchPoints[i] = searchPoints[k * tid + i];
        }
    }
    __syncthreads();
   
    if (tid < m) {
        float minSquareSum = INFINITY;
        int minIndex = -1;

        // Iterate over all reference points
        for (int nInd = 0; nInd < n; nInd++) {
            float squareSum = 0.0f;
            // Compute difference using shared memory
            for (int kInd = 0; kInd < k; kInd++) {
                float diff = sharedSearchPoints[kInd] - referencePoints[k * nInd + kInd];
                squareSum += (diff * diff);
            }
            // Update the minimum square sum and index
            if (squareSum < minSquareSum) {
                minSquareSum = squareSum;
                minIndex = nInd;
            }
        }
        indices[tid] = minIndex;
    }
}