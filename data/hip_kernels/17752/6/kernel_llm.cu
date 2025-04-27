#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int k, int n, float* sub_searchPoints, float* referencePoints, float* dist)
{
    // Calculate thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (tid < n) {
        float squareSum = 0;
        // Unrolling loop to improve performance
        for (int i = 0; i < k; i += 4) {
            float diff1 = sub_searchPoints[i] - referencePoints[k * tid + i];
            float diff2 = sub_searchPoints[i + 1] - referencePoints[k * tid + i + 1];
            float diff3 = sub_searchPoints[i + 2] - referencePoints[k * tid + i + 2];
            float diff4 = sub_searchPoints[i + 3] - referencePoints[k * tid + i + 3];
            squareSum += (diff1 * diff1 + diff2 * diff2 + diff3 * diff3 + diff4 * diff4);
        }
        // Store result
        dist[tid] = squareSum;
    }
}