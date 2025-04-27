#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel2(int k, int n, float* sub_searchPoints, float* referencePoints, float* dist)
{
    // Calculate unique thread identifier
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure within bounds
    if (tid < n) {
        float squareSum = 0;

        // Use shared memory for sub_searchPoints
        __shared__ float shared_searchPoints[1024]; // Assume max k is 1024
        if (threadIdx.x < k) {
            shared_searchPoints[threadIdx.x] = sub_searchPoints[threadIdx.x];
        }
        __syncthreads(); // Synchronize threads

        for (int i = 0; i < k; i++) {
            float diff = shared_searchPoints[i] - referencePoints[k * tid + i];
            squareSum += (diff * diff);
        }
        dist[tid] = squareSum;
    }
}