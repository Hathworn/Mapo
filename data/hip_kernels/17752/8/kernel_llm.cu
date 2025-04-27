#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int k, int n, float* sub_searchPoints, float* referencePoints, float* dist)
{
    float diff, squareSum = 0;
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < n) {
        float* refPoint = &referencePoints[k * tid]; // Cache memory access
        for (int i = 0; i < k; i++) {
            diff = sub_searchPoints[i] - refPoint[i];
            squareSum += (diff * diff);
        }
        dist[tid] = squareSum;
    }
}