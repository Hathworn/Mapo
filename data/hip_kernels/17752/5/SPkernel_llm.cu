#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SPkernel(int k, int m, int n, float* searchPoints, float* referencePoints, int* indices)
{
    extern __shared__ float sharedReferencePoints[]; // Shared memory for reference points
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int threadLane = threadIdx.x;
    
    if (tid < m) {
        float minSquareSum = FLT_MAX; // Use max float value for comparison
        int minIndex = -1;

        // Iterate over all reference points in blocks
        for (int nStart = 0; nStart < n; nStart += blockDim.x) {
            // Load reference points into shared memory
            if (nStart + threadLane < n) {
                for (int offset = 0; offset < k; ++offset) {
                    sharedReferencePoints[threadLane * k + offset] = referencePoints[(nStart + threadLane) * k + offset];
                }
            }
            __syncthreads(); // Ensure all threads have loaded data

            // Compare current search point with reference points in shared memory
            for (int nInd = 0; nInd < blockDim.x && (nStart + nInd) < n; ++nInd) {
                float squareSum = 0;
                for (int kInd = 0; kInd < k; kInd++) {
                    float diff = searchPoints[tid * k + kInd] - sharedReferencePoints[nInd * k + kInd];
                    squareSum += (diff * diff);
                }
                if (squareSum < minSquareSum) {
                    minSquareSum = squareSum;
                    minIndex = nStart + nInd;
                }
            }
            __syncthreads(); // Ensure all thread calculations are done before next load
        }
        indices[tid] = minIndex;
    }
}